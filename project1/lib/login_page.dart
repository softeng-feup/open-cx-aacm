import 'package:flutter/material.dart';
import 'info.dart';
import 'objects.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  final AllInfo info;
  final User currentUser;

  LoginPage(this.info, this.currentUser);

  @override
  _LoginPageState createState() => new _LoginPageState(info, currentUser);
}

class _LoginPageState extends State<LoginPage> {
  _LoginPageState(this.info, this.currentUser);

  AllInfo info;
  User currentUser;
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  bool incorrectPass = false;
  String password, email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: new EdgeInsets.all(15.0),
        child: new Form(
          key: _key,
          autovalidate: _validate,
          child: formUI(),
        ),
      ),
    );
  }

  Widget formUI() {
    return new ListView(children: [
      Column(
        children: [
          SizedBox(height: 120.0),
          logo,
          SizedBox(height: 40.0),
          new TextFormField(
              decoration: InputDecoration(
                hintText: 'Email',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)),
              ),
              keyboardType: TextInputType.emailAddress,
              maxLength: 32,
              autofocus: false,
              validator: validateEmail,
              onSaved: (String val) {
                email = val;
              }),
          SizedBox(height: 8.0),
          new TextFormField(
            decoration: InputDecoration(
              hintText: 'Password',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
            maxLength: 32,
            autofocus: false,
            obscureText: true,
            validator: validatePassword,
            onSaved: (String val) {
              password = val;
            },
          ),
          SizedBox(height: 8.0),
          new RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            onPressed: _sendToServer,
            padding: EdgeInsets.all(12),
            color: Color(0xFF3EA6F2),
            child: Text('Log In', style: TextStyle(color: Colors.white)),
          )
        ],
      )
    ]);
  }

  final logo = Hero(
      tag: 'hero',
      child: new Container(
        decoration: new BoxDecoration(color: Colors.grey),
        child: Image.asset("assets/images/logo.png", fit: BoxFit.cover),
      ));

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    var check = info
        .getPeople()
        .firstWhere((cookie) => cookie.email == value, orElse: () => null);
    if (value.length == 0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value) || check == null) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  String validatePassword(String value) {
    if (value.length == 0) {
      return "Password is Required";
    } else if (incorrectPass == true) {
      incorrectPass = false;
      return "Password is incorrect";
    }
    return null;
  }

  _sendToServer() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      var check = info.getPeople().firstWhere(
          (cookie) => (cookie.email == email && cookie.password == password),
          orElse: () => null);
      if (check != null) {
        currentUser = info.getUser(email);
        Navigator.of(context).pushNamed(HomePage.tag);
      } else {
        incorrectPass = true;
      }
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }
}
