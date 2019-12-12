import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'profile.dart';
import 'dart:async';
import 'info.dart';
import 'objects.dart';
import 'Questions.dart';
import 'resources.dart';
import 'talk_feedback.dart';


class Forum extends StatefulWidget{
 
  final AllInfo info;
  String lectureName;
  User currentUser;
  Forum(this.info, this.lectureName, this.currentUser);

  @override
  ForumState  createState() => new ForumState(info, lectureName, currentUser);
}

class ForumState extends State<Forum> {

  static BuildContext context1;
  DateTime now;
  AllInfo info;
  String lectureName;
  User currentUser;


  ForumState(this.info, this.lectureName, this.currentUser);

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
          //title: Text(now.second.toString()),
          backgroundColor: Color(0xFF3EA6F2),
        ),
        body: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(mainAxisSize: MainAxisSize.max, children: [
                //LECTURE TITLE -------------------------------------------------------
                SizedBox(
                  child: Text(lectureName,
                  style: TextStyle(
                    decorationStyle: TextDecorationStyle.wavy,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  color: Color(0xFF3EA6F2))),
                ),
                SizedBox(width: 15),
                Column(
                  children: <Widget>[
                    //PHOTO------------------------------------------------------------
                    Hero(
                      tag: 'hero',
                      child: CircleAvatar(
                      radius: 40.0,
                      backgroundColor: Colors.black54,
                      child: CircleAvatar(
                        radius: 37.0,
                        backgroundImage: AssetImage(info.getLecture(lectureName).getSpeaker().getPhoto()),
                      ),
                     )), 

                    //SPEAKER INFO---------------------------------------------------
                    RaisedButton(
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
                            Navigator.push(context1, MaterialPageRoute(builder: (context) => Profile(info,lectureName)));
                          },
                        child: Text(info.getLecture(lectureName).getSpeaker().getName(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0xFF5A6779))
                        )
                      )
                    ),
                  )
                  ],
                )
              ]),
              talkResources,
              if(now.minute>=1)
               SizedBox(
                  width: 350,
                  height: 60,
                  child: RaisedButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context1,
                            MaterialPageRoute(builder: (context) => Feedbacks(info,lectureName, currentUser))
                        );
                      },
                      child: SizedBox(
                          width: 350,
                          child: Text('Feedback',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color(0xFF5A6779)))))),
              if(now.minute>=1)
              talkForum(),
              SizedBox(
                height: 10,
              ),
            ],
          )
        ]));
  }


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


  Widget talkForum() {
    return SizedBox(
        width: 350,
        height: 60,
        child: RaisedButton(
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                  context1,
                  MaterialPageRoute(
                      builder: (context) => Questions(0,info, lectureName, true))
              );
            },
            child: SizedBox(
                width: 350,
                child: Text('Question Forum',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xFF5A6779))))));
  }
}
