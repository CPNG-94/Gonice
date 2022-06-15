import 'package:get/get.dart';
import 'package:Gonice/models/excercise.dart';

class ExcerciseController extends GetxController {

  var _excercise = {}.obs;

  void addExcercise(Excercise excercise) {
    if (_excercise.containsKey(excercise)){
      _excercise[excercise] += 1;
    } else {
      _excercise[excercise] = 1;
    }
    
    Get.snackbar("Excercise Ditambahkan", "Anda telah menambahkan ${excercise.name} ke daftar",
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

  void removeExcercise(Excercise excercise){
    if(_excercise.containsKey(excercise) && _excercise[excercise] == 1) {
      _excercise.removeWhere((key, value) => key == excercise);
    } else {
      _excercise[excercise] -= 1;
    }
  }

  get excercises => _excercise;

}
