import 'objects.dart';
import 'package:flutter/material.dart';
import 'package:project1/info.dart';
import 'package:project1/objects.dart';
import 'templates.dart';
import 'package:intl/intl.dart';

class Answers extends StatefulWidget {
  String lecture;
  AllInfo info;
  var index;

  Answers(this.index, this.info, this.lecture);

  @override
  AnswersState createState() =>
      AnswersState(this.index, this.info, this.lecture);
}

class AnswersState extends State<Answers> {
  static BuildContext context1;
  String lecture;
  AllInfo info;
  var id;
  List<Answer> list = [];

  AnswersState(this.id, this.info, this.lecture) {
    Lecture temp = info.getLecture(lecture);
    List<Question> listTemp = temp.getQuestionForum();
    Question question = listTemp[id];
    list = question.getAnswers();
  }

  void _incrementCounter() async {
    if (this.mounted)
      setState(() async {
        final answer = await Navigator.push(AnswersState.context1,
            MaterialPageRoute(builder: (context1) => InfoAnswer(info)));
        if (answer != null) list.add(answer);
      });
  }

  @override
  Widget build(BuildContext context) {
    AnswersState.context1 = context;
    return Scaffold(
      appBar: AppBar(),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <
          Widget>[
        new Container(
            width: 425,
            height: 80.0,
            decoration: new BoxDecoration(color: Colors.white30),
            child: Center(
                child: Text(
                    info.getLecture(lecture).getQuestionForum()[id].getText(),
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xFF5A6779))))),
        Container(
            color: Colors.white30,
            child: Row(children: [
              SizedBox(width: 15),
              Text("This question has ",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF3EA6F2),
                  )),
              Text(list.length.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF3EA6F2),
                  )),
              Text(" answer(s): ",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF3EA6F2),
                  )),
              SizedBox(height: 50),
            ])),
        new Expanded(
          child: new ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Container(
                    alignment: Alignment.center,
                    color: Colors.grey[((index % 2) + 1) * 100],
                    child: Column(children: [
                      SizedBox(height: 15),
                      Text(list[index].getText(),
                          style:
                              TextStyle(fontSize: 20, color: Colors.black87)),
                      SizedBox(height: 15),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (list[index].getUser() ==
                                info.getLecture(lecture).getSpeaker())
                              Icon(Icons.check_circle,
                                  color: Color(0xFF3EA6F2)),
                            if (list[index].getUser() != null)
                              Text(list[index].getUser().getName(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Color(0xFF3EA6F2),
                                  )),
                            if (list[index].getUser() == null)
                              Text("Anon",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Color(0xFF3EA6F2),
                                  )),
                            Text(
                                DateFormat(" dd/MM/yyyy 'at' hh:ss")
                                    .format(DateTime.now())
                                    .toString(),
                                style: TextStyle(
                                  color: Color(0xFF5A6779),
                                  fontSize: 19,
                                ))
                          ]),
                      SizedBox(height: 15),
                    ]));
              }),
        ),
        SizedBox(height: 70),
      ]),
      floatingActionButton: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Color(0xFF3EA6F2),
        onPressed: _incrementCounter,
        child: Text('Add reply',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: Colors.white)),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class InfoAnswer extends StatelessWidget {
  //adicionar resposta
  static final formKey = GlobalKey<FormState>();
  Question question;
  Answer answer;
  AllInfo info;

  InfoAnswer(this.info);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Add reply'),
        ),
        body: Card(
          child: new SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Add your reply here...'),
                    onSaved: (String val) =>
                        (answer = new Answer(0, null, val, DateTime(2019))),
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
                        answer.setUser(info.currentUser)
                      else
                        answer.setUser(null)
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
                            Navigator.pop(context, answer);
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
