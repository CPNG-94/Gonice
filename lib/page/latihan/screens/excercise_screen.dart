import 'package:flutter/material.dart';
import '../widgets/excercise_list.dart';

class ExcerciseScreen extends StatelessWidget {
  final String username;
  const ExcerciseScreen({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        leading: IconButton(
          color: const Color(0xFF00ADB5),
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: const Text("Tambah", style: TextStyle(color: Color(0xFF00ADB5)),),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            ExcerciseList(username: username),
          ],
        ),
      ),
    );
  }
}
