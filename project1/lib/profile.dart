import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatelessWidget {
  String j;

  Forum(String i) {
    j = i;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Forum ${j}"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:  <Widget>[
          SizedBox(height: 20),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                photo
              ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SmallerBlankSpace,
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              description
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: null,
                padding: EdgeInsets.all(0.0),
                child: Image.asset('assets/images/face.png',
                height: 30,
                width: 30,)),
              FlatButton(
                  onPressed: null,
                  padding: EdgeInsets.all(0.0),
                  child: Image.asset('assets/images/linkedin.jpg',
                    height: 50,
                    width: 50,)),
              FlatButton(
                  onPressed: null,
                  padding: EdgeInsets.all(0.0),
                  child: Image.asset('assets/images/twitter.png',
                    height: 30,
                    width: 30,))


            ],
          )
        ],
      ),
    );
  }
  final SmallerBlankSpace =Container(
    // padding:new EdgeInsets.all(40.0) ,
      width: 400,
      height: 50,
      decoration: new BoxDecoration(color:  Colors.white)
  );

  final blankSpace =Container(
    // padding:new EdgeInsets.all(40.0) ,
      width: 400,
      height: 100.0,
      decoration: new BoxDecoration(color:  Colors.white)
  );

  final description = Container(
    // padding:new EdgeInsets.all(40.0) ,
      width: 320,
      height: 245.0,
      decoration: new BoxDecoration(color:  Colors.white10),
      child: Text('   I have a very impressive CV. Im very cool. Folow me on twitter. I like to do programming stuff, very impressive stuff',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xFF5A6779)))
  );

  final photo = Hero(
    tag: 'hero',
    child: CircleAvatar(
      radius: 100.0,
      backgroundColor: Colors.lightBlue,
      child: CircleAvatar(
        radius: 80.0,
        backgroundImage: AssetImage("assets/images/speaker.jpg"),
        backgroundColor: Colors.transparent,
      ),
    ),
  );
}

_launchURL() async {
  const url = 'https://www.youtube.com/watch?v=eTa1jHk1Lxc';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}