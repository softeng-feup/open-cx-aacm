import 'dart:convert';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LiveFeedBack',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightBlueAccent,
        accentColor: Colors.blue,

        // Define the default font family.
        fontFamily: 'Montserrat',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
        headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      )),
      home: MyHomePage(title: 'LiveFeedBack'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<String> listLectures=[];
  void _incrementCounter() {
    setState(() {
      if(_counter <12)
        _counter ++;
    listLectures.add('Palestra ${_counter}');
  });}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          children: <Widget>
          [

            for ( var i = 0; i < _counter; i++)
             new FlatButton.icon(
               padding: const EdgeInsets.all(10),
              color: Colors.lightBlue,
                 textColor: Colors.white,
              icon: Icon(Icons.favorite_border), //`Icon` to display
              label: Text(listLectures[i]), //`Text` to display
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Forum(listLectures[i])),
                );
              }
            )

          ],

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Forum extends StatelessWidget {
  String j;
  Forum(String i)
  {
    j=i;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forum ${j}"),
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.lightBlue,
          onPressed: () {
            // Navigate back to first route when tapped.
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}