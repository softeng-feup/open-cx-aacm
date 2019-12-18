import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'profile.dart';
import 'dart:async';
import 'info.dart';
import 'objects.dart';
import 'talk_questions.dart';
import 'talk_resources.dart';
import 'talk_feedback.dart';

class Forum extends StatefulWidget {
   AllInfo info;
   String lectureName;
   String lectureDesc;

  Forum(this.info, this.lectureName, this.lectureDesc);

  @override
  ForumState createState() =>
      new ForumState(info, lectureName, lectureDesc);
}

class ForumState extends State<Forum> {
  static BuildContext context1;
  DateTime now;
  AllInfo info;
  String lectureName;
  String lectureDesc;

  ForumState(this.info, this.lectureName, this.lectureDesc);

  void _getTime() {
    if (this.mounted)
      setState(() {
        now = DateTime.now();
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    now = DateTime.now();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ForumState.context1 = context;
    return Scaffold(
        backgroundColor: Color(0xFFFAFAFA),
        appBar: AppBar(
          backgroundColor: Color(0xFF3EA6F2),
        ),
        body: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(mainAxisSize: MainAxisSize.max, children: [
                //LECTURE TITLE -------------------------------------------------------
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                        width: 250,
                        child: Text(lectureName,
                            style: TextStyle(
                                decorationStyle: TextDecorationStyle.wavy,
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                                color: Color(0xFF3EA6F2)))),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                        width: 250,
                        child: Text(lectureDesc,
                            maxLines: 4,
                            style: TextStyle(
                                decorationStyle: TextDecorationStyle.wavy,
                                fontSize: 20,
                                color: Color(0xFF5A6779))))
                  ],
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
                            backgroundImage: AssetImage(info
                                .getLecture(lectureName)
                                .getSpeaker()
                                .getPhoto()),
                          ),
                        )),

                    //SPEAKER INFO---------------------------------------------------
                    RaisedButton(
                        color: Colors.white,
                        onPressed: () {
                          // Navigate back to first route when tapped.
                          Navigator.push(
                              context1,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Profile(info, lectureName)));
                        },
                        child: Column(children:
                        [Text(
                            'Speaker',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            )),
                          Text(
                              info.getLecture(lectureName).getSpeaker().getName(),
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF7F8C8D),
                                  )),
                          ])),

                  ],
                )
              ]),
              talkResources,
              if (now.minute >= 1)
                SizedBox(
                    width: 350,
                    height: 100,
                    child: RaisedButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                              context1,
                              MaterialPageRoute(
                                  builder: (context) => Feedbacks(
                                      info, lectureName)));

                        },
                        child: ListView(children: [
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                              width: 350,
                              child: Text('Feedback',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      color: Color(0xFF5A6779)))),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                              width: 350,
                              child: Text(
                                  'Give us your oppinion or see what others had to say about this talk.',
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xFF7F8C8D))))
                        ]))),
              if (now.minute >= 1) talkForum(),
              SizedBox(
                height: 10,
              ),
            ],
          )
        ]));
  }

  final talkResources = SizedBox(
      width: 350,
      height: 100,
      child: RaisedButton(
          color: Colors.white,
          onPressed: () {
            // Navigate back to first route when tapped.
            Navigator.push(
                context1, MaterialPageRoute(builder: (context1) => Upload()));
          },
          child: ListView(children: [
            SizedBox(
              height: 15,
            ),
            SizedBox(
                width: 350,
                child: Text('Resources',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Color(0xFF5A6779)))),
            SizedBox(
              height: 5,
            ),
            SizedBox(
                width: 350,
                child: Text('Consult or add material used during this talk.',
                    style: TextStyle(fontSize: 16, color: Color(0xFF7F8C8D))))
          ])));

  Widget talkForum() {
    return SizedBox(
        width: 350,
        height: 100,
        child: RaisedButton(
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                  context1,
                  MaterialPageRoute(
                      builder: (context) =>
                          Questions(0, info, lectureName, true)));
            },
            child: ListView(children: [
              SizedBox(
                height: 25,
              ),
              SizedBox(
                  width: 350,
                  child: Text('Questions\' Forum',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Color(0xFF5A6779)))),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                  width: 350,
                  child: Text('Add or answer questions about this talk.',
                      style: TextStyle(fontSize: 16, color: Color(0xFF7F8C8D))))
            ])));
  }
}
