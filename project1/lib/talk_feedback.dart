import 'package:flutter/material.dart';
import 'package:project1/info.dart';
import 'star_rating.dart';
import 'info.dart';
import 'objects.dart';


class Feedbacks extends StatefulWidget {
  final AllInfo info;
  String lectureName;
  User currentUser;

  Feedbacks(this.info, this.lectureName, this.currentUser);

  @override
  FeedbackState createState() => FeedbackState(info, lectureName, currentUser);
}

class FeedbackState extends State<Feedbacks> {
  static BuildContext context1;

  AllInfo info;
  String lectureName;
  User currentUser;

  FeedbackState(this.info, this.lectureName, this.currentUser);

  void _incrementCounter() async {
    if (this.mounted)
      setState(() async {
        final newFeedback = await Navigator.push(FeedbackState.context1,
            MaterialPageRoute(builder: (context1) => InfoFeedback()));
        if (newFeedback != null) {
          //newFeedback.setUser(currentUser);
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
        body: new ListView.builder(
            itemCount: info
                .getLecture(lectureName)
                .getFeedbackForum()
                .length,
            itemBuilder: (context, index) {
              return Container(
                  alignment: Alignment.center,
                  color: Colors.grey[((index % 2) + 1) * 100],
                  child: Column(children: [
                    SizedBox(height: 15),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          StarDisplay(value: info.getLecture(lectureName)
                              .getFeedbackForum()[index].getStars())
                        ]),
                    SizedBox(height: 10),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                          info.getLecture(lectureName).getFeedbackForum()[index]
                              .getText(),
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 18)),
                    ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(info.getLecture(lectureName)
                              .getFeedbackForum()[index].getInfo(),
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 18))
                        ]),
                    SizedBox(height: 15)
                  ]));
            }),
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
  //adicionar palestra
  static final formKey = GlobalKey<FormState>();


  FeedBack _newFeedback = new FeedBack(
      null, User(0, "anon", "", ""), "", 0, new DateTime.now());

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Adicionar nova palestra'),
        ),
        body: Card(
          child: new SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SizedBox(height: 30),
                      Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
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
                        onSaved: (value) =>
                        {
                          if (value == null) value = 0,
                          _newFeedback.setStars(value)},
                      ),
                      leaveAComment,
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),),
                        onSaved: (String val) =>
                        {
                          if (val == null || val == "") val = "--",
                          _newFeedback.setText(val),},
                        maxLength: 300,
                        maxLines: 6,
                        style: new TextStyle(
                            fontSize: 20.0, color: Colors.black),

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
              )),
        ));
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

  final leaveAComment = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
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

