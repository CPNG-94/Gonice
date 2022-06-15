import 'package:cloud_firestore/cloud_firestore.dart';

class Excercise {

  final String id;
  final String name;
  final String desc;
  final String vidUrl;
  final String imgUrl;

  const Excercise({required this.name, required this.desc, required this.vidUrl, required this.id, required this.imgUrl});

  static Excercise fromSnapshot(DocumentSnapshot snap) {
    Excercise excercise = Excercise(
      id: snap['id'],
      name: snap['name'],
      desc: snap['desc'],
      vidUrl: snap['vidUrl'],
      imgUrl: snap['imgUrl'],
    );
    return excercise;
  }
}

