import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gonice/page/login/login_page.dart';
import 'package:gonice/widget/alarm.dart';
import 'package:gonice/page/user_profile/user_settings.dart';
import 'package:gonice/widget/bmi_user.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Profile',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.green,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 25, left: 16, right: 16),
        child: StreamBuilder<DocumentSnapshot>(
          stream: usersCollection.doc(user?.uid).snapshots(),
          builder: (ctx, streamSnapshot) {
            if (streamSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            }
            return Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width / 4,
                      width: MediaQuery.of(context).size.width / 4,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(0, 11),
                            )
                          ],
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80'),
                            fit: BoxFit.cover,
                          )),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: Text(
                            streamSnapshot.data!['name'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: false,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(streamSnapshot.data!['email'])
                      ],
                    ),
                    Expanded(child: Container()),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UserEditPage()),
                          );
                        },
                        icon: const Icon(Icons.edit))
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 10, left: 16),
                  child: Row(
                    children: [
                      const Text('Your BMI',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Expanded(child: Container())
                    ],
                  ),
                ),
                bmiUser(
                  height: int.parse(streamSnapshot.data!['height']),
                  weight: int.parse(streamSnapshot.data!['weight']),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 10, left: 16),
                  child: Row(
                    children: [
                      const Text('Work Out Alarm',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Expanded(child: Container())
                    ],
                  ),
                ),
                const notification(),
                Expanded(child: Container()),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.teal),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();

                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => LoginPage()),
                        (Route<dynamic> route) => false);
                  },
                  child: const Text('Logout'),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
