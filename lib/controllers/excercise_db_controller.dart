import 'package:get/get.dart';
import 'package:gonice/models/excercise.dart';
import 'package:gonice/services/firestore_db.dart';

class ExcerciseDBController extends GetxController {
  final excercise = <Excercise>[].obs;

  @override
  void onInit() {
    excercise.bindStream(FirestoreDB().getAllProducts());
    super.onInit();
  }
}

