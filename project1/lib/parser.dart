import 'package:flutter/material.dart';
import 'package:project1/info.dart' as prefix0;
import 'dart:io';
import 'info.dart';


class Parser{

  AllInfo info = new AllInfo();

  void load(){
    User u0 = new User(0, "Ana" , "1234", "ana@gmail.com");
    User u1 = new User(1, "Joao" , "abcd", "joao@gmail.com");
    User u2 = new User(2, "Maria" , "qwerty", "maria@gmail.com");
    User u3 = new User(3, "Joana" , "sim", "joana@gmail.com");
    User u4 = new User(4, "Carlos" , "tyu", "carlos@gmail.com");
    User s5 = new Speaker(5, "Jorge" , "1234", "jorge@gmail.com");
    User s6 = new Speaker(5, "Sonia" , "carro", "sonia@gmail.com");
    User s7 = new Speaker(5, "Mariana" , "ola", "mariana@gmail.com");
    User s8 = new Speaker(5, "Carla Santos" , "asdf", "carlaS@gmail.com");
    info.addPerson(u0); info.addPerson(u1); info.addPerson(u2); info.addPerson(u3);
    info.addPerson(u4); info.addPerson(s5); info.addPerson(s6); info.addPerson(s7);
    info.addPerson(s8);

    Date d1 = new Date(1,12,2019,14,23);
    Date d2 = new Date(2,12,2019,14,23);
    Date d3 = new Date(3,12,2019,14,23);

    FeedBack f1 = new FeedBack(0, u0, "gostei", 4);
    FeedBack f2 = new FeedBack(1, u1, "bastante interessante", 5);

    Answer a1 = new Answer(0, s5, "Não consigo ajudar pois ainda não foi investigado", d2);
    Question q1 = new Question(0, u1, "porque é que isso acontece?", d1);
    q1.setAnswer(a1);

    Answer a2 = new Answer(1, s6, "Veja o meu perfil para mais informação", d2);
    Question q2 = new Question(1, u0, "irá voltar a dar esta palestra?", d1);
    q2.setAnswer(a2);

    Lecture l1 = new Lecture("Comunicação", "Como comunicar", d1, "B001", s5);
    l1.addFeedback(f1); l1.addFeedback(f2);
    l1.addQuestion(q1);

    Lecture l2 = new Lecture("Trasporte Industrial", "Transporte de cargas", d1, "B003", s6);
    l2.addFeedback(f1); l2.addFeedback(f2);
    l2.addQuestion(q2);
    
    info.addLecture(l1);
    info.addLecture(l2);
  }

  AllInfo getAllInfo(){return info;}
}