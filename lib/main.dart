import 'package:flutter/material.dart';
import 'auth.dart';
import 'root_page.dart';
import 'auth_provider.dart';

void main() => runApp(QuickBee());

class QuickBee extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      auth: Auth(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Colors.blue),
          title: 'My App',
          home: RootPage()),
    );
  }
}
