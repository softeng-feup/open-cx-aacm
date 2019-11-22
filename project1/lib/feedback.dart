import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'star_rating.dart';

class SecondRoute extends StatelessWidget {
  static BuildContext context;

  @override
  Widget build(BuildContext context1) {
    context = context1;
    return Scaffold(
        backgroundColor: Color(0xFFFAFAFA),
        appBar: AppBar(
          title: Text("Live Feedback"),
          backgroundColor: Color(0xFF3EA6F2),
        ),
        body: ListView(
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          children: <Widget>[
            SizedBox(height: 30),
            feedbackTitle,
            SizedBox(height: 30),
            rateTheTalk,
            starRate,
            SizedBox(height: 20),
            leaveAComment,
            commentSpace,
            SizedBox(height: 25),
            submit
          ],
        ));
  }

  final feedbackTitle = SizedBox(
    child: Text('Feedback',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 46,
            color: Color(0xFF5A6779))),
  );

  final rateTheTalk = SizedBox(
    child: Text('Rate the talk: ',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Color(0xFF707070))),
  );

  final starRate =
      Container(color: Color(0xFFEFECEC), child: StatefulStarRating());

  final leaveAComment = SizedBox(
    child: Text('Leave a comment (optional):',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Color(0xFF707070))),
  );

  final commentSpace = TextField(
    decoration: InputDecoration(
      border: OutlineInputBorder(),
    ),
    maxLength: 300,
    maxLines: 6,
    style: new TextStyle(fontSize: 20.0, color: Colors.black),
  );

  final submit = Row(mainAxisAlignment: MainAxisAlignment.end, children: [
    RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      color: Color(0xFF3EA6F2),
      onPressed: () {
        // Navigate back to first route when tapped.
        BuildContext context2 = context;
        Navigator.pop(context2);
      },
      child: Text('Submit',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 26, color: Colors.white)),
    )
  ]);
}
