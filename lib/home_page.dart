import 'package:flutter/material.dart';
import 'package:flutteruitutorial1/auth_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({this.onSignedOut});
  final VoidCallback onSignedOut;
  int _bottomNavBarIndex = 0;

  void _signOut(BuildContext context) async {
    try {
      var auth = AuthProvider.of(context).auth;
      await auth.signOut();
      onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: widget._bottomNavBarIndex,
        onTap: (int index) {
          setState(() {
            widget._bottomNavBarIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.list, color: Colors.grey),
              title: Text('List', style: TextStyle(color: Colors.grey)),
              activeIcon: Icon(Icons.list, color: Colors.blue)),
          BottomNavigationBarItem(
              icon: Icon(Icons.compare_arrows, color: Colors.grey),
              title: Text('Ongoing', style: TextStyle(color: Colors.grey)),
              activeIcon: Icon(Icons.compare_arrows, color: Colors.blue)),
          BottomNavigationBarItem(
            icon: Icon(Icons.done_all, color: Colors.grey),
            title: Text('Completed', style: TextStyle(color: Colors.grey)),
            activeIcon: Icon(Icons.done_all, color: Colors.blue),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz, color: Colors.grey),
              title: Text('Settings', style: TextStyle(color: Colors.grey)),
              activeIcon: Icon(Icons.more_horiz, color: Colors.blue))
        ],
      ),
      appBar: new AppBar(
        title: new Text('Welcome'),
        actions: <Widget>[
          new FlatButton(
            child: new Text('Logout',
                style: new TextStyle(fontSize: 17.0, color: Colors.white)),
            onPressed: () => widget._signOut(context),
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
