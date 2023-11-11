import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontendclient/colors/color.dart';
import 'package:http/http.dart' as http;

import 'config/config_app.dart';
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
  List<Map<String, dynamic>> comemessages = []; // 메시지를 저장할 리스트

  final List<Map<String, String>> messages = [
    {"id": "1",'date': '2023-11-10', 'greeting': '오전 인사'},
    {"id": "2",'date': '2023-11-10', 'greeting': '오후 인사'},
    {"id": "3",'date': '2023-11-10', 'greeting': '저녁 인사'},
    {"id": "4",'date': '2023-11-11', 'greeting': '오전 인사'},
    {"id": "5",'date': '2023-11-11', 'greeting': '오후 인사'},
    {"id": "6",'date': '2023-11-11', 'greeting': '저녁 인사'},
  ];
  Future<void> _sendGetRequest() async {
    var url = Uri.parse(API.getmessages);
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
      var data = json.decode(response.body) as List;
      setState(() {
        comemessages = data.map((messageJson) => {
          "id": messageJson["id"],
          "message": messageJson["message"]
        }).toList();
      });
      print(comemessages);
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
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  void initState() {
    super.initState();
    _sendGetRequest();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('안부인사'),
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
                  MaterialPageRoute(
                    builder: (context) => MessageDetailPage(
                      messageData: {
                        "message": comemessages[index]['message']!, // 'message' 키가 있는 것으로 가정
                        "title":messages[index]['date']!+ ' '+messages[index]['greeting']!,
                      },
                    ),
                  ),
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
