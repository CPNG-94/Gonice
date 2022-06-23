import 'package:flutter/material.dart';
import 'package:gonice/page/latihan/widgets/expert_detail.dart';
import 'package:gonice/page/latihan/widgets/expert_list.dart';

class ExpertScreen extends StatelessWidget {
  int index = 0;
  ExpertScreen({Key? key}) : super(key: key);

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
        centerTitle: true,
        title: const Text(
          "Expert",
          style: TextStyle(color: Colors.green),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          const ExpertList(),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: FloatingActionButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ExpertDetail(index: index)
                  ));
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
      child: Text("OK"),
      onPressed: () {Navigator.pop(context, true);},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Info"),
      content: Text("Usap layar ke atas untuk latihan selanjutnya."),
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
