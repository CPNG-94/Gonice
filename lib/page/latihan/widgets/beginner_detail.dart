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
        title: const Text(
          'Beginner',
          style: TextStyle(
              color: Colors.black
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: PageView.builder(
        onPageChanged: _onPageViewChange,
        scrollDirection: Axis.vertical,
        controller: controller,
        itemCount: Exercises.excercise.length,
        itemBuilder: (BuildContext context, int index) {
          final YoutubePlayerController _controller = YoutubePlayerController(
              initialVideoId: Exercises.excercise[index].video,
              flags: const YoutubePlayerFlags(
                autoPlay: false,
                mute: false,
              ));
          return Expanded(
            child: Column(
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
                  child: Text(Exercises.excercise[index].name,
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
                      Text(Exercises.excercise[index].repetion),
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
                  child: Text(Exercises.excercise[index].description,
                      style: const TextStyle(fontSize: 16)
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  _onPageViewChange(index) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0),
      child: Text('Latihan ${index+1}/${Exercises.excercise.length}',
        style: const TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }
  // _onPageViewChange (index){
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       const SizedBox(
  //         height: 200,
  //       ),
  //       Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           if(index <= 0)
  //             const ElevatedButton(
  //               onPressed: null,
  //               child: Text('Sebelumnya'),
  //             ),
  //           if(index > 0)
  //             ElevatedButton(
  //               onPressed: () => controller.previousPage(duration: const Duration(seconds: 1), curve: Curves.easeInOut),
  //               child: const Text('Sebelumnya'),
  //             ),
  //         ],
  //       ),
  //       const SizedBox(
  //         width: 100,
  //       ),
  //       Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           if(index == Exercises.excercise.length - 1)
  //             ElevatedButton(
  //               onPressed: () => Navigator.pop(context),
  //               child: const Text('Selesai'),
  //             ),
  //           if(index < Exercises.excercise.length - 1)
  //             ElevatedButton(
  //               onPressed: () => controller.nextPage(duration: const Duration(seconds: 1), curve: Curves.easeInOut),
  //               child: const Text('Selanjutnya'),
  //             ),
  //         ],
  //       ),
  //     ],
  //   );
  // }
}


