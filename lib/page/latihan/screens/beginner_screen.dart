import 'package:flutter/material.dart';
import 'package:test_custom/widgets/beginner_list.dart';

class LatihanScreen extends StatelessWidget {
  const LatihanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BEGINNER", style: TextStyle(color: Colors.green),),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: const [
            BeginnerList(),
          ],
        ),
      ),
    );
  }
}
