import 'package:flutter/material.dart';
class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  double takaAmount = 0;
  double dollarAmount = 0;
  double rupeeAmount = 0;

  void convertCurrency() {
    setState(() {
      dollarAmount = takaAmount * 0.011; // Conversion rate: 1 Taka = 0.011 Dollar
      rupeeAmount = takaAmount * 0.84;  // Conversion rate: 1 Taka = 0.84 Rupee
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
        backgroundColor:Colors.orangeAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                takaAmount = double.tryParse(value) ?? 0;
              },
              decoration: InputDecoration(labelText: 'Enter Taka'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                convertCurrency();
              },
              child: Text('Convert'),

            ),
            SizedBox(height: 20),
            Text('Converted Amounts:'),
            Text('Dollars: \$${dollarAmount.toStringAsFixed(2)}'),
            Text('Rupees: ₹${rupeeAmount.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}