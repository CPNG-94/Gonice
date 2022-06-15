import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gonice/controllers/excercise_controller.dart';
import 'package:gonice/controllers/excercise_db_controller.dart';
import 'package:gonice/page/latihan/widgets/add_detail.dart';

class ExcerciseList extends StatelessWidget {
  final excerciseController = Get.put(ExcerciseDBController());
  ExcerciseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flexible(
        child: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: excerciseController.excercise.length,
          itemBuilder: (BuildContext context, int index) {
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
    final detailId = excerciseDBController.excercise[index];
    return Container(
      height: 100,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Image.network(detailId.imgUrl),
              title: Text(detailId.name),
              trailing: Column(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddDetail(
                              detailID: detailId.id,
                              youtubeID: detailId.vidUrl,
                              index: index)));
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
