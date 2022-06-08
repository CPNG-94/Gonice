import 'package:get/get.dart';
import 'package:gonice/services/firestore_db.dart';
import '../models/excercise.dart';
import '../models/excercise2.dart';

class ExcerciseDBController extends GetxController {
  final excercise = <Excercise>[].obs;

  @override
  void onInit() {
    excercise.bindStream(FirestoreDB().getAllProducts());
    super.onInit();
  }
}

class ExcerciseDBController2 extends GetxController {
  final excercise2 = <Excercise2>[].obs;

  @override
  void onInit() {
    excercise2.bindStream(FirestoreDBAdded().getAllProducts());
    super.onInit();
  }
}