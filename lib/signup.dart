import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontendclient/colors/color.dart';
import 'package:frontendclient/login.dart';
import 'package:http/http.dart' as http;

import 'config/config_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String? _selectedAge;
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
String name = '';
String password = '';
String address='';
String age = '';
String call ='';


class _UserInfoFormState extends State<UserInfoForm> {
  final _formKey = GlobalKey<FormState>();

  Future<void> _sendPostRequest() async {
    var url = Uri.parse(API.signup);
    //API.sendphone
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({
        "name": name,
        "password": password,
        "address": address,
        "call": call,
        "age": age
      }), // JSON 형태로 인코딩
    );

    if (response.statusCode == 200) {
      // 서버로부터 응답이 성공적으로 돌아온 경우 처리
      print('Server returned OK');
      print('Response body: ${response.body}');
      // JSON 응답을 디코드합니다.

      // "result"와 "access_token" 값을 추출합니다.

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );

    } else {
      // 오류가 발생한 경우 처리
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
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
  void InputAddress(String value) {
    setState(() {
      address = value;
    });
  }

  @override
  void InputAge(String value) {
    setState(() {
      age = value;
    });
  }

  @override
  void InputCall(String value) {
    setState(() {
      call = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

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
                height: 45,
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
                  onChanged: (value) {
                    InputName(value);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: '주소',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.home),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '주소를 입력해주세요.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    InputAddress(value);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: '나이',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.access_time_filled),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '나이를 입력해주세요.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    InputAge(value);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: '연락처',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.account_box_rounded),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '연락처를 입력해주세요.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    InputCall(value);
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
              SizedBox(height: 20,),

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
                      _sendPostRequest();
                  // if(isregistered) {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) =>
                  //         LoginPage()), // RegisterScreen()을 새로운 화면으로 변경하세요.
                  //   );
                  // }
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
