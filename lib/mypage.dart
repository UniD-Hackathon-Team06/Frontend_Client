import 'package:flutter/material.dart';
import 'package:frontendclient/login.dart';

import 'colors/color.dart';

class MyPage extends StatelessWidget {
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
                Container(
                  height: 120,
                  width:340,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 중앙 정렬을 위해 추가

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
                        mainAxisAlignment: MainAxisAlignment.center, // 중앙에 배치
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
                      Icon(Icons.add)
                    ],
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
                  ListTile(title: Text('개인 정보')),
                  ListTile(title: Text('로그인 및 보안')),
                  ListTile(title: Text('알림 설정')),
                ],
              ),
            ),
            // 도움말 섹션

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
                onPressed: () {
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()), // RegisterScreen()을 새로운 화면으로 변경하세요.
                    );
                  }
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
