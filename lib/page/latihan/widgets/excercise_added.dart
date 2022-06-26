import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:gonice/controllers/excercise_db_controller.dart';
// import 'package:gonice/models/excercise2.dart';
// import 'package:gonice/page/latihan/widgets/excercise_list.dart';
// import 'package:gonice/services/firestore_db.dart';

// class ExcerciseAdded extends StatelessWidget {
//   final String username;
//   const ExcerciseAdded({Key? key, required this.username}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final excerciseController = Get.put(ExcerciseDBController2(username));
//     return Flexible(
//         child: StreamBuilder<List<Excercise2>>(
//           stream: readSaved(),
//           builder: (context, snapshot) {
//             if(snapshot.hasError) {
//               return Text('Terjadi Kesalahan! ${snapshot.error}');
//             } else if(snapshot.hasData) {
//               final excercise = snapshot.data!;
//               return ListView.builder(
//                 itemCount: excerciseController.excercise2.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return ExcerciseAddedCard(index: index, username: username);
//                 },
//               );
//             } else {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           },
//         ),
//         // child: ListView.builder(
//         //   itemCount: excerciseController.excercise2.length,
//         //   itemBuilder: (BuildContext context, int index) {
//         //     return ExcerciseAddedCard(index: index, username: username);
//         //   },
//         // ),
//       );
//   }
//   // Stream<List<Excercise2>> getAllProducts() {
//   //   return FirebaseFirestore.instance
//   //       .collection('saved')
//   //       .where('uid', isEqualTo: username)
//   //       .orderBy('date', descending: false)
//   //       .snapshots()
//   //       .map((snapshot) {
//   //     return snapshot.docs.map((doc) => Excercise2.fromSnapshot(doc)).toList();
//   //   });
//   // }
//   Stream<List<Excercise2>> readSaved() => FirebaseFirestore.instance
//       .collection('saved')
//       .where('uid', isEqualTo: username)
//       .orderBy('date')
//       .snapshots()
//       .map((snapshot) => snapshot.docs.map((doc) => Excercise2.fromSnapshot(doc)).toList());
//
// }


class ExcerciseAdded extends StatelessWidget {
  final String username;
  ExcerciseAdded({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     //final excerciseController = Get.put(ExcerciseDBController2(username));
//     return Obx(
//       () => Flexible(
//         child: ListView.builder(
//           itemCount: excerciseController.excercise2.length,
//           itemBuilder: (BuildContext context, int index) {
//             return ExcerciseAddedCard(index: index, username: username);
//           },
//         ),
//       ),
//     );
//   }
// }
    return Scaffold(
      body: StreamBuilder<List<Saved>>(
        stream: readSaved(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Terjadi Kesalahan! ${snapshot.error}');
          } else if (snapshot.hasData) {
            final saved = snapshot.data!;
            return ListView(
              children: saved.map(buildCard).toList(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget buildCard(Saved saved) =>
      Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
        child: Card(
          shadowColor: Colors.green,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: InkWell(
            splashColor: const Color(0xFF00ADB5),
            // onTap: () {
            //   buildSheet(saved);
            // },
            // => showModalBottomSheet(
            //   context: ,
            //   builder: (context) => buildSheet(context, saved),
            //   isScrollControlled: true,
            // ),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Ink.image(
                      image: NetworkImage(
                        saved.imgUrl,
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
                    saved.name,
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
                    'Repetisi: ${saved.rep}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      );

  buildSheet(BuildContext context, Saved saved) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
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
                  saved.imgUrl
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18.0),
              child: Text(saved.name,
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
                  Text('${saved.rep.toString()} kali'),
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
                  saved.desc,
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
                      .doc(saved.id);
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
      }
    );
  }

  // Stream<List<Excercise2>> readSaved() => FirebaseFirestore.instance
  //     .collection('saved')
  //     .where('uid', isEqualTo: username)
  //     .orderBy('date')
  //     .snapshots()
  //     .map((snapshot) => snapshot.docs.map((doc) => Excercise2.fromSnapshot(doc)).toList());

  Stream<List<Saved>> readSaved() =>
      FirebaseFirestore.instance
          .collection('saved')
          .where('uid', isEqualTo: username)
          .orderBy('date')
          .snapshots()
          .map((snapshot) =>
          snapshot.docs.map((doc) => Saved.fromJson(doc.data())).toList()
      );
}



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


// class ExcerciseAddedCard extends StatelessWidget {
//   final ExcerciseDBController2 excerciseDBController2 = Get.find();
//   final int index;
//   final String username;
//
//   ExcerciseAddedCard({Key? key, required this.index, required this.username}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, Saved saved) {
//     final excerciseController = Get.put(ExcerciseDBController2(username));
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Card(
//         shadowColor: Colors.green,
//         clipBehavior: Clip.antiAlias,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(24),
//         ),
//         child: Column(
//           children: [
//             Stack(
//               alignment: Alignment.center,
//               children: [
//                 Ink.image(
//                   image: NetworkImage(
//                     excerciseDBController2.excercise2[index].imgUrl,
//                   ),
//                   child: InkWell(
//                     onTap: () {},
//                   ),
//                   height: 80,
//                   fit: BoxFit.fitHeight,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Padding(
//               padding: const EdgeInsets.all(16).copyWith(bottom: 0),
//               child: Text(
//                 excerciseDBController2.excercise2[index].name,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16).copyWith(bottom: 0),
//               child: Text(
//                 'Repetisi: ${excerciseDBController2.excercise2[index].rep}',
//                 style: const TextStyle(
//                   fontSize: 14,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             ButtonBar(
//               alignment: MainAxisAlignment.end,
//               children: [
//                 IconButton(
//                   onPressed: ()=> showModalBottomSheet(
//                     context: context,
//                     builder: (context) => buildSheet(context),
//                     isScrollControlled: true,
//                   ),
//                   icon: const Icon(Icons.info_outline_rounded),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   buildSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Padding(
//               padding: EdgeInsets.only(left: 150, right: 150),
//               child: Divider(
//                 thickness: 3,
//                 color: Colors.grey,
//               ),
//             ),
//             Image(
//               image: NetworkImage(
//                   excerciseDBController2.excercise2[index].imgUrl
//               ),
//             ),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.only(left: 18.0, right: 18.0),
//               child: Text(excerciseDBController2.excercise2[index].name,
//                 style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.only(left: 18.0, right: 18.0),
//               child: Row(
//                 children: <Widget>[
//                   const Icon(Icons.access_time),
//                   const SizedBox(width: 10),
//                   Text('${excerciseDBController2.excercise2[index].rep.toString()} kali'),
//                 ],
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.all(18.0),
//               child: Divider(
//                 color: Colors.grey,
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.only(left: 18.0, right: 18.0),
//               child: Text('Deskripsi',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//             ),
//             const SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.only(left: 18.0, right: 18.0),
//               child: Text(
//                   excerciseDBController2.excercise2[index].desc,
//                   style: const TextStyle(fontSize: 16)
//               ),
//             ),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.only(left: 300),
//               child: TextButton(
//                 onPressed: () {
//                   final deleteExcercise = FirebaseFirestore.instance
//                       .collection('saved')
//                       .doc(excerciseDBController2.excercise2[index].id);
//                   deleteExcercise.delete();
//                   Navigator.pop(context, true);
//                 },
//                 child: const Text(
//                   'Hapus',
//                   style: TextStyle(
//                       color: Colors.red,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//           ],
//         );
//       }
//     );
//   }
// }


