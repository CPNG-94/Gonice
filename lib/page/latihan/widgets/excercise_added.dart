import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gonice/controllers/excercise_db_controller.dart';

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

  ExcerciseAddedCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shadowColor: Colors.green,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Ink.image(
                  image: NetworkImage(
                    excerciseDBController2.excercise2[index].imgUrl,
                  ),
                  child: InkWell(
                    onTap: () {},
                  ),
                  height: 80,
                  fit: BoxFit.fitHeight,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                excerciseDBController2.excercise2[index].name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'Repetisi: ${excerciseDBController2.excercise2[index].rep}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: ()=> showModalBottomSheet(
                    context: context,
                    builder: (context) => buildSheet(context),
                    isScrollControlled: true,
                  ),
                  icon: const Icon(Icons.info_outline_rounded),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildSheet(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.only(left: 150, right: 150),
        child: Divider(
          thickness: 3,
          color: Colors.grey,
        ),
      ),
      Image(
        image: NetworkImage(
          excerciseDBController2.excercise2[index].imgUrl
        ),
      ),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0),
        child: Text(excerciseDBController2.excercise2[index].name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0),
        child: Row(
          children: <Widget>[
            const Icon(Icons.access_time),
            const SizedBox(width: 10),
            Text('${excerciseDBController2.excercise2[index].rep.toString()} kali'),
          ],
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(18.0),
        child: Divider(
          color: Colors.grey,
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(left: 18.0, right: 18.0),
        child: Text('Deskripsi',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0),
        child: Text(
          excerciseDBController2.excercise2[index].desc,
          style: const TextStyle(fontSize: 16)
        ),
      ),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.only(left: 300),
        child: TextButton(
          onPressed: () {
            final deleteExcercise = FirebaseFirestore.instance
                .collection('saved')
                .doc(excerciseDBController2.excercise2[index].id);
            deleteExcercise.delete();
            Navigator.pop(context, true);
          },
          child: const Text(
            'Hapus',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
          ),
        ),
      ),
      const SizedBox(height: 10),
    ],
  );


  // showAlertDialog(BuildContext context) {
  //   Widget batalButton = TextButton(
  //     onPressed: () {
  //       Navigator.pop(context, true);
  //     },
  //     child: const Text('Batal'),
  //   );
  //   Widget hapusButton = TextButton(
  //     onPressed: () {
  //       final deleteExcercise = FirebaseFirestore.instance
  //           .collection('saved')
  //           .doc(excerciseDBController2.excercise2[index].id);
  //       deleteExcercise.delete();
  //       Navigator.pop(context, true);
  //     },
  //     child: const Text('Hapus'),
  //   );
  //   AlertDialog alert = AlertDialog(
  //     content: Text("Anda yakin ingin menghapus?"),
  //     actions: [
  //       batalButton,
  //       hapusButton,
  //     ],
  //   );
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }
}
