import 'package:cooking_app/auth/views/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cooking Recipe',
      theme: ThemeData(
        primaryColor: const Color(0xFF5AC086),
        fontFamily: 'Lato',
      ),
      home: const LoginPage(),
    );
  }
}
