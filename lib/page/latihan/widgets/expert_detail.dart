import 'package:flutter/material.dart';
import 'package:gonice/models/excercise_list_expert.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExpertDetail extends StatefulWidget {
  final int index;

  const ExpertDetail({Key? key, required this.index}) : super(key: key);

  @override
  State<ExpertDetail> createState() => _ExpertDetailState();
}

class _ExpertDetailState extends State<ExpertDetail> {
  final controller = PageController(initialPage: 0);

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        onPageChanged: _onPageViewChange,
        scrollDirection: Axis.vertical,
        controller: controller,
        itemCount: ExercisesExpert.excercise.length,
        itemBuilder: (BuildContext context, int index) {
          final YoutubePlayerController _controller = YoutubePlayerController(
              initialVideoId: ExercisesExpert.excercise[index].video,
              flags: const YoutubePlayerFlags(
                autoPlay: false,
                mute: false,
              ));
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              YoutubePlayer(
                controller: _controller,
                liveUIColor: Colors.amber,
              ),
              const SizedBox(height: 20),
              _onPageViewChange(index),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                child: Text(ExercisesExpert.excercise[index].name,
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
                    Text(ExercisesExpert.excercise[index].repetion),
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
                child: Text(ExercisesExpert.excercise[index].description,
                    style: const TextStyle(fontSize: 16)
                ),
              ),
            ],
          );
        },
      ),
    );
  }
  _onPageViewChange(index) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0),
      child: Text('Latihan ${index+1}/${ExercisesExpert.excercise.length}',
        style: const TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }
}
