import 'package:flutter/material.dart';
import 'package:gonice/page/latihan/screens/beginner_detail_screen.dart';
import 'package:gonice/page/latihan/widgets/beginner_detail.dart';
import 'package:gonice/page/latihan/widgets/beginner_list.dart';

class BeginnerScreen extends StatelessWidget {
  int index = 0;
  BeginnerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        centerTitle: true,
        title: const Text(
          "Beginner",
          style: TextStyle(color: Color(0xFF00ADB5)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          const BeginnerList(),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: FloatingActionButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BeginnerDetail(index: index)
                  ));
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
  }
  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
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
