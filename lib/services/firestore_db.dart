import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gonice/models/excercise.dart';
import 'package:gonice/models/excercise2.dart';

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

class FirestoreDBAdded {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<Excercise2>> getAllProducts() {
    return _firebaseFirestore
        .collection('saved')
        .orderBy('date', descending: false)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Excercise2.fromSnapshot(doc)).toList();
    });
  }
}
