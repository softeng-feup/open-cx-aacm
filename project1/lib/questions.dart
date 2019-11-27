import 'package:flutter/material.dart';
import 'package:project1/info.dart' as prefix0;
import 'objects.dart';
import 'package:nice_button/nice_button.dart';

class QuestionForum extends StatelessWidget {

  var firstColor = Color(0xff5b86e5), secondColor = Color(0xff36d1dc);
  static BuildContext context;
  Question lol = new Question("lol","lools","loooool");
  List<Question> Questions=[];

  QuestionForum(){
    Questions.add(lol);
  }

  @override
  Widget build(BuildContext context1) {

    return Scaffold(
        backgroundColor: Color(0xFFFAFAFA),
        appBar: AppBar(
          title: Text("Live Feedback"),
          backgroundColor: Color(0xFF3EA6F2),
        ),
        body: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index){
                  return Container(
                      height: 50,
                      child: Center(
                          child:NiceButton(
                            radius: 40,
                            padding: const EdgeInsets.all(15),
                            text: "Register",
                            icon: Icons.account_box,
                            gradientColors: [secondColor, firstColor],
                            onPressed: () {},
                          )),
                  );
                },
                
              )
            ],
          )
        ])
    );
  }

}