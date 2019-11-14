import 'package:flutter/material.dart';
import 'package:project1/home_page.dart';


class ForumInfo {

  String name;
  String text;
  int hour;
  int minutes;
  String room;

ForumInfo(){
  this.name= "temp";
  this.text = "informacao sobre a palestra, superrrr importante";
  this.hour = 1;
  this.minutes = 2;
  this.room =" default";
}
  String getName() {return name;}
  String getText(){return text;}
  int getHour() {return hour;}
  int getMinutes() {return minutes;}
  String getRoom() {return room;}

  void setName( String name) {this.name= name;}
  void setText( String text) {this.text= text;}
  void setHour( int hour) {this.hour= hour;}
  void setMinutes( int minutes ) {this.minutes= minutes;}
  void setRoom( String room) {this.room= room;}

}