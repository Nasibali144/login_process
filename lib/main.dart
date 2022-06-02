import 'package:flutter/material.dart';
import 'package:login_process/pages/login_page.dart';
import 'package:login_process/services/const_service.dart';

void main() {
  runApp(const LoginProcessApp());
}

class LoginProcessApp extends StatelessWidget {
  const LoginProcessApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppConstants.colorBackground
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        LoginPage.id: (context) => LoginPage(),
      },
    );
  }
}
