import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gonice/controllers/excercise_db_controller.dart';
import 'package:gonice/page/latihan/screens/list_screen.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExcerciseDetail extends StatefulWidget {
  final int index;
  final excerciseController = Get.put(ExcerciseDBController2());

  ExcerciseDetail({Key? key, required this.index}) : super(key: key);

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
        body: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          itemCount: widget.excerciseController.excercise2.length,
          itemBuilder: (BuildContext context, int index) {
            final YoutubePlayerController _controller = YoutubePlayerController(
                initialVideoId:
                    widget.excerciseController.excercise2[index].vidUrl,
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
                      Text(widget.excerciseController.excercise2[index].name,
                          style: const TextStyle(fontSize: 36),
                          textAlign: TextAlign.center),
                      Container(
                        height: 20,
                        color: Colors.white12,
                      ),
                      Text(widget.excerciseController.excercise2[index].desc,
                          style: const TextStyle(fontSize: 20)),
                      const SizedBox(height: 20),
                      Text(
                          'Lakukan sebanyak ${widget.excerciseController.excercise2[index].rep.toString()} kali',
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
