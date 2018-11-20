import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'auth.dart';

class RootPage extends StatefulWidget {
  final BaseAuth auth;
  RootPage({this.auth});

  _RootPageState createState() => _RootPageState();
}

enum AuthStates { notSignedIn, signedIn }

class _RootPageState extends State<RootPage> {
  AuthStates authStatus = AuthStates.notSignedIn;

  // This is called everytime a Stateful widget is initiated.
  // Called before BuildContext
  @override
  void initState() {
    super.initState();
    widget.auth.currentUser().then((userId) {
      setState(() {
        // authStatus = userId == null ? AuthStates.notSignedIn : AuthStates.signedIn;
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
        return new LoginPage(auth: widget.auth, onSignedIn: _signedIn);
      case AuthStates.signedIn:
        return new HomePage(
          auth: widget.auth,
          onSignedOut: _signOut,
        );
    }
  }
}
