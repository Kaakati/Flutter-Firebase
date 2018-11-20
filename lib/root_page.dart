import 'package:flutter/material.dart';
import 'package:flutteruitutorial1/auth_provider.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'auth.dart';

class RootPage extends StatefulWidget {
  _RootPageState createState() => _RootPageState();
}

enum AuthStates { notSignedIn, signedIn }

class _RootPageState extends State<RootPage> {
  AuthStates authStatus = AuthStates.notSignedIn;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var auth = AuthProvider.of(context).auth;

    auth.currentUser().then((userId) {
      setState(() {
        authStatus = userId == null ? AuthStates.notSignedIn : AuthStates.signedIn;
      });
    });
  }

  void _signedIn() {
    setState(() {
      authStatus = AuthStates.signedIn;
    });
  }

  void _signOut() {
    setState(() {
      authStatus = AuthStates.notSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStates.notSignedIn:
        return new LoginPage(onSignedIn: _signedIn);
      case AuthStates.signedIn:
        return new HomePage(onSignedOut: _signOut);
    }
  }
}
