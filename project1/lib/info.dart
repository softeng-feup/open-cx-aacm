import 'parser.dart';
import 'objects.dart';


class AllInfo {
  List<Lecture> allLectures = [];
  List<User> people =[];
  List<Resource> resources=[];
  User currentUser;
  
  AllInfo(){
    Parser parser = new Parser();
    this.allLectures = parser.loadAllLectures();
    
    //sort lectures
    Comparator<Lecture> lectureComparator = (a, b) => a.time.compareTo(b.time);
    this.allLectures.sort(lectureComparator);

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

  void addFeedbackToLecture(FeedBack fedd, String lectname){
    int index = allLectures.indexWhere((note) => note.getName()==lectname);       
    allLectures[index].addFeedback(fedd);
  }

  Lecture getLecture(String name){
    var lecture = allLectures.firstWhere((lect) => lect.getName() == name, orElse: () => null);
    return lecture;
  }
  User getUser(String mail){
    var person = people.firstWhere((lect) => lect.getEmail() == mail, orElse: () => null);
    return person;
  }
  String getLectureInfo(String name){
    var lecture = allLectures.firstWhere((lect) => lect.getName() == name, orElse: () => null);
    return lecture.getInfo();
  }

}