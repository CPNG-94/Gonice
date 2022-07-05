import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final List<String> _image = [
    'assets/userWeight/Vector.jpg',
    'assets/userWeight/Vector-1.jpg',
    'assets/userWeight/Vector-2.jpg',
    'assets/userWeight/Vector-3.jpg'
  ];
  double? _bmi;
  String _message = '-';
  String _body = 'assets/userWeight/Vector-1.jpg';

  void _calculate() {
    final double? height = double.tryParse(_heightController.value.text);
    final double? weight = double.tryParse(_weightController.value.text);

    // Check if the inputs are valid
    if (height == null || height <= 0 || weight == null || weight <= 0) {
      setState(() {
        _message = "Please input height in cm and weight in kg";
      });
      return;
    }

    setState(() {
      double cm = height/100;
      _bmi = weight / (cm * cm);
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
    return Card(
      color: Colors.white,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "BMI Calculator",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            TextField(
              keyboardType:
              const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Height (cm)'),
              controller: _heightController,
            ),
            TextField(
              keyboardType:
              const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Weight (kg)',
              ),
              controller: _weightController,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Image.asset(_body, width: 50  ,),
                Expanded(child: Container()),
                Column(
                  children: [
                    const Text('Condition', style: TextStyle(fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10,),
                    Text(
                      _message,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Expanded(child: Container()),
                Column(
                  children: [
                    const Text('BMI', style: TextStyle(fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10,),
                    Text(
                      _bmi == null ? '-' : _bmi!.toStringAsFixed(2),
                    )
                  ],
                ),
                Expanded(child: Container()),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                      )
                  )
              ),
              onPressed: _calculate,
              child: const Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }

  // _bmiUser(int height, int weight){
  //   return Card(
  //     color: Colors.white,
  //     elevation: 10,
  //     child: Padding(
  //       padding: const EdgeInsets.all(20),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Row(
  //             children: [
  //               Image.asset(_body, width: 50  ,),
  //               Expanded(child: Container()),
  //               Column(
  //                 children: [
  //                   Column(
  //                     children: [
  //                       const Text('Height', style: TextStyle(fontWeight: FontWeight.bold),),
  //                       const SizedBox(height: 10,),
  //                       Text(
  //                         height.toString(),
  //                         textAlign: TextAlign.center,
  //                       ),
  //                     ],
  //                   ),
  //                   Expanded(child: Container()),
  //                   Column(
  //                     children: [
  //                       const Text('Condition', style: TextStyle(fontWeight: FontWeight.bold),),
  //                       const SizedBox(height: 10,),
  //                       Text(
  //                         _message,
  //                         textAlign: TextAlign.center,
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //               Expanded(child: Container()),
  //               Column(
  //                 children: [
  //                   Column(
  //                     children: [
  //                       const Text('Height', style: TextStyle(fontWeight: FontWeight.bold),),
  //                       const SizedBox(height: 10,),
  //                       Text(
  //                         height.toString(),
  //                         textAlign: TextAlign.center,
  //                       ),
  //                     ],
  //                   ),
  //                   Expanded(child: Container()),
  //                   Column(
  //                     children: [
  //                       const Text('BMI', style: TextStyle(fontWeight: FontWeight.bold),),
  //                       const SizedBox(height: 10,),
  //                       Text(
  //                         _bmi == null ? '-' : _bmi!.toStringAsFixed(2),
  //                       )
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //               Expanded(child: Container()),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
