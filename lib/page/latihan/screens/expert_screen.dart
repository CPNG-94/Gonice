import 'package:flutter/material.dart';
import 'package:gonice/page/latihan/screens/latihan_screen.dart';
import 'package:gonice/page/latihan/widgets/expert_detail.dart';
import 'package:gonice/page/latihan/widgets/expert_list.dart';

class ExpertScreen extends StatelessWidget {
  int index = 0;
  ExpertScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ExpertDetail(index: index)));
            },
            icon: const Icon(Icons.play_arrow_rounded),
            color: Colors.black,
          ),
        ],
        centerTitle: true,
        title: const Text(
          "EXPERT",
          style: TextStyle(color: Colors.green),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: const [
            ExpertList(),
          ],
        ),
      ),
    );
  }
}
