import 'package:flutter/material.dart';
class InterestCalculator extends StatefulWidget {
  @override
  _InterestCalculatorState createState() => _InterestCalculatorState();
}

class _InterestCalculatorState extends State<InterestCalculator> {
  double principal = 0.0;
  double interestRate = 0.0;
  double interest = 0.0;
  double totalAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interest Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Principal Amount'),
              onChanged: (value) {
                setState(() {
                  principal = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 16.0),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Interest Rate'),
              onChanged: (value) {
                setState(() {
                  interestRate = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  interest = (principal * interestRate) / 100;
                  totalAmount = principal + interest;
                });
              },
              child: Text('Calculate'),
            ),
            SizedBox(height: 16.0),
            Text('Interest: $interest'),
            SizedBox(height: 8.0),
            Text('Total Amount: $totalAmount'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add navigation logic here
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}