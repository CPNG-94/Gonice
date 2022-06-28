import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gonice/page/latihan/screens/excercise_detail_screen.dart';
import 'package:gonice/page/latihan/screens/excercise_screen.dart';
import 'package:gonice/page/latihan/widgets/excercise_added.dart';
import 'package:gonice/page/latihan/widgets/excercise_detail.dart';

class ListScreen extends StatelessWidget {
  int index = 0;
  ListScreen({Key? key}) : super(key: key);

  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference usersCollection =
  FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: usersCollection.doc(user?.uid).snapshots(),
      builder: (ctx, streamSnapshot) {
        if (streamSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        }
        return Scaffold(
          backgroundColor: const Color(0xFFF2F2F2),
          appBar: AppBar(
            leading: IconButton(
              color: const Color(0xFF00ADB5),
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ExcerciseScreen(username: streamSnapshot.data!['uid'])));
                },
                color: const Color(0xFF00ADB5),
              ),
            ],
            centerTitle: true,
            title: const Text(
              "Custom",
              style: TextStyle(color: Color(0xFF00ADB5)),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: Stack(
            children: [
              ExcerciseAdded(username: streamSnapshot.data!['uid']),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              ExcerciseDetailScreen(
                                  index: index, username: streamSnapshot.data!['uid'])));
                      showAlertDialog(context);
                    },
                    backgroundColor: const Color(0xFF00ADB5),
                    child: const Icon(Icons.play_arrow_rounded),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {Navigator.of(context, rootNavigator: true).pop();},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Info"),
      content: const Text("Usap layar ke atas untuk latihan selanjutnya."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
