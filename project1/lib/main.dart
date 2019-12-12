import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'info.dart';
import 'objects.dart';

import 'package:intl/date_symbol_data_local.dart';


void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}
class MyApp extends StatelessWidget {
  
  static AllInfo info;
  static User currentUser;

  MyApp(){
    info = new AllInfo();
  }

  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(info, currentUser),
    HomePage.tag: (context) => HomePage( 'Live Feedback', info, currentUser),
  };
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LiveFeedBack',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightBlueAccent,
        accentColor: Colors.lightBlue,

        // Define the default font family.
        fontFamily: 'Montserrat',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
        headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      )),
      home: LoginPage(info, currentUser),
      routes : routes,
    );
  }
}
