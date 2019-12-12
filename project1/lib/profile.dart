import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'info.dart';


class Profile extends StatelessWidget {
  
  final AllInfo info;
  String lectureName;
  Profile(this.info, this.lectureName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(lectureName),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:  <Widget>[
          SizedBox(height: 20),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //PHOTO ---------------------------------------------
                Hero(
                  tag: 'hero',
                  child: CircleAvatar(
                    radius: 100.0,
                    backgroundColor: Colors.lightBlue,
                    child: CircleAvatar(
                      radius: 80.0,
                      backgroundImage: AssetImage(info.getLecture(lectureName).getSpeaker().getPhoto()),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                )
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
              //DESCRIPTION ---------------------------------------------------
              Container(
                // padding:new EdgeInsets.all(40.0) ,
                width: 320,
                height: 245.0,
                decoration: new BoxDecoration(color:  Colors.white10),
                child: Text(info.getLecture(lectureName).getSpeaker().getDescription(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xFF5A6779)))
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: _launchURL,
                padding: EdgeInsets.all(0.0),
                child: Image.asset((info.getLecture(lectureName).getSpeaker().getPhoto()),
                height: 30,
                width: 30,)),
              FlatButton(
                  onPressed: _launchURL,
                  padding: EdgeInsets.all(0.0),
                  child: Image.asset('assets/images/linkedin.jpg',
                    height: 50,
                    width: 50,)),
              FlatButton(
                  onPressed: _launchURL,
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

  _launchURL() async {
    const url = 'https://www.youtube.com/watch?v=2TvWZEVf6go';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}