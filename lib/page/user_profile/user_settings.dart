import 'package:flutter/material.dart';

class UserEditPage extends StatefulWidget {
  const UserEditPage({Key? key}) : super(key: key);

  @override
  State<UserEditPage> createState() => _UserEditPageState();
}

class _UserEditPageState extends State<UserEditPage> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Edit Profile', style: TextStyle(color: Colors.black),),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.green,
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        height: MediaQuery. of(context).size.height,
        padding: EdgeInsets.only(top: 25, left: 16, right: 16),
        child: Column(
          children: [
            Center(
              child: Stack(
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
                  Positioned(
                      bottom: 0,
                      right: 3,
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                            border: Border.all(width: 3,color: Theme.of(context).scaffoldBackgroundColor)
                        ),
                        child: Icon(Icons.add, color: Colors.white,),
                      )),
                ],
              ),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Birth Day'),
            ),
            TextField(
              keyboardType:
              TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Height (cm)'),
              controller: _heightController,
            ),
            TextField(
              keyboardType:
              TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Weight (kg)',
              ),
              controller: _weightController,
            ),
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
              child: Text('Simpan'),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}