import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserEditPage extends StatefulWidget {
  const UserEditPage({Key? key}) : super(key: key);

  @override
  State<UserEditPage> createState() => _UserEditPageState();
}

class _UserEditPageState extends State<UserEditPage> {
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference usersCollection =
  FirebaseFirestore.instance.collection('users');
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> updateUser() {
    return users
        .doc(user?.uid)
        .update({
      'name': _nameController.text,
      'height' : _heightController.text,
      'weight' : _weightController.text})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
  
  @override
  void initState() {
    super.initState();
  }
  
  final _nameController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: const [
            Center(
              child: Text(
                'Edit Profile',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(top: 25, left: 16, right: 16, bottom: 25),
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
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
                    Positioned(
                        bottom: 0,
                        right: 3,
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                              border: Border.all(
                                  width: 3,
                                  color:
                                  Theme.of(context).scaffoldBackgroundColor)),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
                controller: _nameController,
              ),
              TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(labelText: 'Height (cm)'),
                controller: _heightController,
              ),
              TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Weight (kg)',
                ),
                controller: _weightController,
              ),
              Container(
                height: MediaQuery.of(context).size.height/5,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.teal),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                onPressed: () {
                  if (_nameController.text.isNotEmpty && _heightController.text.isNotEmpty && _weightController.text.isNotEmpty) {
                    updateUser();
                    Get.snackbar(
                      "Data Tersimpan",
                      "Data kamu berhasil diperbarui",
                      icon: Icon(Icons.announcement_outlined, color: Colors.white),
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.green,
                      borderRadius: 20,
                      margin: EdgeInsets.all(15),
                      colorText: Colors.white,
                      duration: Duration(seconds: 2),
                      isDismissible: true,
                      dismissDirection: DismissDirection.horizontal,
                      forwardAnimationCurve: Curves.easeOutBack,
                    );
                    Navigator.pop(context);
                  } else {
                    Get.snackbar(
                      "Hai",
                      "Pastikan seluruh data sudah terisi ya!",
                      icon: Icon(Icons.announcement_outlined, color: Colors.white),
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.redAccent,
                      borderRadius: 20,
                      margin: EdgeInsets.all(15),
                      colorText: Colors.white,
                      duration: Duration(seconds: 2),
                      isDismissible: true,
                      dismissDirection: DismissDirection.horizontal,
                      forwardAnimationCurve: Curves.easeOutBack,
                    );
                  }
                },
                child: const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
