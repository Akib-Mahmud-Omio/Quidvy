import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class graph extends StatefulWidget {
  graph({Key? key}) : super(key: key);

  @override
  State<graph> createState() => _graphState();
}

class _graphState extends State<graph> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: 300,
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            series: <SplineSeries<SalesData, String>>[
              SplineSeries<SalesData, String>(
                dataSource: <SalesData>[
                  SalesData(100, 'mon'),
                  SalesData(20, 'tue'),
                  SalesData(40, 'wed'),
                  SalesData(15, 'sat'),
                  SalesData(5, 'sun'),
                ],
                xValueMapper: (SalesData sales, _) => sales.year,
                yValueMapper: (SalesData sales, _) => sales.sales,
              ),
            ],
          ),
        ),
      ),

    );
  }
}

class SalesData {
  SalesData(this.sales, this.year);
  final String year;
  final int sales;
}
