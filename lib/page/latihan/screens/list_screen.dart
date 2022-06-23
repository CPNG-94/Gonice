import 'package:flutter/material.dart';
import 'package:gonice/page/latihan/screens/excercise_screen.dart';
import 'package:gonice/page/latihan/widgets/excercise_added.dart';
import 'package:gonice/page/latihan/widgets/excercise_detail.dart';

class ListScreen extends StatelessWidget {
  int index = 0;
  ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
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
                  builder: (context) => const ExcerciseScreen()));
            },
            color: Colors.black,
          ),
        ],
        centerTitle: true,
        title: const Text(
          "CUSTOM",
          style: TextStyle(color: Colors.green),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          ExcerciseAdded(),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: FloatingActionButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ExcerciseDetail(index: index)));
                showAlertDialog(context);
                },
                backgroundColor: Colors.green,
                child: const Icon(Icons.play_arrow_rounded),
              ),
            ),
          ),
        ],
      ),
    );
  }
  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {Navigator.pop(context, true);},
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
