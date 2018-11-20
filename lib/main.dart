import 'package:flutter/material.dart';
import 'package:flutteruitutorial1/login_page.dart';
import 'auth.dart';
import 'root_page.dart';

void main() => runApp(QuickBee());

class QuickBee extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      title: 'My App',
      home: RootPage(auth: new Auth())
    );
  }
}