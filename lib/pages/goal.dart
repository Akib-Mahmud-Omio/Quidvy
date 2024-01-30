import 'package:flutter/material.dart';

class Goal {
  String title;
  double amount;
  double income;
  double expenses;

  Goal({
    required this.title,
    required this.amount,
    required this.income,
    required this.expenses,
  });
}

class Savings {
  double totalSavings = 0;
}

class GoalList {
  List<Goal> goals = [];
  Savings savings = Savings();

  void addGoal(Goal goal) {
    goals.add(goal);
    savings.totalSavings += goal.amount - goal.expenses + goal.income;
  }
}

class GoalScreen extends StatefulWidget {
  @override
  _GoalScreenState createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController incomeController = TextEditingController();
  TextEditingController expensesController = TextEditingController();

  static GoalList goalList = GoalList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Saving Goals'),
          backgroundColor: Colors.orange,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              })),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Goal Title'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Goal Amount'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: incomeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Income'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: expensesController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Expenses'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String title = titleController.text;
                double amount = double.parse(amountController.text);
                double income = double.parse(incomeController.text);
                double expenses = double.parse(expensesController.text);

                Goal newGoal = Goal(
                  title: title,
                  amount: amount,
                  income: income,
                  expenses: expenses,
                );
                goalList.addGoal(newGoal);

                // Clear the text fields after adding a goal
                titleController.clear();
                amountController.clear();
                incomeController.clear();
                expensesController.clear();

                // Force a re-render to update the goal list
                setState(() {});
              },
              child: Text('Save Goal'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Saved Goals:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: goalList.goals.length,
                itemBuilder: (context, index) {
                  Goal goal = goalList.goals[index];
                  return ListTile(
                    title: Text(
                        '${goal.title} - \$${(goal.amount - goal.expenses + goal.income).toStringAsFixed(2)}'),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Total Savings: \$${goalList.savings.totalSavings.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: GoalScreen()));
}

