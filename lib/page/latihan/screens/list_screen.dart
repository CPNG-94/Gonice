import 'package:flutter/material.dart';
import 'package:test_custom/screens/excercise_screen.dart';
import 'package:test_custom/widgets/excercise_added.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Custom", style: TextStyle(color: Colors.green),),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          ExcerciseAdded(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ExcerciseScreen()));},
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
