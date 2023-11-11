import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontendclient/colors/color.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
      home: ProfilePage(),
    );
  }

}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
   String name = '';
   String address = '';
   String age = '';
   String call = '';
  final _formKey = GlobalKey<FormState>();
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
  Future<void> _sendGetRequest() async {
    var url = Uri.parse(API.ME);
    String savedToken = await getToken();
    var response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $savedToken',

      },
      // JSON 형태로 인코딩
    );
    if (response.statusCode == 200) {
      print('Server returned OK');
      print('Response body: ${response.body}');

      var data = json.decode(response.body);
      var userData = data['user'];

      setState(() {
        name = userData['name'];
        address = userData['address'];
        age = userData['age'].toString(); // int를 String으로 변환
        call = userData['call'];
      });
    } else {
      _showLoginFailedDialog();
    }
  }
  void _showLoginFailedDialog({String message = '유효하지 않은 정보이거나, 비밀번호가 틀렸습니다.'}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('로그인 실패'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('닫기'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  void initState() {
    super.initState();
    _sendGetRequest();
  }
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
                height: 45,
                child: Text(
                  '프로필',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: (Colors.black),
                      fontFamily: 'Pretendard'),
                ),
              ),

              Text(
                '이름',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: (Colors.black),
                    fontFamily: 'Pretendard'),
              ),
              SizedBox(height: 5,),
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  name,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Text(
                '주소',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: (Colors.black),
                    fontFamily: 'Pretendard'),
              ),
              SizedBox(height: 5,),
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  address,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Text(
                '나이',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: (Colors.black),
                    fontFamily: 'Pretendard'),
              ),
              SizedBox(height: 5,),

              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  age,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Text(
                '연락처',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: (Colors.black),
                    fontFamily: 'Pretendard'),
              ),
              SizedBox(height: 5,),
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  call,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),

              SizedBox(height: 80,),

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
                      Navigator.pop(context);
                    }
                  },
                  child: Text('뒤로가기',
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
