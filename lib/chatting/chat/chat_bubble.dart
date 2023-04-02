import 'package:eos_chatting/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}
class _ChatScreenState extends State<ChatScreen> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text(
            'Chat Screen',
        ),
        centerTitle: true,
        actions: [
          Icon(Icons.input),
          SizedBox(width: 10,)
        ],
        backgroundColor: Palette.chatColor,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('/chats/WNXkd5XyXhmA56Nj65x0/message').snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final docs = snapshot.data!.docs;
          return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    docs[index]['text'].toString(),
                      style: TextStyle(fontSize: 20.0),
                  )
                );
              }
          );
        },
      ),
    );
  }
}