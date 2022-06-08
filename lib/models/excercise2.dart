import 'package:cloud_firestore/cloud_firestore.dart';

class Excercise2 {

  final String id;
  final String name;
  final DateTime date;

  const Excercise2({required this.name, required this.id, required this.date});

  static Excercise2 fromSnapshot(DocumentSnapshot snap) {
    Excercise2 excercise2 = Excercise2(
      id: snap['id'],
      name: snap['name'],
      date: (snap['date'] as Timestamp).toDate(),
    );
    return excercise2;
  }
}
