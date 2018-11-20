import 'package:flutter/material.dart';
import 'package:flutteruitutorial1/auth_provider.dart';

class HomePage extends StatelessWidget {
  
  HomePage({this.onSignedOut});
  final VoidCallback onSignedOut;

  void _signOut(BuildContext context) async {
    try {
      var auth = AuthProvider.of(context).auth;
      await auth.signOut();
      onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome'),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Logout', style: new TextStyle(fontSize: 17.0, color: Colors.white)),
              onPressed: () => _signOut(context),
            )
          ],
        ),
        body: new Center(
          child: new Container(
            child: new Text('Home Page'),
          ),
        ),
      );
  }
}