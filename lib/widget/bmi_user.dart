import 'package:flutter/material.dart';

class bmiUser extends StatefulWidget {
  bmiUser({Key? key, required this.height, required this.weight}) : super(key: key);
  int height;
  int weight;

  @override
  State<bmiUser> createState() => _bmiUser();
}

class _bmiUser extends State<bmiUser> {
  List<String> _image = [
    'assets/userWeight/Vector.jpg',
    'assets/userWeight/Vector-1.jpg',
    'assets/userWeight/Vector-2.jpg',
    'assets/userWeight/Vector-3.jpg'
  ];
  double? _bmi;
  String _message = '-';
  String _body = 'assets/userWeight/Vector-1.jpg';

  @override
  void initState(){
    if (widget.height == null || widget.height <= 0 || widget.weight == null || widget.weight <= 0) {
      setState(() {
        _message = "Please input height in cm and weight in kg";
      });
      return;
    }

    setState(() {
      double cm = widget.height/100;
      _bmi = widget.weight / (cm * cm);
      if (_bmi! < 18.5) {
        _message = "Underweight";
        _body = _image[0];
      } else if (_bmi! < 25) {
        _message = 'Ideal';
        _body = _image[1];
      } else if (_bmi! < 30) {
        _message = 'Overweight';
        _body = _image[2];
      } else {
        _message = 'Obese';
        _body = _image[3];
      }
    });
  }

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
                          widget.height.toString(),
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
                          widget.weight.toString(),
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
                          _bmi!.toStringAsFixed(2),
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
