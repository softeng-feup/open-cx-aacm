import 'package:flutter/material.dart';
import 'dart:io';


class AllInfo {
  List<Lecture> allLectures = [];
  List<User> people =[];
  
  AllInfo();  
  List<Lecture> getAllLectures() {return allLectures;}
  List<User> getPeople() {return people;}
  void setAllLectures( List<Lecture> lectures){this.allLectures = lectures;}
  void setPeople(List<User> people){this.people = people;}
  void addLecture(Lecture lecture ){allLectures.add(lecture);}
  void addPerson(User person){people.add(person);}
}

class Lecture {

  String name;
  String text;
  Date date;
  String room;
  Speaker speaker;
  List<Question> questionForum = [];
  List<FeedBack> feedbackForum = [];
  List<Resource> resources = [];

  Lecture(this.name, this.text, this.date, this.room, this.speaker);

  String getName() {return name;}
  String getText(){return text;}
  Date getDate(){return date;}
  String getRoom() {return room;}
  Speaker getSpeaker() {return speaker;}
  List<Question> getQuestionForum(){return questionForum;}
  List<FeedBack> getFeedbackForum(){return feedbackForum; }
  List<Resource> getResources(){return resources;}
  void setName( String name) {this.name= name;}
  void setText( String text) {this.text= text;}
  void setDate(Date d){this.date = d;}
  void setRoom( String room) {this.room= room;}

  void addQuestion(Question q){questionForum.add(q);}
  void addFeedback(FeedBack f){feedbackForum.add(f);}
  void addResource(Resource r){resources.add(r);}
}

class FeedBack {
  int id;
  User user;
  String text;
  Date date;
  int stars;
  FeedBack(this.id,this.user,this.text,this.stars);

  int getId(){return id;}
  User getUser(){return user;}
  String getText(){return text;}
  Date getDate(){return date;}
  void setUser(User usr){this.user = usr;}
  void setText(String text){this.text = text;}
  void setDate(Date d){this.date = d;}

}

class Question {
  int id;
  User user;
  String text;
  Date date;
  Answer answer;

  Question(this.id,this.user,this.text,this.date);
  int getId(){return id;}
  User getUser(){return user;}
  String getText(){return text;}
  Date getDate(){return date;}
  Answer getAnswer(){return answer;}
  void setUser(User usr){this.user = usr;}
  void setText(String text){this.text = text;}
  void setDate(Date d){this.date = d;}
  void setAnswer(Answer a){this.answer = a;}
}

class Answer{
  int id;
  Speaker speaker;
  String text;
  Date date;

  Answer(this.id,this.speaker,this.text,this.date);
  int getId(){return id;}
  Speaker getSpeaker(){return speaker;}
  String getText(){return text;}
  Date getDate(){return date;}
  void setSpeaker(Speaker sp){this.speaker = sp;}
  void setText(String text){this.text = text;}
  void setDate(Date d){this.date = d;}
}

class Resource{
  int id;
  String text;
  String file;

  Resource(this.id,this.text,this.file);

  int getId(){return id;}
  String getText(){return text;}
  String getFile(){return file;}

  void setText(String txt){this.text = txt;}
  void setFile(String file){this.file = file;}
}

class User {

  int id;
  String name;
  String password;
  String photo = 'https://corporatefinanceinstitute.com/assets/professional-1200x747.jpg';
  String email;

  User(this.id, this.name, this.password, this.email);

  int getId() {return id;}
  String getName() {return name;}
  String getPass() {return password;}
  String getPhoto(){return photo;}
  String getEmail() {return email;}
  void setName(String name) { this.name = name;}
  void setPass(String pass) {this.password = pass;}
  void setPhoto(String photo){ this.photo = photo;}
  void setEmail(String email) { this.email = email;}
}

class Speaker extends User{

  List<Lecture> lectures = [];

  Speaker(int id, String nome, String pass, String email): super(id, nome, pass, email); 

  List<Lecture> getLectures(){return lectures;}
  void setLectures(List<Lecture> lectures){ this.lectures = lectures;}
  void addLecture(Lecture lect){lectures.add(lect);}
}

class Date {
  int day;
  int month;
  int year;
  int hour;
  int minutes;

  Date(this.day, this.month, this.year, this.hour, this.minutes);
  int getDay(){return day;}
  int getMonth(){return month;}
  int getYear(){return year;}
  int getHour(){return hour;}
  int getMinutes(){return minutes;}
}