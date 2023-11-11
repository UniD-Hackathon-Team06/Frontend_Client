import 'package:flutter/material.dart';
import 'package:frontendclient/colors/color.dart';
// 기타 필요한 import 구문들...

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text('홈 페이지'),
      ),
      body: ListView.builder(
        itemCount: 5, // 예시로 5개의 카드를 생성, 실제 데이터 수에 맞게 조정 필요
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/granddaddy.png'),
                radius: 30,
              ),
              title: Text('실버케어 메시지'),
              subtitle: Text('2023-11-10 오전 인사'),
              trailing: Icon(Icons.more_vert),
            ),
          );
        },
      ),

    );
  }
}
