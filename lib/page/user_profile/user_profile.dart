import 'package:flutter/material.dart';
import 'package:gonice/widget/alarm.dart';
import 'package:gonice/ui/user_settings.dart';
import 'package:gonice/widget/bmi_user.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Profile', style: TextStyle(color: Colors.black),),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.green,
          ),
          onPressed: (){},
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery. of(context).size.height,
            padding: EdgeInsets.only(top: 25, left: 16, right: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0,11),
                          )],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage('https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80'),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                    SizedBox(width: 20,),
                    Column(
                      children: [
                        Text('Muhammad Hafid Nur Azis', style: TextStyle(fontWeight: FontWeight.bold),),
                        Text('zisnura20@gmail.com')
                      ],
                    ),
                    Expanded(child: Container()),
                    IconButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UserEditPage()),
                          );
                        },
                        icon: Icon(Icons.edit))
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 20, bottom: 10, left: 16),
                  child: Row(
                    children: [
                      Text('Your BMI', style: TextStyle(fontWeight: FontWeight.bold)),
                      Expanded(child: Container())
                    ],
                  ),
                ),
                bmiUser(),
                Container(
                  padding: EdgeInsets.only(top: 20, bottom: 10, left: 16),
                  child: Row(
                    children: [
                      Text('Work Out Alarm', style: TextStyle(fontWeight: FontWeight.bold)),
                      Expanded(child: Container())
                    ],
                  ),
                ),
                notification(),
                Expanded(child: Container()),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )
                      )
                  ),
                  onPressed: (){},
                  child: Text('Logout'),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
