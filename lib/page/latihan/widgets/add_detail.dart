import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gonice/controllers/excercise_controller.dart';
import 'package:gonice/controllers/excercise_db_controller.dart';
import 'package:gonice/page/latihan/screens/list_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AddDetail extends StatefulWidget {
  final ExcerciseDBController excerciseDBController = Get.find();
  final listController = Get.put(ExcerciseController());
  final int index;
  final String detailID;
  final String youtubeID;

  AddDetail(
      {Key? key,
      required this.detailID,
      required this.youtubeID,
      required this.index})
      : super(key: key);

  @override
  State<AddDetail> createState() => _AddDetailState();
}

class _AddDetailState extends State<AddDetail> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: FutureBuilder<readExcercise?>(
          future: readExcercises(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final exc = snapshot.data;

              return exc == null
                  ? const Center(child: Text('No User'))
                  : buildExcercise(exc);
            } else {
              return const CircularProgressIndicator();
            }
          },
        ));
  }

  Widget buildExcercise(readExcercise excercise) {
    final YoutubePlayerController _controller = YoutubePlayerController(
        initialVideoId: widget.youtubeID,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ));

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              YoutubePlayer(
                controller: _controller,
                liveUIColor: Colors.amber,
              ),
              SizedBox(height: 10),
              Text(excercise.name,
                  style: TextStyle(fontSize: 36), textAlign: TextAlign.center),
              SizedBox(height: 10),
              Text(excercise.desc, style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if(quantity <= 0)
                    const IconButton(
                      onPressed: null,
                      icon: Icon(Icons.remove_circle),
                    ),
                  if(quantity > 0)
                    IconButton(
                      onPressed: (){setState(()=>quantity--);},
                      icon: Icon(Icons.remove_circle),
                    ),
                  Text('$quantity'),
                  IconButton(
                    onPressed: (){setState(()=>quantity++);},
                    icon: Icon(Icons.add_circle),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      createDB();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ListScreen()));
                      widget.listController.addExcercise(
                          widget.excerciseDBController.excercise[widget.index]);
                    },
                    child: const Text('Tambah'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<readExcercise?> readExcercises() async {
    final docExcercises =
        FirebaseFirestore.instance.collection("excercise").doc(widget.detailID);
    final snapshot = await docExcercises.get();

    if (snapshot.exists) {
      return readExcercise.fromJson(snapshot.data()!);
    }
  }

  Future createDB() async {
    final input = FirebaseFirestore.instance.collection('saved').doc();

    final savedInput = saved(
      id: input.id,
      name: widget.excerciseDBController.excercise[widget.index].name,
      desc: widget.excerciseDBController.excercise[widget.index].desc,
      date: DateTime.now(),
      rep: quantity,
      vidUrl: widget.excerciseDBController.excercise[widget.index].vidUrl,
      imgUrl: widget.excerciseDBController.excercise[widget.index].imgUrl,
    );
    final json = savedInput.toJson();
    await input.set(json);
  }
}

class readExcercise {
  final String id;
  final String name;
  final String desc;
  final String vidUrl;

  readExcercise({
    required this.id,
    required this.name,
    required this.desc,
    required this.vidUrl,
  });

  static readExcercise fromJson(Map<String, dynamic> json) => readExcercise(
        id: json['id'],
        name: json['name'],
        desc: json['desc'],
        vidUrl: json['vidUrl'],
      );
}

class saved {
  String id;
  final String name;
  final String desc;
  DateTime date;
  int rep;
  String vidUrl;
  String imgUrl;

  saved({
    this.id = "",
    required this.name,
    required this.desc,
    required this.date,
    required this.rep,
    required this.vidUrl,
    required this.imgUrl,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'desc': desc,
        'date': date,
        'rep': rep,
        'vidUrl': vidUrl,
        'imgUrl': imgUrl,
      };
}
