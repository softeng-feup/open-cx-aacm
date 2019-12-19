import 'package:flutter/material.dart';
import 'package:project1/info.dart';
import 'package:project1/objects.dart';
import 'talk_answer.dart';
import 'objects.dart';


class Questions extends StatefulWidget{
  String lecture;
  AllInfo info;
  var index;
  Questions( this.index, this.info , this.lecture);
  @override
  QuestionsState  createState() => QuestionsState( this.index , this.info , this.lecture);
}


class QuestionsState extends State<Questions> {
  static BuildContext context1;
  AllInfo info;
  String lecture;
  var id;
  List<Question> list = [];


  QuestionsState(this.id, this.info, this.lecture) {
    Lecture temp = info.getLecture(lecture);
    list = temp.getQuestionForum();
  }

    void _incrementCounter() async {
      if (this.mounted)
        setState(() async {
          final question = await Navigator.push(
              QuestionsState.context1,
              MaterialPageRoute(builder: (context1) => InfoQuestion(this.info))
          );
          if (question != null)
            list.add(question);
        });
    }

    @override
    Widget build(BuildContext context) {
      QuestionsState.context1 = context;
      return Scaffold(
        appBar: AppBar(
          // Here we take the value frorm the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Questions"),
        ),
        body:
        Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              new Expanded(child: new ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 100,
                      height: 70,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context1) =>
                                  Answers(index, info, lecture)));
                        },
                        padding: EdgeInsets.all(12),
                        color: Colors.grey[((index % 2) + 1) * 100],
                        child: Text(list[index].getText()
                        ),
                      ),
                    );
                  }
              ),
              )
            ]
        ),
        floatingActionButton: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Color(0xFF3EA6F2),
          onPressed: _incrementCounter,
          child: Text('Ask a question',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Colors.white)),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      );
    }
  }

class InfoQuestion extends StatelessWidget { //adicionar palestra
  static final formKey = GlobalKey<FormState>();
  Question question;
  var value;
  var finalDecision;
  AllInfo info;


  InfoQuestion(this.info);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Ask question'),
        ),
        body: Card(
          child: new SingleChildScrollView(
              child:Padding(padding: EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Add your question here...'
                        ),
                        onSaved: (String val) => (question = new Question(0,info.currentUser,val,new DateTime(2019))),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              onPressed:(){ _submit();
                              Navigator.pop(context , question);},
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
  void _submit(){
    formKey.currentState.save();
  }

}
