import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gonice/page/login/login_page.dart';

class Authentication {
  static signInHandler(String email, String password) async {
    try {
      (await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password))
          .user;

      return true;
    } catch (error) {
      toast(
          'Terdapat Kendala Ketika Ingin Login . Silahkan Perikas Email & Password');
      return false;
    }
  }

  static registerHandler(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (error) {
      toast(
          'Gagal melakukan pendaftaran, silahkan periksa kembali data diri anda dan koneksi internet anda');
      return false;
    }
  }

  static registeringUserToDatabase(String name, String email, String password,
      String height, String weight) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      // ignore: avoid_print
      print(uid);
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        "uid": uid,
        "name": name,
        "email": email,
        "password": password,
        "height": height,
        "weight": weight,
      });
    } catch (error) {
      toast("Gagal Melakukan Pendaftaran");
    }
  }
}

getUserProfile(String email) async {
  return FirebaseFirestore.instance
      .collection("users")
      .where("email", isEqualTo: email)
      .get()
      .catchError((e) {
    print(e.toString());
  });
}
