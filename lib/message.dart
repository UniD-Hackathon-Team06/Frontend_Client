import 'package:flutter/material.dart';
import 'package:frontendclient/colors/color.dart';

import 'messagedetail.dart';
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
      home: MessagePage(),
    );
  }
}

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final List<Map<String, String>> messages = [
    {'date': '2023-11-10', 'greeting': '오전 인사'},
    {'date': '2023-11-10', 'greeting': '오후 인사'},
    {'date': '2023-11-10', 'greeting': '저녁 인사'},
    {'date': '2023-11-11', 'greeting': '오전 인사'},
    {'date': '2023-11-11', 'greeting': '오후 인사'},
    {'date': '2023-11-11', 'greeting': '저녁 인사'},
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text('홈 페이지'),
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MessageDetailPage()),
                );
              },
              child: ListTile(
                leading: Container(
                  width: 32.8, // 이미지의 너비 설정
                  height: 50, // 이미지의 높이 설정
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/carer.png'),
                      fit: BoxFit.fill, // 이미지가 컨테이너 영역을 가득 채우도록 설정
                    ),
                    borderRadius: BorderRadius.circular(8), // 이미지의 모서리를 약간 둥글게
                  ),
                ),
                subtitle: Text(messages[index]['date']!+' '+ messages[index]['greeting']!),
                title: Text('실버케어 매니저 김삼순'),
                trailing: Icon(Icons.message),
              ),
            ),
          );

        },
      ),

    );
  }
}
