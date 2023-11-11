import 'package:flutter/material.dart';
import 'package:frontendclient/colors/color.dart';
import 'package:frontendclient/home.dart';
import 'package:frontendclient/mainApp.dart';
import 'package:frontendclient/signup.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

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
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/firstlogo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                width: 200,
                height: 120,
                child: Text(
                  'SilverCare',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: Color(DefinedColor.lightblue),
                      fontFamily: 'Pretendard'),
                ),
              ),
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
                        .showSnackBar(SnackBar(content: Text('로그인 처리 중...')));
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()), // RegisterScreen()을 새로운 화면으로 변경하세요.
                    );
                  }
                },
                child: Text('로그인',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              ),

              SizedBox(height: 10,),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserInfoForm()), // RegisterScreen()을 새로운 화면으로 변경하세요.
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 50,
                  child: Text(
                    '회원가입',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(DefinedColor.lightblue), // 여기서 색상을 직접 정의해야 합니다.
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
