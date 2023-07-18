import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PieChartStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Define the expenditure data
    final List<ExpenditureData> expenditureData = [
      ExpenditureData('Food', 5000, Colors.orange),
      ExpenditureData('Social Life', 7000, Colors.amber),
      ExpenditureData('Pets', 2000, Colors.amberAccent),
      ExpenditureData('Transport', 3500, Colors.blue),
      ExpenditureData('Apparels', 2500, Colors.cyan),
      ExpenditureData('Utilities', 1000, Colors.green),
      ExpenditureData('Education', 10000, Colors.lightGreen),
      ExpenditureData('Health', 5000, Colors.purple),
      ExpenditureData('Culture', 500, Colors.pink),
      ExpenditureData('Others', 3500, Colors.red),
    ];

    // Calculate the total income, expenditure, and savings
    final int totalIncome = 40000;
    final int totalExpenditure = expenditureData.map((data) => data.amount).reduce((a, b) => a + b);
    final int totalSavings = totalIncome - totalExpenditure;

    // Create the category-wise expenditure pie chart widget
    final categoryWisePieChart = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category-wise Expenditure',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Container(
          height: 300, // Adjust the height of the chart container
          child: PieChart(
            PieChartData(
              sections: List.generate(
                expenditureData.length,
                    (index) {
                  return PieChartSectionData(
                    value: expenditureData[index].amount.toDouble(),
                    color: expenditureData[index].color,
                    title: '',
                    radius: 120, // Adjust the radius to reduce the size
                  );
                },
              ),
              centerSpaceRadius: 0,
              startDegreeOffset: -90,
              borderData: FlBorderData(show: false),
              sectionsSpace: 2,
              centerSpaceColor: Colors.transparent,
            ),
          ),
        ),
      ],
    );

    // Create the expenditure details widget
    final expenditureDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Expenditure Details',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Column(
          children: expenditureData.map((data) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    color: data.color,
                  ),
                  SizedBox(width: 8.0),
                  Text('${data.category}: ₹${data.amount}'),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );

    // Create the overall financial summary pie chart widget
    final summaryPieChart = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Overall Financial Summary',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Container(
          height: 300, // Adjust the height of the chart container
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: totalIncome.toDouble(),
                  title: 'Income',
                  color: Colors.lightGreen,
                  radius: 120, // Adjust the radius to reduce the size
                ),
                PieChartSectionData(
                  value: totalExpenditure.toDouble(),
                  title: 'Expenditure',
                  color: Colors.red,
                  radius: 120, // Adjust the radius to reduce the size
                ),
                PieChartSectionData(
                  value: totalSavings.toDouble(),
                  title: 'Savings',
                  color: Colors.blue,
                  radius: 120, // Adjust the radius to reduce the size
                ),
              ],
              centerSpaceRadius: 0,
              startDegreeOffset: -90,
              borderData: FlBorderData(show: false),
              sectionsSpace: 2,
              centerSpaceColor: Colors.transparent,
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(child: categoryWisePieChart),
              SizedBox(width: 16.0),
              Expanded(child: expenditureDetails),
            ],
          ),
        ),
      ),
    );
  }
}

// ExpenditureData class to represent category, amount, and color
class ExpenditureData {
  final String category;
  final int amount;
  final Color color;

  ExpenditureData(this.category, this.amount,this.color);
}