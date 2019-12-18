import 'package:flutter/material.dart';
import 'package:project1/info.dart';
import 'package:project1/objects.dart' as prefix0;
import 'dart:async';
import 'objects.dart';


class Questions extends StatefulWidget{
  String lecture;
  AllInfo info;
  var isreply;
  var index;
  Questions( this.index, this.info , this.lecture ,this.isreply);
  @override
  QuestionsState  createState() => QuestionsState( this.index , this.info , this.lecture , this.isreply);
}


class QuestionsState extends State<Questions> {
  static BuildContext context1;
  AllInfo info;
  String lecture;
  var isreply;
  var id;
  var list;

  QuestionsState(this.id , this.info , this.lecture , this.isreply){
    if(isreply) {
      Lecture temp = info.getLecture(lecture);
      List<Question> questions = temp.getQuestionForum();
      list = questions;
    }
    else{
      Lecture temp = info.getLecture(lecture);
      List<Question> listTemp = temp.getQuestionForum();
      Question question = listTemp[id];
      list = question.getAnswers();
    }
  }
  void _incrementCounter() async{
    if (this.mounted)
      setState(() async {
        final question = await Navigator.push(
            QuestionsState.context1,
            MaterialPageRoute(builder: (context1) => InfoQuestion(isreply))
        );
        if(question!=null)
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
          children:  <Widget>[
            if((!isreply) && questions.isNotEmpty)
              new Container(
                  width: 425,
                  height: 100.0,
                  decoration: new BoxDecoration(border: Border.all(width: 5.0,color: Color(0xFF3EA6F2)),color:  Colors.white30),
                  child: Center(
                      child : Text(info.getLecture(lecture).getQuestionForum()[id].getText(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xFF5A6779))
                  )
                  )
              ),
    new Expanded(child: new ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return SizedBox(
                width: 100,
                height: 70,
                  child: RaisedButton(
                    onPressed: () {
                      if(isreply)
                      Navigator.push(context,MaterialPageRoute(builder: (context1) => Questions(index,info , lecture , false)));},
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

  Widget QuestionBox(){
    return Container(
      // padding:new EdgeInsets.all(40.0) ,
        width: 320,
        height: 100.0,
        decoration: new BoxDecoration(color:  Colors.white10),
        child: Text(info.getLecture(questions[id].getText()).getSpeaker().getDescription(),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xFF5A6779))
        )
    );
  }
}

class InfoQuestion extends StatelessWidget { //adicionar palestra
  var isreply;
  static final formKey = GlobalKey<FormState>();
  Question question;
  Answer answer;
  var value;
  var finalDecision;


  InfoQuestion(this.isreply);

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
                        onSaved: (String val) => (value = val),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              onPressed:(){ _submit();
                              Navigator.pop(context , finalDecision);},
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
    if(value != null)
    if(!isreply) {
      answer = new Answer(0, null , value, null);
      finalDecision = answer;
      print("lajfnloiuahfiuhuaeliqwelijhaliweuhliwenfliuhWELIUFBLIEUHFLIWEHBFLIUEWHFOIQWNELEIFNLEINFLIAFLIUHAWFILUHluhliuhfbilubfliubwfiuhw");
    }
    else {
      question = new Question(0,null,value,null);
    }

    formKey.currentState.save();
  }

}
