import 'package:flutter/material.dart';
import '../widgets/excercise_list.dart';

class ExcerciseScreen extends StatelessWidget {
  const ExcerciseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("TAMBAH", style: TextStyle(color: Colors.green),),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            ExcerciseList(),
          ],
        ),
      ),
    );
  }
}
