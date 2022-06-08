import 'package:flutter/material.dart';

class bmiUser extends StatefulWidget {
  const bmiUser({Key? key}) : super(key: key);

  @override
  State<bmiUser> createState() => _bmiUser();
}

class _bmiUser extends State<bmiUser> {
  int height = 175;
  int weight = 90;
  double _bmi = 31.14;
  String _message = 'Obese';
  String _body = 'assets/userWeight/Vector-3.jpg';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.white,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Image.asset(_body, width: 50  ,),
              Expanded(child: Container()),
              Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Text('Height', style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Text(
                          height.toString(),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: Column(
                      children: [
                        Text('Condition', style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Text(
                          _message,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(child: Container()),
              Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Text('Weight', style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Text(
                          weight.toString(),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: Column(
                      children: [
                        Text('BMI', style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Text(
                          _bmi.toStringAsFixed(2),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
