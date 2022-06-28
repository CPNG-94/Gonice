import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gonice/models/excercise2.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExcerciseDetail extends StatefulWidget {
  final int index;
  final String username;

  const ExcerciseDetail({Key? key, required this.index, required this.username}) : super(key: key);

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
    return StreamBuilder<List<Saved>>(
      stream: readSaved(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Terjadi Kesalahan! ${snapshot.error}');
        } else if (snapshot.hasData) {
          return PageView(
            scrollDirection: Axis.vertical,
            children: snapshot.data!.map((e) => buildPage(e, context)).toList(),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget buildPage(Saved saved, context) {
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
                Text('${saved.rep.toString()} kali', style: const TextStyle(color: Colors.black)),
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

  Stream<List<Saved>> readSaved() => FirebaseFirestore.instance
      .collection('saved')
      .where('uid', isEqualTo: widget.username)
      .orderBy('date')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => Saved.fromJson(doc.data())).toList()
  );
}
