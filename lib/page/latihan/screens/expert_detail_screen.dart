import 'package:flutter/material.dart';
import 'package:gonice/page/latihan/widgets/expert_detail.dart';

class ExpertDetailScreen extends StatelessWidget {
  final int index;
  const ExpertDetailScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Expert',
          style: TextStyle(
              color: Colors.black
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ExpertDetail(index: index),
    );
  }
}
