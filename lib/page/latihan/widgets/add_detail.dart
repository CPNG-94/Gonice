import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:test_custom/controllers/excercise_controller.dart';
// import 'package:test_custom/controllers/excercise_db_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_custom/models/excercise.dart';

final excerciseRef = FirebaseFirestore.instance.collection('excercise');

class AddDetail extends StatefulWidget {
  final String excId;

  AddDetail({Key? key, required this.excId}) : super(key: key);

  @override
  State<AddDetail> createState() => _AddDetailState();
}

class _AddDetailState extends State<AddDetail> {
  late Excercise exc;
  @override
  void initState(){
    //getExcercise();
    getExcerciseById();
    super.initState();
  }

  /*getExcercise() {
    excerciseRef.get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((DocumentSnapshot doc) {
        print(doc.data());

      });
    });
  }*/

  getExcerciseById() async {
    this.exc = (await excerciseRef.doc(widget.excId).get()) as Excercise;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(exc.name),
          ],
        ),
      ),
    );
  }
}

/*class readExcercise {
  final String id;
  final String name;
  final String desc;
  final String vidUrl;

  readExcercise({
    required this.id,
    required this.name,
    required this.desc,
    required this.vidUrl,
  });

  static readExcercise fromJson(Map<String, dynamic> json) => readExcercise(
    id: 'id',
    name: 'name',
    desc: 'desc',
    vidUrl: 'vidUrl',
  );
}*/




