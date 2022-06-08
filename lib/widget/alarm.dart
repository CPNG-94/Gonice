import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:timezone/data/latest.dart' as tz;

class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  _notificationState createState() => _notificationState();
}

class _notificationState extends State<notification> {
  TextEditingController Notification_title = TextEditingController();
  TextEditingController Notification_descrp = TextEditingController();
  bool isSwitched = false;

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 10,
        child: Row(
          children: [
            SizedBox(width: 15, height: 50,),
            Icon(
              Icons.alarm,
              color: Colors.lightGreen,
              size: 24.0,
            ),
            SizedBox(width: 15),
            Column(
              children: [
                Text("Alarm", style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text('11:00 WIB')
              ],
            ),
            Expanded(child: Container()),
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  print(isSwitched);
                });
              },
              activeTrackColor: Colors.lightGreenAccent,
              activeColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
