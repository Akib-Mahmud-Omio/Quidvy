import 'package:flutter/material.dart';
import 'dart:math';
class CompoundInterestCalculator extends StatefulWidget {
  @override
  _CompoundInterestCalculatorState createState() =>
      _CompoundInterestCalculatorState();
}

class _CompoundInterestCalculatorState
    extends State<CompoundInterestCalculator> {
  TextEditingController principalController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController frequencyController = TextEditingController();

  double calculateCompoundInterest() {
    double principal = double.parse(principalController.text);
    double rate = double.parse(rateController.text) / 100;
    double time = double.parse(timeController.text);
    int frequency = int.parse(frequencyController.text);

    double compoundInterest =
        principal * pow((1 + rate / frequency), frequency * time) - principal;

    return compoundInterest;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: principalController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Principal Amount'),
          ),
          TextField(
            controller: rateController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Annual Interest Rate (%)'),
          ),
          TextField(
            controller: timeController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Time (years)'),
          ),
          TextField(
            controller: frequencyController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Compounding Frequency'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              double compoundInterest = calculateCompoundInterest();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Compound Interest: $compoundInterest'),
                ),
              );
            },
            child: Text('Calculate'),
          ),
        ],
      ),
    ),
    );
  }
}