import 'package:flutter/material.dart';
import 'package:frontendclient/login.dart';
import 'package:frontendclient/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'colors/color.dart';
// StatefulWidget으로 변경합니다.
class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}
class _MyPageState extends State<MyPage>{
  bool _personalInfo = false;
  bool _loginAndSecurity = false;
  bool _notificationSettings = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
          backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 이름 표시
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                  child: Container(
                    height: 120,
                    width: 340,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // 이미지 추가
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/firstlogo.png'),
                            ),
                          ),
                        ),
                        // 텍스트
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '노태윤님',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 6,),
                            Text(
                              '프로필 열기',
                              style: TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                        Icon(Icons.add),
                      ],
                    ),
                  ),
                ),

                // 버튼 추가
              ],
            ),


            SizedBox(height: 20),
            // 계정 관리 섹션
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '계정관리',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SwitchListTile(
                    title: Text('개인 정보'),
                    value: _personalInfo,
                    onChanged: (bool newvalue) {
                      setState(() {
                        _personalInfo = newvalue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text('로그인 및 보안'),
                    value: _loginAndSecurity,
                    onChanged: (bool value) {
                      setState(() {
                        _loginAndSecurity = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text('알림 설정'),
                    value: _notificationSettings,
                    onChanged: (bool value) {
                      setState(() {
                        _notificationSettings = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            // 도움말 섹션
            SizedBox(height: 100,),
            // 로그아웃 버튼
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
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.remove('signupToken'); // Remove the token from SharedPreferences
                  print('Token removed');

                  // Navigate to the LoginPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },

                child: Text('로그아웃',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyPage(),
  ));
}
