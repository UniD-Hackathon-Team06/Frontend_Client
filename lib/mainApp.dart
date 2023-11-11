// main_screen.dart
import 'package:flutter/material.dart';
import 'home.dart';
import 'message.dart';
import 'mypage.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // 현재 선택된 탭 인덱스

  // 각 인덱스에 해당하는 페이지 위젯들을 리스트로 관리합니다.
  final List<Widget> _pageOptions = [
    MessagePage(), // 인덱스 0
    HomePage(),    // 인덱스 1
    MyPage(),   // 인덱스 2, 마이페이지 위젯을 추가하면 됩니다.
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // 선택된 탭의 인덱스를 업데이트
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions.elementAt(_selectedIndex), // 현재 선택된 페이지를 보여줌
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            label: '안부인사',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '마이페이지',
          ),
          // 여기에 다른 BottomNavigationBarItem을 추가할 수 있습니다.
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
