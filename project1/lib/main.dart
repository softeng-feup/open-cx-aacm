import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'objects.dart';
import 'info.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  
  static AllInfo info;

  MyApp(){
    info = new AllInfo();
  }

  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(info),
    HomePage.tag: (context) => HomePage( 'Live Feedback', info)
  };
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LiveFeedBack',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF3EA6F2),
        accentColor: Color(0xFF3EA6F2),

        // Define the default font family.
        fontFamily: 'Montserrat',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
        headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      )),
      home: LoginPage(info),
      routes : routes,
    );
  }
}
