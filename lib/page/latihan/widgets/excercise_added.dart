import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Gonice/controllers/excercise_db_controller.dart';

class ExcerciseAdded extends StatelessWidget {
  ExcerciseAdded({Key? key}) : super(key: key);
  final excerciseController = Get.put(ExcerciseDBController2());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flexible(
        child: ListView.builder(
          itemCount: excerciseController.excercise2.length,
          itemBuilder: (BuildContext context, int index) {
            return ExcerciseAddedCard(index: index);
          },
        ),
      ),
    );
  }
}

class ExcerciseAddedCard extends StatelessWidget {
  final ExcerciseDBController2 excerciseDBController2 = Get.find();
  final int index;

  ExcerciseAddedCard({
    Key? key,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: -4,
                  blurRadius: 1,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Container(
              height: 100,
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Image.network(excerciseDBController2.excercise2[index].imgUrl),
                      title: Text(excerciseDBController2.excercise2[index].name),
                      subtitle: Text('Rep : ${excerciseDBController2.excercise2[index].rep.toString()} '),
                      trailing: Column(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              showAlertDialog(context);
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    Widget batalButton = TextButton(
      onPressed: (){
        Navigator.pop(context,true);
      },
      child: const Text('Batal'),
    );
    Widget hapusButton = TextButton(
      onPressed:  () {
        final deleteExcercise = FirebaseFirestore.instance
            .collection('saved')
            .doc(excerciseDBController2.excercise2[index].id);
        deleteExcercise.delete();
        Navigator.pop(context,true);
      },
      child: const Text('Hapus'),
    );
    AlertDialog alert = AlertDialog(
      content: Text("Anda yakin ingin menghapus?"),
      actions: [
        batalButton,
        hapusButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
