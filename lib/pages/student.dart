import 'package:flutter/material.dart';

class Transaction {
  String title;
  double amount;
  bool isIncome;

  Transaction({required this.title, required this.amount, required this.isIncome});
}


class student extends StatefulWidget {
  @override
  _studentState createState() => _studentState();
}

class _studentState extends State<student> {
  List<Transaction> transactions = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  bool isIncome = true;

  void addTransaction() {
    String title = titleController.text;
    double amount = double.parse(amountController.text);

    if (title.isNotEmpty && amount > 0) {
      setState(() {
        transactions.add(Transaction(title: title, amount: isIncome ? amount : -amount, isIncome: isIncome));
        titleController.clear();
        amountController.clear();
      });
    }
  }

  double calculateBalance() {
    double balance = 0;
    transactions.forEach((transaction) {
      balance += transaction.amount;
    });
    return balance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Money Management'),
          backgroundColor:Colors.orange,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }
          )
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(labelText: 'Title'),
                  ),
                  TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Amount'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isIncome = true;
                          });
                        },
                        child: Text('+'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isIncome = false;
                          });
                        },
                        child: Text('-'),
                      ),
                      ElevatedButton(
                        onPressed: addTransaction,
                        child: Text('Add Transaction'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Balance: \$${calculateBalance().toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(transactions[index].title),
                    subtitle: Text('\$${transactions[index].amount.toStringAsFixed(2)}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

