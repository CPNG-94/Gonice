import 'package:cloud_firestore/cloud_firestore.dart';

class Saved{
  final String id;
  final String uid;
  final String name;
  final String desc;
  final DateTime date;
  final int rep;
  final String vidUrl;
  final String imgUrl;

  Saved({
    required this.name,
    required this.desc,
    required this.id,
    required this.uid,
    required this.date,
    required this.rep,
    required this.vidUrl,
    required this.imgUrl
  });

  static Saved fromJson(Map<String, dynamic> json) => Saved(
    id: json['id'],
    uid: json['uid'],
    name: json['name'],
    desc: json['desc'],
    date: (json['date'] as Timestamp).toDate(),
    rep: (json['rep']),
    vidUrl: (json['vidUrl']),
    imgUrl: (json['imgUrl']),
  );
}