import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';
import 'package:toonflix/services/api_service.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key}); //이 위젯의 Keyfmf statelessWidget (슈퍼 클래스)에 보냄
//key는 뭐...위젯을 식별하기 위한 id 같은 거 뭐 리액트에서 해서 알잖아

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
