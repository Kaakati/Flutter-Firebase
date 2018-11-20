import 'package:flutter/material.dart';
import 'auth.dart';

class LoginPage extends StatefulWidget {

  final BaseAuth auth;
  LoginPage({this.auth, this.onSignedIn});

  final VoidCallback onSignedIn;

  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  FormType _formType = FormType.login;

  bool validateAndSave() {
    final form = this.formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
      print('Form is valid Email: $_email, password: $_password');
    } else {
      return false;
      print('Form is invalid. Email: $_email, password: $_password');
    }
  }

  // Firebase Logic
  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        if (_formType == FormType.login) {
          String userID = await widget.auth.signInWithEmailAndPassword(this._email, this._password);
          print('Signed User ID: ${userID}');
        } else {
          String userID = await widget.auth.createUserWithEmailAndPassword(this._email, this._password);
          print('Signed User ID: ${userID}');
        }
        widget.onSignedIn();
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  void moveToRegister() {
    formKey.currentState.reset();
    // On SetState being called, it will call BuildContext and Rebuild the Views
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState.reset();
    // On SetState being called, it will call BuildContext and Rebuild the Views
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: _navBar(
            context, _formType == FormType.login ? 'Login' : 'New User'),
        body: Container(
          child: SafeArea(
            minimum: const EdgeInsets.all(16),
            child: new Form(
                key: this.formKey,
                child: new Center(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: _buildInputs() + _buildFormActions(),
                  ),
                )),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildInputs() {
    return [
      new Text(_formType == FormType.login ? 'Login for a great experience.' : 'Create a new account!', style: TextStyle(fontSize: 16),),
      new SizedBox(height: 20.0),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Email'),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => this._email = value,
      ),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Password'),
        obscureText: true,
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => this._password = value,
      ),
      new SizedBox(height: 20.0),
    ];
  }

  List<Widget> _buildFormActions() {
    if (_formType == FormType.login) {
      return [
        new RaisedButton(
            child: Text('Login', style: new TextStyle(fontSize: 16)),
            onPressed: validateAndSubmit),
        new SizedBox(height: 20.0),
        new FlatButton(
            child: Text('Not Registered? Create Account.',
                style: new TextStyle(fontSize: 14.0)),
            onPressed: moveToRegister),
      ];
    } else {
      return [
        new RaisedButton(
            child:
                Text('Create an account', style: new TextStyle(fontSize: 16)),
            onPressed: validateAndSubmit),
        new SizedBox(height: 20.0),
        new FlatButton(
            child: Text('Already Registered? Login.',
                style: new TextStyle(fontSize: 14.0)),
            onPressed: moveToLogin),
      ];
    }
  }
}

Widget _navBar(BuildContext context, String appBarTitle) {
  return AppBar(elevation: 0.4, title: Text(appBarTitle));
}
