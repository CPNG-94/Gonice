import 'package:cloud_firestore/cloud_firestore.dart';

class Excercise2 {

  final String id;
  final String name;
  final String desc;
  final DateTime date;
  final int rep;
  final String vidUrl;
  final String imgUrl;

  const Excercise2({required this.name, required this.desc, required this.id, required this.date, required this.rep, required this.vidUrl, required this.imgUrl});

  static Excercise2 fromSnapshot(DocumentSnapshot snap) {
    Excercise2 excercise2 = Excercise2(
      id: snap['id'],
      name: snap['name'],
      desc: snap['desc'],
      date: (snap['date'] as Timestamp).toDate(),
      rep: (snap['rep']),
      vidUrl: (snap['vidUrl']),
      imgUrl: (snap['imgUrl']),
    );
    return excercise2;
  }
}
