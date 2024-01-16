import 'package:flutter/material.dart';


class EducationalResourcesScreen extends StatelessWidget {
  final List<EducationalTip> tips = [
    EducationalTip(
      title: 'Create a Budget',
      description: 'Track your income and expenses to create a budget that helps you manage your money effectively.',
    ),
    EducationalTip(
      title: 'Emergency Fund',
      description: 'Build an emergency fund to cover unexpected expenses and avoid going into debt.',
    ),
    EducationalTip(
      title: 'Save Regularly',
      description: 'Start a savings habit by setting aside a portion of your income regularly.',
    ),
    // Add more tips as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Financial Tips'),
      ),
      body: ListView.builder(
        itemCount: tips.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tips[index].title),
            onTap: () {
              _navigateToTipDetails(context, tips[index]);
            },
          );
        },
      ),
    );
  }

  void _navigateToTipDetails(BuildContext context, EducationalTip tip) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TipDetailsScreen(tip: tip),
      ),
    );
  }
}

class EducationalTip {
  final String title;
  final String description;

  EducationalTip({required this.title, required this.description});
}

class TipDetailsScreen extends StatelessWidget {
  final EducationalTip tip;

  TipDetailsScreen({required this.tip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tip.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tip.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              tip.description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
