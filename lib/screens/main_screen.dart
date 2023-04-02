import 'package:flutter/material.dart';
import '../config/palette.dart';

class LoginSignUpScreen extends StatefulWidget {
  const LoginSignUpScreen({Key? key}) : super(key: key);

  @override
  State<LoginSignUpScreen> createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  bool isSignupScreen = false;
  // TODO : isSignupScreen 변수 선언
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.backgroundColor,
        // TODO : background color로 palette의 backgroundColor 설정,
        body: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                // TODO : top, left, right 모두0으로 설정
                child: Container(
                  height: 300,
                  // TODO : height 300으로 설정
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/background.png"),
                        // TODO : background.png 넣기
                        fit: BoxFit.fill),
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 90, 0, 0),
// TODO : padding top 90, left 20
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //column은 세로니까 가로로 바꾸고, 가로에서 시작 부분으로 정렬
                      //https://velog.io/@steadygo247/FlutterRowColumn-%EC%A0%95%EB%A0%ACMainAxisAlignment-CrossAxisAlignment-%EC%A0%95%EB%A6%AC
                      // TODO : 왼쪽 정렬,
                      children: [
                        RichText(
                          //문자 style 별도로 제어하기
                            text: TextSpan(
                                text: 'Welcome ',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  letterSpacing: 1.0,
                                ),
// TODO : letter spacing 1.0, font size 25, color white
                                children: [
                                  TextSpan(
                                      text: isSignupScreen? 'to EOS chat' : 'back',
                                      style: TextStyle(
                                        letterSpacing: 1.0,
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ))
//TODO : letter spacing 1.0, font size 25, color white, bold
                                ])),
                        SizedBox(
                          height: 5.0,
// TODO : height 5.0으로 글 사이 간격 주기
                        ),
                        Text(
                          isSignupScreen? 'Signup to continue': 'Signin to continue',
                          style: TextStyle(
                            letterSpacing: 1.0,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                )),
// TODO : spacing 1.0, color white
            Positioned(
                top: 160,
// TODO : top 150
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  height: isSignupScreen? 280.0 : 250.0,
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width - 40,
                  margin: EdgeInsets.only(left: 20),
// TODO : height 280.0, padding 모두 20, width 핸드폰 가로 길이 – 40
// TODO : margin 가로로 양쪽 20
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
// TODO : color white, border radius 15
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 15,
                          spreadRadius: 5,
// TODO : color black, 투명도 0.3, blur radius 15, spread radius 5
                        )
                      ]),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
// TODO : mainAxisAlignment.spaceAround
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                'LOGIN',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isSignupScreen
                                      ? Palette.textColor1
                                      : Palette.activeColor,
                                ),
                              ),
// TODO : font size 16, bold
// TODO : isSignupScreen이 true면 palette의 activeColor, false면 palette의 textColor1
// TODO : isSigunupScreen이 false일 때만 밑줄이 생기도록
                              if (!isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.green,
                                )
                            ],
                          ),
                        ),
// TODO : margin top만 3, height 2, width 55, color green
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                isSignupScreen = true;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  'SIGNUP',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1,
                                  ),
                                ),
// TODO : font size 16, bold
// TODO : isSignupScreen이 true면 palette의 activeColor, false면 palette의 textColor1
// TODO : isSigunupScreen이 true일 때만 밑줄이 생기도록
                                if (isSignupScreen)
                                  Container(
                                    margin: EdgeInsets.only(top: 3),
                                    height: 2,
                                    width: 55,
                                    color: Colors.green,
                                  )
                              ],
                            ))
                      ],
                    ),
                    // TODO : margin top만 3, height 2, width 55, color green
                    Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Form(
                          child: Column(children: [
                            if(isSignupScreen)
                              TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.account_circle),
                                  hintText: 'User name',
                                  prefixIconColor: Palette.iconColor,
// TODO : prefix icon 원하는 icon 입력, color는 palette의 iconColor
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(35),
                                    borderSide: BorderSide(color: Palette.textColor1),
// TODO : borderside 색은 palette의 textColot1
// TODO : border radius는 모두 35
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Palette.textColor1),
                                    borderRadius: BorderRadius.circular(35),
// TODO : borderside 색은 palette의 textColot1
// TODO : border radius는 모두 35
                                  ),
                                ),
                              ),
                            SizedBox(height:isSignupScreen? 8: 0,),
                            TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                prefixIconColor: Palette.iconColor,
                                hintText: 'email',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35),
                                  borderSide: BorderSide(color: Palette.textColor1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Palette.textColor1),
                                  borderRadius: BorderRadius.circular(35),
                                ),
                              ),
                            ),
                            SizedBox(height: 8,),
                            TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                hintText: 'password',
                                prefixIconColor: Palette.iconColor,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35),
                                  borderSide: BorderSide(color: Palette.textColor1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Palette.textColor1),
                                  borderRadius: BorderRadius.circular(35),
                                ),
                              ),
                            ),
                          ]),
                        ))
                  ]),
                )
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              top: isSignupScreen? 410:370,
              right: 0,
              left: 0,
              child: Center(
                child: Container(
                  height: 90,
                  width: 90,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.lightGreen, Colors.green],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0,1),
                          )
                        ]
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).size.height - 80,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    Text(
                      isSignupScreen ? 'or Signin with' : 'or Signup with',
                      style: TextStyle(
                        fontSize: 18,

                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Palette.googleColor,
                          minimumSize: Size(155, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                      ),
                      icon: Icon(Icons.add),
                      label: Text('Google'),
                    )
                  ],
                )
            )
          ],
        ));
  }
}
// Image.asset('images/eos_logo.png', width: 50, height: 50,), 요런식으로 선언하기
// font에서 ttf는 맥북은 안됨. otf
