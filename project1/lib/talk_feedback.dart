import 'package:flutter/material.dart';
import 'package:project1/info.dart';
import 'star_rating.dart';

class Feedbacks extends StatefulWidget {
  @override
  FeedbackState createState() => FeedbackState();
}

class FeedbackState extends State<Feedbacks> {
  static BuildContext context1;

  List<int> rates = [];
  List<String> comments = [];

  void _incrementCounter() async {
    if (this.mounted)
      setState(() async {
        final question = await Navigator.push(FeedbackState.context1,
            MaterialPageRoute(builder: (context1) => InfoFeedback()));

        rates.add(question.rate);
        comments.add(question.comment);
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
            itemCount: rates.length,
            itemBuilder: (context, index) {
              return Container(
                  alignment: Alignment.center,
                  color: Colors.grey[((index % 2) + 1) * 100],
                  child: Column(children: [
                    SizedBox(height: 15),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[StarDisplay(value: rates[index])]),
                    SizedBox(height: 10),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(comments[index],
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

  //Question question;
  static RateData question = new RateData(0, "");

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
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text('Your feedback',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 46,
                            color: Color(0xFF5A6779))),
                  ]),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('Rate the talk: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Color(0xFF707070)))
                    ],
                  ),
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
                    onSaved: (value) => question.rate = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Leave a comment (optional): '),
                    onSaved: (String val) => question.comment = val,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          onPressed: () {
                            _submit();
                            Navigator.pop(context, question);
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

  void _submit() {
    formKey.currentState.save();
  }
}

class RateData {
  int rate;
  String comment;

  RateData(rate, comment);

  int getRate(){return rate;}

  String getComment(){return comment;}

}
