import 'package:flutter/material.dart';
import 'package:project1/info.dart';
import 'dart:async';

class Questions extends StatefulWidget{
  @override
  QuestionsState  createState() => QuestionsState();
}


class QuestionsState extends State<Questions> {
  static BuildContext context1;
  List<Question> questions=[];

  void _incrementCounter() async{
    if (this.mounted)
      setState(() async {
        final question = await Navigator.push(
            QuestionsState.context1,
            MaterialPageRoute(builder: (context1) => InfoQuestion())
        );

        questions.add(question);
        print(questions[1].getText());
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
      new ListView.builder(
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return SizedBox(
                width: 100,
                height: 70,
                child: Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.lightBlue, width: 5.0),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    onPressed: () { Navigator.push(context,MaterialPageRoute(builder: (context1) => Questions()));},
                    padding: EdgeInsets.all(12),
                    color: Colors.black,
                    child: Text(questions[index].getText()
                    ),
                  ),
                )
            );
          }
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: _incrementCounter,
        child: Icon(Icons.add),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class InfoQuestion extends StatelessWidget { //adicionar palestra
  static final formKey = GlobalKey<FormState>();
  Question question;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Adicionar nova palestra'),
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
                            labelText: 'Nome da palestra: '
                        ),
                        onSaved: (String val) => (question = new Question(0,null, val,null)),
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
