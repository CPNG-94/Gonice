import 'package:flutter/material.dart';
import 'package:gonice/page/latihan/widgets/excercise_detail.dart';

class ExcerciseDetailScreen extends StatelessWidget {
  final int index;
  final String username;
  const ExcerciseDetailScreen({Key? key, required this.index, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom',
          style: TextStyle(
              color: Colors.black
          ),
        ),
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
      body: ExcerciseDetail(index: index, username: username),
    );
  }
}
