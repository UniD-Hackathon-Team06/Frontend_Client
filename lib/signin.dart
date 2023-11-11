import 'package:flutter/material.dart';
import 'package:frontendclient/colors/color.dart';
import 'package:frontendclient/home.dart';
import 'package:frontendclient/login.dart';
import 'package:frontendclient/signin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserInfoForm(),
    );
  }
}

class UserInfoForm extends StatefulWidget {
  @override
  _UserInfoFormState createState() => _UserInfoFormState();
}

class _UserInfoFormState extends State<UserInfoForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white, //appBar 투명색
        elevation: 0.0,
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
                height: 80,
                child: Text(
                  '다음 정보를 입력해 주세요.',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: (Colors.black),
                      fontFamily: 'Pretendard'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: '이름',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.account_circle),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '이름을 입력해주세요.';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 40,),
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: '아이디',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '아이디를 입력해주세요.';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 40,),
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: '비밀번호',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '비밀번호를 입력해주세요.';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 120,),

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
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('회원가입 처리 중...')));

                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()), // RegisterScreen()을 새로운 화면으로 변경하세요.
                    );
                    }
                  },
                  child: Text('회원가입',
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
