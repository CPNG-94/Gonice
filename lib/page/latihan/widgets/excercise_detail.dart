import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gonice/controllers/excercise_db_controller.dart';
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
        onPageChanged: _onPageViewChange,
        scrollDirection: Axis.vertical,
        controller: controller,
        itemCount: widget.excerciseController.excercise2.length,
        itemBuilder: (BuildContext context, int index) {
          final YoutubePlayerController _controller = YoutubePlayerController(
              initialVideoId: widget.excerciseController.excercise2[index].vidUrl,
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
                  child: Text(widget.excerciseController.excercise2[index].name,
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
                      Text('${widget.excerciseController.excercise2[index].rep.toString()} kali'),
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
                  child: Text(widget.excerciseController.excercise2[index].desc,
                      style: const TextStyle(fontSize: 16)
                  ),
                ),
                //_onPageViewChange(index),
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
      child: Text('Latihan ${index+1}/${widget.excerciseController.excercise2.length}',
        style: const TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }
}
