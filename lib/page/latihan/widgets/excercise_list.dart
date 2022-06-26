import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gonice/controllers/excercise_controller.dart';
import 'package:gonice/controllers/excercise_db_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExcerciseList extends StatelessWidget {
  final String username;
  final excerciseController = Get.put(ExcerciseDBController());
  ExcerciseList({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flexible(
        child: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: excerciseController.excercise.length,
          itemBuilder: (BuildContext context, int index) {
            return ExcerciseListCard(index: index, username: username);
          },
        ),
      ),
    );
  }
}

class ExcerciseListCard extends StatefulWidget {
  final String username;
  final int index;
  final listController = Get.put(ExcerciseController());

  ExcerciseListCard({Key? key, required this.index, required this.username}) : super(key: key);

  @override
  State<ExcerciseListCard> createState() => _ExcerciseListCardState();
}

class _ExcerciseListCardState extends State<ExcerciseListCard> {
  final listController = Get.put(ExcerciseController());
  final ExcerciseDBController excerciseDBController = Get.find();
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    final detailId = excerciseDBController.excercise[widget.index];
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Ink.image(
                image: NetworkImage(
                  detailId.imgUrl,
                ),
                child: InkWell(
                  onTap: ()=> showModalBottomSheet(
                    context: context,
                    builder: (context) => buildSheet(index: widget.index, username: widget.username),
                    isScrollControlled: true,
                  ),
                ),
                height: 110,
                fit: BoxFit.fitHeight,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(16).copyWith(bottom: 0),
            child: Text(
              detailId.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  // Widget buildSheet(BuildContext context) {
  //  
  // }
}

class buildSheet extends StatefulWidget {
  final int index;
  final String username;
  final listController = Get.put(ExcerciseController());
  buildSheet({Key? key, required this.index, required this.username}) : super(key: key);

  @override
  _buildSheetState createState() => _buildSheetState();
}

class _buildSheetState extends State<buildSheet> {
  final ExcerciseDBController excerciseDBController = Get.find();
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    final YoutubePlayerController _controller = YoutubePlayerController(
        initialVideoId: excerciseDBController.excercise[widget.index].vidUrl,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        )
    );

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
        YoutubePlayer(
          controller: _controller,
          liveUIColor: Colors.amber,
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0),
          child: Text(excerciseDBController.excercise[widget.index].name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 18.0, right: 18.0),
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
              excerciseDBController.excercise[widget.index].desc,
              style: const TextStyle(fontSize: 16)
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(18.0),
          child: Divider(
            color: Colors.grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0),
          child: Row(
            children: <Widget>[
              const Text('Jumlah repetisi: ', style: TextStyle(fontSize: 15)),
              if(quantity <= 0)
                const IconButton(
                  onPressed: null,
                  icon: Icon(Icons.remove_circle),
                ),
              if(quantity > 0)
                IconButton(
                  onPressed: (){setState(()=>quantity--);},
                  icon: const Icon(Icons.remove_circle),
                ),
              Text('$quantity'),
              IconButton(
                onPressed: (){setState(()=>quantity++);},
                icon: const Icon(Icons.add_circle),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF00ADB5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
              onPressed: () {
                createDBNewCollection();
                Navigator.of(context).pop();
                widget.listController.addExcercise(
                    excerciseDBController.excercise[widget.index]);
              },
              child: const Text('Tambah'),
            ),
          ),
        ),
      ],
    );
  }
  Future createDBNewCollection() async {
    final input = FirebaseFirestore.instance.collection('saved').doc();
    final savedInput = saved(
      id: input.id,
      uid: widget.username,
      name: excerciseDBController.excercise[widget.index].name,
      desc: excerciseDBController.excercise[widget.index].desc,
      date: DateTime.now(),
      rep: quantity,
      vidUrl: excerciseDBController.excercise[widget.index].vidUrl,
      imgUrl: excerciseDBController.excercise[widget.index].imgUrl,
    );
    final json = savedInput.toJson();
    await input.set(json);
  }


}

class saved {
  String id;
  final String uid;
  final String name;
  final String desc;
  DateTime date;
  int rep;
  String vidUrl;
  String imgUrl;

  saved({
    this.id = "",
    required this.name,
    required this.uid,
    required this.desc,
    required this.date,
    required this.rep,
    required this.vidUrl,
    required this.imgUrl,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'uid': uid,
    'name': name,
    'desc': desc,
    'date': date,
    'rep': rep,
    'vidUrl': vidUrl,
    'imgUrl': imgUrl,
  };
}
