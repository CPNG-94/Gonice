import 'package:flutter/material.dart';
import 'package:gonice/services/alarm_scheduler.dart';
import 'package:provider/provider.dart';

class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  _notificationState createState() => _notificationState();
}

class _notificationState extends State<notification> {
  bool isSwitched = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SchedulingProvider>(
      builder: (context, provider, child) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 10,
          child: Row(
            children: [
              const SizedBox(width: 15, height: 50,),
              const Icon(
                Icons.alarm,
                color: Colors.lightGreen,
                size: 24.0,
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  const Text("Alarm", style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5,),
                  const Text('11:00 WIB')
                ],
              ),
              Expanded(child: Container()),
              Consumer<SchedulingProvider>(
                builder: (context, scheduled, _) {
                  return Switch.adaptive(
                    value: provider.isScheduled,
                    onChanged: (value) async {
                      scheduled.scheduledNotification(value);
                      provider.enableDailyNotification(value);
                    },
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}

