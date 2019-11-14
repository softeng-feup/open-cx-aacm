import 'package:flutter/material.dart';
class Forum extends StatelessWidget {
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            photo,
            RaisedButton(
              color: Colors.lightBlue,
              onPressed: () {
                // Navigate back to first route when tapped.
                Navigator.pop(context);
                },
              child: Text('Very Serious man profile'),
        )
          ]
        ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              blankSpace
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              description
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 205,
                child : RaisedButton(
                  color: Colors.lightBlue,
                  onPressed: () {
                  // Navigate back to first route when tapped.
                  Navigator.pop(context);
                    },
                  child: Text('Material'))),
              SizedBox(
                width: 205,
                child:RaisedButton(
                  color: Colors.lightBlue,
                  onPressed: () {
                // Navigate back to first route when tapped.
                    Navigator.pop(context);
                    },
                  child: Text('Forum'))
              )
            ],
          )
      ],
      ),
    );
  }
  final blankSpace =Container(
    // padding:new EdgeInsets.all(40.0) ,
      width: 400,
      height: 150.0,
      decoration: new BoxDecoration(color:  Colors.white)
  );

  final description = Container(
   // padding:new EdgeInsets.all(40.0) ,
      width: 411,
      height: 245.0,
      decoration: new BoxDecoration(color:  Colors.grey),
      child: Text('Some beautiful description about the talk')
  );

  final photo = Hero(
    tag: 'hero',
    child: CircleAvatar(
      radius: 70.0,
      backgroundColor: Colors.lightBlue,
      child: CircleAvatar(
        radius: 60.0,
      backgroundImage:
      NetworkImage('https://corporatefinanceinstitute.com/assets/professional-1200x747.jpg'),
      backgroundColor: Colors.transparent,
      ),
    ),
  );
}