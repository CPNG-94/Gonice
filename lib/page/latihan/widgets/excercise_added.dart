import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:test_custom/controllers/excercise_controller.dart';
import 'package:test_custom/controllers/excercise_db_controller.dart';

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
            return ExcerciseAddedCard(
              index: index,
            );
          }
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
            child: Card(
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: InkWell(
                splashColor: Colors.grey,
                onTap: (){},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                      SizedBox(
                        height: 100,
                        child:  Text(excerciseDBController2.excercise2[index].name, style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
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
}

//excerciseDBController2.excercise2[index].name
