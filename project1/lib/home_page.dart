import 'package:flutter/material.dart';
import 'objects.dart';
import 'package:flutter/painting.dart';
import 'dart:ui' as ui;
import 'forum.dart';

class HomePage extends StatefulWidget {

  HomePage({Key key, this.title}) : super(key: key);

  static String tag = 'home-page';
  final String title;

  @override
  MyHomePage createState() => MyHomePage();
}

class MyHomePage extends State<HomePage> {
  int _counter = 0;
  List<ForumInfo> listLectures=[];

  void getForumInfo(ForumInfo newForum) async{
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InfoScreen(newForum)),
    );
  }

  void _incrementCounter(){
    setState(() {
      if(_counter <12){
        _counter ++;
      ForumInfo newLecture = new ForumInfo();
      getForumInfo(newLecture);
      listLectures.add(newLecture);}
    });}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          children: <Widget>
          [

            for ( var i = 0; i < _counter; i++)
              new SizedBox(
                  width: 300,
                  child:Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.lightBlue,width: 5.0),
                      borderRadius: BorderRadius.circular(30),
                            ),
                    onPressed: () {
                    },
                      padding: EdgeInsets.all(12),
                      color: Colors.white,
                      child: Text(listLectures[i].getName(),
                          style: TextStyle( fontSize:20,foreground: Paint()
                        ..shader = ui.Gradient.linear(
                          const Offset(0, 20),
                          const Offset(150, 20),
                          <Color>[
                            Colors.lightBlue,
                            Colors.blueGrey,
                          ],
                        ))),
      ),
    )
      )],)),
      floatingActionButton: FloatingActionButton(
        onPressed:_incrementCounter,
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class InfoScreen extends StatelessWidget { //adicionar palestra
  static final formKey = GlobalKey<FormState>();
  ForumInfo newForm;
  InfoScreen (this.newForm);
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
                    onSaved: (String val) =>  newForm.setName(val),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Descrição:'
                    ),
                    onSaved: (String val) => newForm.setText(val),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                        labelText: 'Hora:'
                    ),
                    onSaved: (String val) => newForm.setHour(int.parse(val)),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                        labelText: 'Minuto:'
                    ),
                    onSaved: (String val) => newForm.setMinutes(int.parse(val)),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Sala:'
                    ),
                    onSaved: (String val) => newForm.setRoom(val),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          onPressed:(){ _submit();
                          Navigator.pop(context);},
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