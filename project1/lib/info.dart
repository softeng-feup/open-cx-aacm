import 'parser.dart';
import 'objects.dart';


class AllInfo {
  List<Lecture> allLectures = [];
  List<User> people =[];
  List<Resource> resources=[];
  
  AllInfo(){
    Parser parser = new Parser();
    this.allLectures = parser.loadAllLectures();
    
    //sort lectures
    Comparator<Lecture> priceComparator = (a, b) => a.time.compareTo(b.time);
    this.allLectures.sort(priceComparator);

    this.people = parser.loadAllPeople();
    this.resources = parser.loadAllResources();
  } 

  List<Lecture> getAllLectures() {return allLectures;}
  List<User> getPeople() {return people;}
  List<Resource> getResources(){return resources;}
  void setAllLectures( List<Lecture> lectures){this.allLectures = lectures;}
  void setPeople(List<User> people){this.people = people;}
  void setResources(List<Resource> resources){this.resources=resources;}
  void addLecture(Lecture lecture ){allLectures.add(lecture);}
  void addPerson(User person){people.add(person);}
  void addResource(Resource resource){resources.add(resource);}

  Lecture getLecture(String name){
    var lecture = allLectures.firstWhere((lect) => lect.getName() == name, orElse: () => null);
    return lecture;
  }
  String getLectureInfo(String name){
    String info;
    var lecture = allLectures.firstWhere((lect) => lect.getName() == name, orElse: () => null);
    var hour = lecture.getTime().hour;
    var minute = lecture.getTime().minute;
    var room = lecture.getRoom();
    info = "$hour:$minute  Local: " + room;
    return info;
  }

}