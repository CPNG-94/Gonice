import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_custom/controllers/excercise_db_controller.dart';
import 'package:test_custom/controllers/excercise_controller.dart';
import 'package:test_custom/widgets/add_detail.dart';

class ExcerciseList extends StatelessWidget {
  final excerciseController = Get.put(ExcerciseDBController());
  ExcerciseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      Flexible(
        child: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: excerciseController.excercise.length,
          itemBuilder: (BuildContext context, int index){
            return ExcerciseListCard(index: index);
          },
        ),
      ),
    );
  }
}

class ExcerciseListCard extends StatelessWidget {
  final listController = Get.put(ExcerciseController());
  final ExcerciseDBController excerciseDBController = Get.find();
  final int index;
  ExcerciseListCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.broken_image),
            title: Text(excerciseDBController.excercise[index].name),
            trailing: Column(
              children: <Widget>[
                IconButton(
                  onPressed: (){
                    listController.addExcercise(excerciseDBController.excercise[index]);
                    createDB();
                    Navigator.pop(context, MaterialPageRoute(builder: (context) => AddDetail(excId: excerciseDBController.excercise[index].id)));
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Future createDB() async{
    final input = FirebaseFirestore.instance.collection('saved').doc();

    final savedInput = saved(
      id: input.id,
      name: excerciseDBController.excercise[index].name,
      date : DateTime.now(),
    );
    final json = savedInput.toJson();
    await input.set(json);
  }
}

class saved {
  String id;
  final String name;
  DateTime date;

  saved({
    this.id = "",
    required this.name,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'date': date,
  };
}

