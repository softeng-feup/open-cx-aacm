import 'package:flutter/material.dart';
import 'templates.dart';
import 'info.dart';
import 'objects.dart';

class Feedbacks extends StatefulWidget {
  final AllInfo info;
  String lectureName;

  Feedbacks(this.info, this.lectureName);

  @override
  FeedbackState createState() => FeedbackState(info, lectureName);
}

class FeedbackState extends State<Feedbacks> {
  static BuildContext context1;

  AllInfo info;
  String lectureName;

  FeedbackState(this.info, this.lectureName);

  void _incrementCounter() async {
    if (this.mounted)
      setState(() async {
        final newFeedback = await Navigator.push(FeedbackState.context1,
            MaterialPageRoute(builder: (context1) => InfoFeedback(info)));
        if (newFeedback != null) {
          info.addFeedbackToLecture(newFeedback, lectureName);
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    FeedbackState.context1 = context;
    return Scaffold(
        appBar: AppBar(
          title: Text("Feedback"),
        ),
        body: Column(children: [
          new Expanded(
              child: ListView.builder(
                  itemCount:
                      info.getLecture(lectureName).getFeedbackForum().length,
                  itemBuilder: (context, index) {
                    return Container(
                        alignment: Alignment.center,
                        color: Colors.grey[((index % 2) + 1) * 100],
                        child: Column(children: [
                          SizedBox(height: 15),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                StarDisplay(
                                    value: info
                                        .getLecture(lectureName)
                                        .getFeedbackForum()[index]
                                        .getStars())
                              ]),
                          SizedBox(height: 10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    info
                                        .getLecture(lectureName)
                                        .getFeedbackForum()[index]
                                        .getText(),
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 20)),
                              ]),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (info
                                        .getLecture(lectureName)
                                        .getFeedbackForum()[index]
                                        .getUser() !=
                                    null)
                                  Text(
                                      info
                                          .getLecture(lectureName)
                                          .getFeedbackForum()[index]
                                          .getUser()
                                          .getName(),
                                      style: TextStyle(
                                          color: Color(0xFF3EA6F2),
                                          fontSize: 18)),
                                if (info
                                        .getLecture(lectureName)
                                        .getFeedbackForum()[index]
                                        .getUser() ==
                                    null)
                                  Text("Anon",
                                      style: TextStyle(
                                          color: Color(0xFF3EA6F2),
                                          fontSize: 18)),
                                Text(
                                    info
                                        .getLecture(lectureName)
                                        .getFeedbackForum()[index]
                                        .getDate(),
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontSize: 18, color: Color(0xFF5A6779)))
                              ]),
                          SizedBox(height: 15)
                        ]));
                  })),
          SizedBox(height: 70)
        ]),
        floatingActionButton: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Color(0xFF3EA6F2),
          onPressed: _incrementCounter,
          child: Text('Give us your feedback',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Colors.white)),
        ));
  }
}

class InfoFeedback extends StatelessWidget {
  static final formKey = GlobalKey<FormState>();
  AllInfo info;

  InfoFeedback(this.info);

  int counter = 0;

  FeedBack _newFeedback =
      new FeedBack(null, User(0, "", "", ""), "", 0, new DateTime.now());

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Feedback'),
      ),
      body: ListView(padding: EdgeInsets.all(8.0), children: [
        Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(height: 30),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text('Your feedback',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 46,
                        color: Color(0xFF5A6779))),
              ]),
              SizedBox(height: 30),
              rateTitle,
              FormField<int>(
                initialValue: 0,
                autovalidate: true,
                builder: (state) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      StarRating(
                        onChanged: state.didChange,
                        value: state.value,
                      ),
                    ],
                  );
                },
                onSaved: (value) => {
                  if (value == null) value = 0,
                  _newFeedback.setStars(value),
                },
              ),
              leaveAComment,
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                onSaved: (String val) => {
                  if (val == null || val == "") val = "--",
                  _newFeedback.setText(val),
                },
                maxLength: 300,
                maxLines: 6,
                style: new TextStyle(fontSize: 20.0, color: Colors.black),
              ),
              FormField<int>(
                initialValue: 0,
                autovalidate: true,
                builder: (state) {
                  return Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Hide my identity: ",
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Anon(
                          onChanged: state.didChange,
                          value: state.value,
                        ),
                      ],
                    )
                  ]);
                },
                onSaved: (value) => {
                  if (value == null) value = 0,
                  if (value == 0)
                    _newFeedback.setUser(info.currentUser)
                  else
                    _newFeedback.setUser(null)
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: () {
                        _submit();
                        Navigator.pop(context, _newFeedback);
                      },
                      child: Text('Submit'),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }

  final rateTitle = Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Text('Rate the talk: ',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Color(0xFF707070)))
    ],
  );

  final leaveAComment =
      Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
    SizedBox(
      child: Text('Leave a comment (optional):',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Color(0xFF707070))),
    )
  ]);

  void _submit() {
    formKey.currentState.save();
  }
}
