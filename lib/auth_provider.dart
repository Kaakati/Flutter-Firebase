import 'package:flutter/material.dart';
import 'package:flutteruitutorial1/auth.dart';

class AuthProvider extends InheritedWidget {
  AuthProvider({Key key, this.child, this.auth}) : super(key: key, child: child);
  
  final BaseAuth auth;
  final Widget child;

  static AuthProvider of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(AuthProvider) as AuthProvider);
  }

  @override
  bool updateShouldNotify(AuthProvider oldWidget) {
    return true;
  }
}