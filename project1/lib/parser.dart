import 'objects.dart';

class Parser {
  List<User> people = [];
  List<Lecture> allLectures = [];
  List<Resource> resources = [];

  Parser() {
    User u0 = new User(0, "Ana", "1234", "ana@gmail.com");
    User u1 = new User(1, "Joao", "abcd", "joao@gmail.com");
    User u2 = new User(2, "Maria", "qwerty", "maria@gmail.com");
    User u3 = new User(3, "Joana", "sim", "joana@gmail.com");
    User u4 = new User(4, "Carlos", "tyu", "carlos@gmail.com");
    User s5 = new Speaker(5, "Jorge", "1234", "jorge@gmail.com");
    User s6 = new Speaker(5, "Regina", "carro", "regina@gmail.com");
    User s7 = new Speaker(5, "Mariana", "ola", "mariana@gmail.com");
    User s8 = new Speaker(5, "Carla Santos", "asdf", "carlaS@gmail.com");

    String des =
        "I love what I do! If want to know more about me follow my accounts";
    s5.setDescription(des);

    people.add(u0);
    people.add(u1);
    people.add(u2);
    people.add(u3);
    people.add(u4);
    people.add(s5);
    people.add(s6);
    people.add(s7);
    people.add(s8);

    DateTime d1 = new DateTime(2019, 12, 1);
    DateTime t1 = new DateTime(2019, 12, 1, 23);

    DateTime d2 = new DateTime(2019, 12, 10);
    DateTime t2 = new DateTime(2019, 12, 10, 5, 23);

    DateTime d3 = new DateTime(2019, 12, 19);
    DateTime t3 = new DateTime(2019, 12, 19, 17, 20);

    FeedBack f1 = new FeedBack(0, people[0], "gostei", 4, t2);
    FeedBack f2 = new FeedBack(1, people[1], "bastante interessante", 5, t1);

    Answer a1 = new Answer(
        0, people[5], "Não consigo ajudar pois ainda não foi investigado", t2);
    Question q1 = new Question(0, people[1], "porque é que isso acontece?", t1);
    q1.addAnswer(a1);

    Answer a2 =
        new Answer(1, people[6], "Veja o meu perfil para mais informação", t2);
    Question q2 =
        new Question(1, people[1], "Irá voltar a dar esta palestra?", t2);
    q2.addAnswer(a2);

    Lecture l1 =
        new Lecture("Comunicação", "Como comunicar", d1, t1, "B001", people[5]);
    l1.addFeedback(f1);
    l1.addFeedback(f2);
    l1.addQuestion(q1);

    Lecture l2 = new Lecture("Trasporte Industrial", "Transporte de cargas", d2,
        t2, "B003", people[6]);
    l2.addFeedback(f1);
    l2.addFeedback(f2);
    l2.addQuestion(q2);

    Lecture l3 = new Lecture(
        "Industria 4.0",
        "Indústria 4.0 ou Quarta Revolução Industrial",
        d3,
        t3,
        "B003",
        people[6]);

    l3.addFeedback(f1);

    allLectures.add(l1);
    allLectures.add(l2);
    allLectures.add(l3);
  }

  List<User> loadAllPeople() {
    return people;
  }

  List<Lecture> loadAllLectures() {
    return allLectures;
  }

  List<Resource> loadAllResources() {
    return resources;
  }
}
