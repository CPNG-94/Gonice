import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gonice/models/excercise.dart';


class FirestoreDB {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<Excercise>> getAllProducts() {
    return _firebaseFirestore
        .collection('excercise')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Excercise.fromSnapshot(doc)).toList();
    });
  }
}