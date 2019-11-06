import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  HomePage({Key key, this.title}) : super(key: key);

  static String tag = 'home-page';
  final String title;

  @override
  MyHomePage createState() => MyHomePage();
}

class MyHomePage extends State<HomePage> {
  int _counter = 0;
  List<String> listLectures=[];
  void _incrementCounter() {
    setState(() {
      if(_counter <12)
        _counter ++;
      listLectures.add('Palestra ${_counter}');
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
              new FlatButton.icon(
                  padding: const EdgeInsets.all(10),
                  color: Colors.lightBlue,
                  textColor: Colors.white,
                  icon: Icon(Icons.favorite_border), //`Icon` to display
                  label: Text(listLectures[i]), //`Text` to display
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Forum(listLectures[i])),
                    );
                  }
              )

          ],

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Forum extends StatelessWidget {
  String j;
  Forum(String i)
  {
    j=i;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forum ${j}"),
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.lightBlue,
          onPressed: () {
            // Navigate back to first route when tapped.
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}