import 'package:flutter/material.dart';
import 'package:test_custom/page/latihan/screens/excercise_screen.dart';
import 'package:test_custom/page/latihan/screens/latihan_screen.dart';
import 'package:test_custom/page/latihan/widgets/excercise_added.dart';
import 'package:test_custom/page/latihan/widgets/excercise_detail.dart';

class ListScreen extends StatelessWidget {
  int index = 0;
  ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  const LatihanScreen()));},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ExcerciseScreen()));},
            color: Colors.black,
          ),
          IconButton(
            onPressed: (){Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    ExcerciseDetail(index: index)));},
            icon: const Icon(Icons.play_arrow_rounded),
            color: Colors.black,
          ),
        ],
        centerTitle: true,
        title: const Text("CUSTOM", style: TextStyle(color: Colors.green),),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          ExcerciseAdded(),
        ],
      ),
    );
  }
}
