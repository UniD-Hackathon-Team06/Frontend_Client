import 'package:flutter/material.dart';
import 'package:frontendclient/colors/color.dart';
import 'package:frontendclient/login.dart';

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
      home: HomePage(),
    );
  }
}

// HomePage를 StatefulWidget으로 변경
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1; // 현재 선택된 탭 인덱스

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
      body: Column(
      mainAxisAlignment: MainAxisAlignment.start,

      children: <Widget>[

        Container(
          alignment: Alignment.topLeft,
          width: 223,
          height: 58,
          child: Text(
            'SilverCare.',
            style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.w700,
                color: Color(DefinedColor.lightblue),
                fontFamily: 'Pretendard'),
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬을 위해 추가
            children: [
              Container(
                alignment: Alignment.center,
                width: 63,
                height: 40,
                child: Text(
                  '노태윤',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontFamily: 'Pretendard',
                  ),
                ),
              ),
              // 두 번째 Container에 자식 위젯이 필요합니다.
              // 예시로 Text 위젯을 추가했습니다.
              Container(
                alignment: Alignment.center,
                width: 130,
                height: 40,
                child: Text(
                  '님 환영합니다.',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontFamily: 'Pretendard',
                  ),
                ),
              ),
            ],
          ),
        ),
       SizedBox(height:20),
       Container(
         width: 340,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
             Column(
                 mainAxisSize: MainAxisSize.min, // Column 크기를 자식에 맞춤
               children:[
              Text('날짜',
             style: TextStyle(
               fontSize: 25,
               fontWeight: FontWeight.w600,
               fontFamily: 'Pretendard',
               color: Colors.grey,
             ),),
              SizedBox(height: 10,),
              Text('2023.11.11',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Pretendard',
              ),),
             ]),
              Icon(Icons.cloud, size: 48.0), // 구름 아이콘
            ],
          ),
        ),
SizedBox(height:40),
Container(
      width: 340,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
              mainAxisSize: MainAxisSize.min, // Column 크기를 자식에 맞춤
              children:[
                Text('강수 확률이 높아요\n우산을 챙기세요',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Pretendard-Medium',
                  ),),
              ]),
          Container(
            width: 45,
            height: 100,
            child: Image.asset('assets/images/granddaddy.png'),
          )

        ],
      ),
    ),
        SizedBox(height:40),
        Container(
          width: 340,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                  mainAxisSize: MainAxisSize.min, // Column 크기를 자식에 맞춤
                  children:[
                    Text('매니저님과 안부인사 \n 나눌 시간이에요',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Pretendard-Medium',
                      ),),
                  ]),
              Container(
                width: 50,
                height: 100,
                child: Image.asset('assets/images/carer.png'),
              )

            ],
          ),
        ),
      ],
    ),
      // BottomNavigationBar 추가
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
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(DefinedColor.lightblue),
        onTap: _onItemTapped,
      ),
    );
  }
}
