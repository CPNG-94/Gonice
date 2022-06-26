import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gonice/controllers/excercise_db_controller.dart';
import 'package:gonice/page/latihan/widgets/excercise_added.dart';
import 'package:gonice/services/firestore_db.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExcerciseDetail extends StatefulWidget {
  final int index;
  final String username;

  ExcerciseDetail({Key? key, required this.index, required this.username}) : super(key: key);

  @override
  State<ExcerciseDetail> createState() => _ExcerciseDetailState();
}

class _ExcerciseDetailState extends State<ExcerciseDetail> {
  final controller = PageController(initialPage: 0);

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    //final excerciseController = Get.put(ExcerciseDBController2(widget.username));
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: StreamBuilder<List<Saved>>(
        stream: readSaved(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Terjadi Kesalahan! ${snapshot.error}');
          } else if (snapshot.hasData) {
            final saved = snapshot.data!;
            return PageView(
              children: saved.map(buildPage).toList(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      // body: PageView.builder(
      //   onPageChanged: _onPageViewChange,
      //   scrollDirection: Axis.vertical,
      //   controller: controller,
      //   itemCount: excerciseController.excercise2.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     final YoutubePlayerController _controller = YoutubePlayerController(
      //         initialVideoId: excerciseController.excercise2[index].vidUrl,
      //         flags: const YoutubePlayerFlags(
      //           autoPlay: false,
      //           mute: false,
      //         ));
      //     return Expanded(
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: <Widget>[
      //           YoutubePlayer(
      //             controller: _controller,
      //             liveUIColor: Colors.amber,
      //           ),
      //           const SizedBox(height: 20),
      //           _onPageViewChange(index),
      //           const SizedBox(height: 10),
      //           Padding(
      //             padding: const EdgeInsets.only(left: 18.0, right: 18.0),
      //             child: Text(excerciseController.excercise2[index].name,
      //               style: const TextStyle(
      //                 fontSize: 20,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //           ),
      //           const SizedBox(height: 10),
      //           Padding(
      //             padding: const EdgeInsets.only(left: 18.0, right: 18.0),
      //             child: Row(
      //               children: <Widget>[
      //                 const Icon(Icons.access_time),
      //                 const SizedBox(width: 10),
      //                 Text('${excerciseController.excercise2[index].rep.toString()} kali'),
      //               ],
      //             ),
      //           ),
      //           const Padding(
      //             padding: EdgeInsets.all(18.0),
      //             child: Divider(
      //               color: Colors.grey,
      //             ),
      //           ),
      //           const Padding(
      //             padding: EdgeInsets.only(left: 18.0, right: 18.0),
      //             child: Text('Deskripsi',
      //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //             ),
      //           ),
      //           const SizedBox(height: 10),
      //           Padding(
      //             padding: const EdgeInsets.only(left: 18.0, right: 18.0),
      //             child: Text(excerciseController.excercise2[index].desc,
      //                 style: const TextStyle(fontSize: 16)
      //             ),
      //           ),
      //           //_onPageViewChange(index),
      //         ],
      //       ),
      //     );
      //   },
      // ),
    );
  }

  Widget buildPage(Saved saved) {
    final YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: saved.vidUrl,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      )
    );
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          YoutubePlayer(
            controller: _controller,
            liveUIColor: Colors.amber,
          ),
          const SizedBox(height: 20),
          //_onPageViewChange(widget.index),
          const SizedBox(height: 10),
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
                Text(saved.rep.toString()),
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
            child: Text(saved.desc,
                style: const TextStyle(fontSize: 16)
            ),
          ),
          //_onPageViewChange(index),
        ],
      ),
    );
  }

  // _onPageViewChange(index) {
  //   final saved = snapshot.data!;
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 18.0, right: 18.0),
  //     child: Text('Latihan ${index+1}/${}',
  //       style: const TextStyle(
  //         fontSize: 15,
  //       ),
  //     ),
  //   );
  // }

  Stream<List<Saved>> readSaved() => FirebaseFirestore.instance
      .collection('saved')
      .where('uid', isEqualTo: widget.username)
      .orderBy('date')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => Saved.fromJson(doc.data())).toList()
  );
}

// class Saved{
//   final String id;
//   final String uid;
//   final String name;
//   final String desc;
//   final DateTime date;
//   final int rep;
//   final String vidUrl;
//   final String imgUrl;
//
//   Saved({
//     required this.name,
//     required this.desc,
//     required this.id,
//     required this.uid,
//     required this.date,
//     required this.rep,
//     required this.vidUrl,
//     required this.imgUrl
//   });
//
//   static Saved fromJson(Map<String, dynamic> json) => Saved(
//     id: json['id'],
//     uid: json['uid'],
//     name: json['name'],
//     desc: json['desc'],
//     date: (json['date'] as Timestamp).toDate(),
//     rep: (json['rep']),
//     vidUrl: (json['vidUrl']),
//     imgUrl: (json['imgUrl']),
//   );
// }
