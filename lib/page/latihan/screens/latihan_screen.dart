import 'package:flutter/material.dart';
import 'package:gonice/page/latihan/widgets/latihan_list.dart';

class LatihanScreen extends StatelessWidget {
  const LatihanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Latihan",
          style: TextStyle(color: Color(0xFF00ADB5)),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          LatihanList(),
        ],
      ),
    );
  }
}
