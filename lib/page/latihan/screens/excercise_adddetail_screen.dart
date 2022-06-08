import 'package:flutter/material.dart';
import 'package:test_custom/widgets/add_detail.dart';

class ExcerciseAddDetailScreen extends StatelessWidget {
  const ExcerciseAddDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          AddDetail(excId: ''),
        ],
      ),
    );
  }
}
