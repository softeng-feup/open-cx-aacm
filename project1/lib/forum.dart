import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'feedback.dart';
import 'profile.dart';
import 'dart:async';
import 'Questions.dart';
import 'resources.dart';

class Forum extends StatefulWidget{
  @override
  ForumState  createState() => ForumState();
}

class ForumState extends State<Forum> {
  static BuildContext context1;
  DateTime now;

  void _getTime() {
    if (this.mounted)
      setState(() {
        now=DateTime.now();
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    now=DateTime.now();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ForumState.context1 = context;
    return Scaffold(
        backgroundColor: Color(0xFFFAFAFA),
        appBar: AppBar(
          title: Text(now.second.toString()),
          backgroundColor: Color(0xFF3EA6F2),
        ),
        body: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(mainAxisSize: MainAxisSize.max, children: [
                talkTitle,
                SizedBox(width: 15),
                Column(
                  children: <Widget>[photo, speakerInfo],
                )
              ]),
              talkResources,
              if(now.minute>=1)
                talkFeedback,
              if(now.minute>=1)
                talkForum,
              SizedBox(
                height: 10,
              ),
            ],
          )
        ]));
  }

  final talkTitle = SizedBox(
    child: Text('Palestra 1',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 46,
            color: Color(0xFF3EA6F2))),
  );

  final speakerInfo = RaisedButton(
    color: Color(0xFFFAFAFA),
    onPressed: () {
      // Navigate back to first route when tapped.
      BuildContext context2 = context1;
      Navigator.pop(context2);
    },
    child: SizedBox(
        child: RaisedButton(
            color: Colors.white,
            onPressed: () {
              // Navigate back to first route when tapped.
              Navigator.push(context1, MaterialPageRoute(builder: (context) => Profile()));
            },
            child: Text('Speaker \n Name',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color(0xFF5A6779))
            )
        )
    ),
  );

  final photo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        radius: 40.0,
        backgroundColor: Colors.black54,
        child: CircleAvatar(
          radius: 37.0,
          backgroundImage: AssetImage("assets/images/speaker.jpg"),
        ),
      ));

  final talkResources = SizedBox(
      width: 350,
      height: 60,
      child: RaisedButton(
          color: Colors.white,
          onPressed: () {
            // Navigate back to first route when tapped.
            Navigator.push(context1, MaterialPageRoute(builder: (context1) => Upload()));
          },
          child: SizedBox(
              width: 350,
              child: Text('Resources',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xFF5A6779))))));

  final askQuestion = SizedBox(
      width: 350,
      height: 60,
      child: RaisedButton(
          color: Colors.white,
          onPressed: () {
            // Navigate back to first route when tapped.
            Navigator.push(context1 , MaterialPageRoute(builder: (context) => Profile()));
          },
          child: SizedBox(
              width: 350,
              child: Text('Ask a question',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xFF5A6779))))));

  final talkFeedback = SizedBox(
      width: 350,
      height: 60,
      child: RaisedButton(
          color: Colors.white,
          onPressed: () {
            Navigator.push(
                context1,
                MaterialPageRoute(builder: (context) => SecondRoute())
            );
          },
          child: SizedBox(
              width: 350,
              child: Text('Feedback',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xFF5A6779))))));

  final talkForum = SizedBox(
      width: 350,
      height: 60,
      child: RaisedButton(
          color: Colors.white,
          onPressed: () {
            Navigator.push(
                context1,
                MaterialPageRoute(builder: (context) => Questions())
            );
          },
          child: SizedBox(
              width: 350,
              child: Text('Forum',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xFF5A6779))))));
}