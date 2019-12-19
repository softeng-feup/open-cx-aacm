import 'objects.dart';
import 'package:flutter/material.dart';
import 'package:project1/info.dart';
import 'package:project1/objects.dart';


class Answers extends StatefulWidget{
  String lecture;
  AllInfo info;
  var index;
  Answers( this.index, this.info , this.lecture);
  @override
  AnswersState  createState() => AnswersState( this.index , this.info , this.lecture);
}


class AnswersState extends State<Answers> {
  static BuildContext context1;
  var lecture;
  AllInfo info;
  var id;
  List<Answer> list = [];


  AnswersState(this.id , this.info , this.lecture){

      Lecture temp = info.getLecture(lecture);
      List<Question> listTemp = temp.getQuestionForum();
      Question question = listTemp[id];
      list = question.getAnswers();
  }
  void _incrementCounter() async{
    if (this.mounted)
      setState(() async {
        final answer = await Navigator.push(
            AnswersState.context1,
            MaterialPageRoute(builder: (context1) => InfoAnswer(info))
        );
        if(answer!=null)
          list.add(answer);

      });
  }

  @override
  Widget build(BuildContext context) {
    AnswersState.context1 = context;
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
                      onPressed: null,
                      padding: EdgeInsets.all(12),
                      color: Colors.grey[((index % 2) + 1) * 100],
                      child: Text(list[index].getText()
                      ),
                    ),
                  );
                }
            ),
            )
            ,
        new SizedBox(
          width: 100,
          height: 70,
          child: RaisedButton(
            onPressed: (){
              Navigator.pop(AnswersState.context1,list);
              },
            padding: EdgeInsets.all(12),
            color: Colors.blueAccent,
            child: Text("back"
            ),
          ),
        ),
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

class InfoAnswer extends StatelessWidget { //adicionar resposta
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
              child:Padding(padding: EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Add your reply here...'
                        ),
                        onSaved: (String val) => (answer = new Answer(0, null , val, DateTime(2019))),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              onPressed:(){ _submit();
                              Navigator.pop(context , answer);},
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
