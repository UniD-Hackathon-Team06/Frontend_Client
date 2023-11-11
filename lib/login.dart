import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontendclient/colors/color.dart';
import 'package:http/http.dart' as http;
import 'package:frontendclient/mainApp.dart';
import 'package:frontendclient/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config/config_app.dart';


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
  String name = '';
  String password = '';

  @override
  _LoginPageState createState() => _LoginPageState();
}

Future<void> saveToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('signupToken', token);
  // 저장된 값을 확인하기 위해 바로 불러옵니다.
  String savedToken = prefs.getString('signupToken') ?? 'No Token';
  print('Saved Token: $savedToken'); // 콘솔에 출력하여 확인
}

// 저장된 토큰을 불러오는 함수
Future<String> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  // 'signupToken' 키를 사용하여 저장된 토큰 값을 가져옵니다.
  // 값이 없을 경우 'No Token'을 반환합니다.
  String token = prefs.getString('signupToken') ?? 'No Token';
  return token;
}

class _LoginPageState extends State<LoginPage> {
  String _errorMessage = '';  // 오류 메시지를 저장할 변수
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  Future<void> _sendPostRequest() async {
    var url = Uri.parse(API.login);
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({
        "name": name,
        "password": password,
      }), // JSON 형태로 인코딩
    );

    if (response.statusCode == 200) {
      // 서버로부터 응답이 성공적으로 돌아온 경우 처리
      print('Server returned OK');
      print('Response body: ${response.body}');

      var data =json.decode(response.body);
      var result = data['result'];


      if(result=='success'){
        String accessToken = data['access_token'];
        await saveToken(accessToken);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );}
      setState(() {
        _errorMessage = '로그인에 실패하였습니다.';
      });

    } else {
      setState(() {
        _errorMessage = '로그인에 실패하였습니다.';
      });
      // 오류가 발생한 경우 처리
      setState(() {
        _errorMessage = '로그인에 실패하였습니다.';
      });
    }
  }
  void _showLoginFailedDialog({String message = 'Invalid username or password'}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login Failed'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void InputName(String value) {
    setState(() {
      name = value;
    });
  }
  @override
  void InputPassword(String value) {
    setState(() {
      password = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Scaffold에 GlobalKey 할당
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
                  onChanged: (value) {
                    InputName(value);
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
                  onChanged: (value) {
                    InputPassword(value);
                  },
                ),
              ),

          Visibility(
            visible: _errorMessage.isNotEmpty,  // _errorMessage가 비어있지 않을 때만 보여집니다.
            child: Text(
              _errorMessage,
              style: TextStyle(color: Colors.red),
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
                    _sendPostRequest();
                    // 로그인 로직 처리
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
