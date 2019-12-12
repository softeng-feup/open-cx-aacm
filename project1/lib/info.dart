import 'parser.dart';
import 'objects.dart';


class AllInfo {
  List<Lecture> allLectures = [];
  List<User> people =[];
  
  AllInfo(){
    Parser parser = new Parser();
    this.allLectures = parser.loadAllLectures();
    this.people = parser.loadAllPeople();
  } 
  
  List<Lecture> getAllLectures() {return allLectures;}
  List<User> getPeople() {return people;}
  void setAllLectures( List<Lecture> lectures){this.allLectures = lectures;}
  void setPeople(List<User> people){this.people = people;}
  void addLecture(Lecture lecture ){allLectures.add(lecture);}
  void addPerson(User person){people.add(person);}



}