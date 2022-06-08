import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/excercise_list.dart';
import 'list_screen.dart';

class ExcerciseScreen extends StatelessWidget {
  const ExcerciseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah")),
      body: SafeArea(
        child: Column(
          children: [
            ExcerciseList(),
            ElevatedButton(
              onPressed: () => Get.to(() => const ListScreen()),
              child: const Text('Lihat Daftar'),
            ),
          ],
        ),
      ),
    );
  }
}
