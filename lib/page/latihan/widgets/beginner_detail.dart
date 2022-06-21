import 'package:flutter/material.dart';
import 'package:gonice/models/excercise_list.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BeginnerDetail extends StatefulWidget {
  final int index;

  const BeginnerDetail({Key? key, required this.index}) : super(key: key);

  @override
  State<BeginnerDetail> createState() => _BeginnerDetailState();
}

class _BeginnerDetailState extends State<BeginnerDetail> {
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
        onPageChanged: _onPageViewChange,
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        itemCount: Exercises.excercise.length,
        itemBuilder: (BuildContext context, int index) {
          final YoutubePlayerController _controller = YoutubePlayerController(
              initialVideoId: Exercises.excercise[index].video,
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
                    Text(Exercises.excercise[index].name,
                        style: const TextStyle(fontSize: 36),
                        textAlign: TextAlign.center),
                    Container(
                      height: 20,
                      color: Colors.white12,
                    ),
                    Text(Exercises.excercise[index].description,
                        style: const TextStyle(fontSize: 20)),
                    const SizedBox(height: 20),
                    Text(
                        'Lakukan selama ${Exercises.excercise[index].repetion}.',
                        style: const TextStyle(fontSize: 20)),
                    _onPageViewChange(index),
                  ],
                ),
              ),
            ),
          );
        },
      )
    );
  }
  _onPageViewChange (index){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          height: 200,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(index <= 0)
              const ElevatedButton(
                onPressed: null,
                child: Text('Sebelumnya'),
              ),
            if(index > 0)
              ElevatedButton(
                onPressed: () => controller.previousPage(duration: const Duration(seconds: 1), curve: Curves.easeInOut),
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
            if(index == Exercises.excercise.length - 1)
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Selesai'),
              ),
            if(index < Exercises.excercise.length - 1)
              ElevatedButton(
                onPressed: () => controller.nextPage(duration: const Duration(seconds: 1), curve: Curves.easeInOut),
                child: const Text('Selanjutnya'),
              ),
          ],
        ),
      ],
    );
  }
}