import 'package:flutter/material.dart';
import 'package:frontendclient/colors/color.dart';
import 'package:frontendclient/home.dart';
import 'package:frontendclient/login.dart';
import 'package:frontendclient/mainApp.dart';
import 'package:frontendclient/signup.dart';

import 'message.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String? _selectedAge;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MessageDetailPage(),
    );
  }
}

class MessageDetailPage extends StatefulWidget {
  @override
  _MessageDetailPageState createState() => _MessageDetailPageState();
}

class _MessageDetailPageState extends State<MessageDetailPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar:AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              } else {
                // 첫 페이지에서는 종료할 수 있도록 하거나 다른 동작을 수행합니다.
                // 예: SystemNavigator.pop()을 사용하여 앱을 종료할 수 있습니다.
              }
            },
          ),
        ),

        body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              Container(
                alignment: Alignment.topLeft,
                width: 200,
                height: 50,
                child: Text(
                  '2023-11-10 오전인사',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: (Colors.black),
                      fontFamily: 'Pretendard'),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                width: 200,
                height: 45,
                child: Text(
                  '매니저 안부 인사 내용',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: (Colors.black),
                      fontFamily: 'Pretendard'),
                ),
              ),
              Container(
                height: 150,
                margin: EdgeInsets.only(bottom: 20.0),
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0), // 내부 여백 추가
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey), // 테두리 색상
                  borderRadius: BorderRadius.circular(8.0), // 모서리 둥글기
                ),
                alignment: Alignment.topLeft, // 텍스트를 상단 왼쪽에 정렬
                child: Text(
                  '안녕하세요 매니저 김삼순입니다. 날씨가 쌀쌀한데 어떻게 지내시나 궁금하여 안부인사 드립니다.',
                  style: TextStyle(
                    fontSize: 25, // 폰트 크기
                    // 필요하다면 여기에 폰트 스타일 추가
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                width: 200,
                height: 45,
                child: Text(
                  '답장하기',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: (Colors.black),
                      fontFamily: 'Pretendard'),
                ),
              ),
              Container(
                height: 150,
                margin: EdgeInsets.only(bottom: 20.0),
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0), // 내부 여백 추가
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey), // 테두리 색상
                  borderRadius: BorderRadius.circular(8.0), // 모서리 둥글기
                ),
                alignment: Alignment.topLeft, // 텍스트를 상단 왼쪽에 정렬
                child: Text(
                  '나는 아주 잘 지내오.고맙소. 하하. 즐거운 하루 보내소',
                  style: TextStyle(
                    fontSize: 25, // 폰트 크기
                    // 필요하다면 여기에 폰트 스타일 추가
                  ),
                ),
              ),

              Container(
                height: 48,
                width: 350,
                child:
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(DefinedColor.lightblue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 0,
                    padding: EdgeInsets.all(0),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // 로그인 로직 처리
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainScreen()), // RegisterScreen()을 새로운 화면으로 변경하세요.
                      );
                    }
                  },
                  child: Text('답장하기',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
