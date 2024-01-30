
import 'package:flutter/material.dart';

class Loan {
  String borrowerName;
  double loanAmount;
  double interestRate;
  int loanTerm;

  Loan({
    required this.borrowerName,
    required this.loanAmount,
    required this.interestRate,
    required this.loanTerm,
  });
}

class LoanDetailsScreen extends StatefulWidget {
  @override
  _LoanDetailsScreenState createState() => _LoanDetailsScreenState();
}

class _LoanDetailsScreenState extends State<LoanDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();
  final TextEditingController _termController = TextEditingController();
  List<Loan> loans = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Loan management'),
          backgroundColor:Colors.orange,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }
          )
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Borrower Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter borrower name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Loan Amount'),
                validator: (value) {
                  if (value == null || double.tryParse(value) == null) {
                    return 'Please enter a valid loan amount';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _rateController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Interest Rate (%)'),
                validator: (value) {
                  if (value == null || double.tryParse(value) == null) {
                    return 'Please enter a valid interest rate';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _termController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Loan Term (months)'),
                validator: (value) {
                  if (value == null || int.tryParse(value) == null) {
                    return 'Please enter a valid loan term';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _submitForm();
                  }
                },
                child: Text('Submit'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _navigateToLoanList();
                },
                child: Text('View Loan List'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    final loan = Loan(
      borrowerName: _nameController.text,
      loanAmount: double.parse(_amountController.text),
      interestRate: double.parse(_rateController.text),
      loanTerm: int.parse(_termController.text),
    );

    setState(() {
      loans.add(loan);
    });

    // Navigate to the loan information screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoanInfoScreen(loan: loan),
      ),
    );
  }

  void _navigateToLoanList() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoanListScreen(loans: loans),
      ),
    );
  }
}

class LoanInfoScreen extends StatelessWidget {
  final Loan loan;

  const LoanInfoScreen({Key? key, required this.loan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loan Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Borrower: ${loan.borrowerName}'),
            Text('Loan Amount: \$${loan.loanAmount.toStringAsFixed(2)}'),
            Text('Interest Rate: ${loan.interestRate.toStringAsFixed(2)}%'),
            Text('Loan Term: ${loan.loanTerm} months'),
            // Add more information and calculations as needed
          ],
        ),
      ),
    );
  }
}

class LoanListScreen extends StatelessWidget {
  final List<Loan> loans;

  const LoanListScreen({Key? key, required this.loans}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loan List'),
      ),
      body: ListView.builder(
        itemCount: loans.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(loans[index].borrowerName),
            subtitle: Text('\$${loans[index].loanAmount.toStringAsFixed(2)}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoanInfoScreen(loan: loans[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loan Management App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoanDetailsScreen(),
    );
  }
}
