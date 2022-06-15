import 'package:flutter/material.dart';
import 'package:gonice/models/excercise_list_expert.dart';
import 'package:gonice/page/latihan/screens/expert_screen.dart';

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
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          itemCount: ExercisesExpert.excercise.length,
          itemBuilder: (BuildContext context, int index) {
            final YoutubePlayerController _controller = YoutubePlayerController(
                initialVideoId: ExercisesExpert.excercise[index].video,
                flags: const YoutubePlayerFlags(
                  autoPlay: false,
                  mute: false,
                ));
            return Scaffold(
              body: Container(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      YoutubePlayer(
                        controller: _controller,
                        liveUIColor: Colors.amber,
                      ),
                      const SizedBox(height: 10),
                      Text(ExercisesExpert.excercise[index].name,
                          style: const TextStyle(fontSize: 36),
                          textAlign: TextAlign.center),
                      Container(
                        height: 20,
                        color: Colors.white12,
                      ),
                      Text(ExercisesExpert.excercise[index].description,
                          style: const TextStyle(fontSize: 20)),
                      const SizedBox(height: 20),
                      Text(
                          'Lakukan selama ${ExercisesExpert.excercise[index].repetion}.',
                          style: const TextStyle(fontSize: 20)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(
                            height: 200,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () => controller.previousPage(
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.easeInOut),
                                child: const Text('Sebelumnya'),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () => controller.nextPage(
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.easeInOut),
                                child: const Text('Selanjutnya'),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
