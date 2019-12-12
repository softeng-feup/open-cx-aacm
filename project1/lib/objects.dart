import 'package:file_picker/file_picker.dart';

class Lecture {

  String name;
  String text;
  DateTime date;
  DateTime time;
  String room;
  Speaker speaker;
  List<Question> questionForum = [];
  List<FeedBack> feedbackForum = [];
  List<Resource> resources = [];

  Lecture(this.name, this.text, this.date,this.time, this.room, this.speaker, );

  String getName() {return name;}
  String getText(){return text;}
  DateTime getDate(){return date;}
  DateTime getTime(){return time;}
  String getRoom() {return room;}
  Speaker getSpeaker() {return speaker;}
  List<Question> getQuestionForum(){return questionForum;}
  List<FeedBack> getFeedbackForum(){return feedbackForum; }
  List<Resource> getResources(){return resources;}
  void setName( String name) {this.name= name;}
  void setText( String text) {this.text= text;}
  void setDate(DateTime d){this.date = d;}
  void setRoom( String room) {this.room= room;}
  void setTime(DateTime t){this.time= t;}

  void addQuestion(Question q){questionForum.add(q);}
  void addFeedback(FeedBack f){feedbackForum.add(f);}
  void addResource(Resource r){resources.add(r);}
}

class FeedBack {
  int id;
  User user;
  String text;
  DateTime date;
  DateTime time;
  int stars;
  FeedBack(this.id,this.user,this.text,this.stars,this.date,this.time);

  int getId(){return id;}
  User getUser(){return user;}
  String getText(){return text;}
  DateTime getDate(){return date;}
  DateTime getTime(){return time;}

  void setUser(User usr){this.user = usr;}
  void setText(String text){this.text = text;}
  void setDate(DateTime d){this.date = d;}
  void setTime(DateTime t){this.time= t;}
}

class Question {
  int id;
  User user;
  String title;
  String description;
  DateTime date;
  DateTime time;
  Answer answer;

  Question(this.id, this.user, this.description, this.date, this.time);

  int getId(){return id;}
  User getUser(){return user;}
  String getText(){return description;}
  DateTime getDate(){return date;}
  Answer getAnswer(){return answer;}
  DateTime getTime(){return time;}

  void setPerson(User usr){this.user = usr;}
  void setDescription( String description){this.description = description;}
  void setDate(DateTime d){this.date = d;}
  void setAnswer(Answer a){this.answer = a;}
  void setName( String title){this.title =  title;}
  void setTime(DateTime t){this.time= t;}

}

class Answer{
  int id;
  Speaker speaker;
  String text;
  DateTime date;
  DateTime time;

  Answer(this.id,this.speaker,this.text,this.date, this.time);
  int getId(){return id;}
  Speaker getSpeaker(){return speaker;}
  String getText(){return text;}
  DateTime getDate(){return date;}
  DateTime gettime(){return time;}
  void setSpeaker(Speaker sp){this.speaker = sp;}
  void setText(String text){this.text = text;}
  void setDate(DateTime d){this.date = d;}
  void setTime(DateTime t){this.time= t;}

}

class Resource{
  String fileName;
  String path;
  String fileExtension;
  FileType fileType;

  Resource(this.fileName,this.path,this.fileExtension,this.fileType);

  String getFileName(){return fileName;}
  String getPath(){return path;}
  String getFileExtension(){return fileExtension;}
  FileType getFileType(){return fileType;}

  void setFileName(String name){this.fileName = name;}
  void setPath(String path){this.path = path;}
  void setFileExtension(String fileExt){this.fileExtension=fileExt;}
  void setFileType(FileType type){this.fileType=type;}
}

class User {

  int id;
  String name;
  String password;
  String photo = 'assets/images/default.jpg';
  String email;
  String description = "Missing Description";

  User(this.id, this.name, this.password, this.email);

  int getId() {return id;}
  String getName() {return name;}
  String getPass() {return password;}
  String getPhoto(){return photo;}
  String getEmail() {return email;}
  String getDescription() { return this.description;}

  void setName(String name) { this.name = name;}
  void setPass(String pass) {this.password = pass;}
  void setPhoto(String photo){ this.photo = photo;}
  void setEmail(String email) { this.email = email;}
  void setDescription(String d) { this.description = d;}

}

class Speaker extends User{

  List<Lecture> lectures = [];

  Speaker(int id, String nome, String pass, String email): super(id, nome, pass, email); 

  List<Lecture> getLectures(){return lectures;}
  void setLectures(List<Lecture> lectures){ this.lectures = lectures;}
  void addLecture(Lecture lect){lectures.add(lect);}
}



class RateData {
  int rate;
  String comment;
  RateData(rate, comment);
  int getRate(){return rate;}
  String getComment(){return comment;}
}