import 'package:flutter/material.dart';

class TransactionDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Transaction Details'),
        ),
        body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Income',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '₹40,000', // Replace with your actual total income
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Category-wise Expenditure',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Food: ₹5,000\n' // Replace with your actual expenditure
                        'Social Life: ₹7,000\n'
                        'Pets: ₹2,000\n'
                        'Transport: ₹3,500\n'
                        'Apparels: ₹2,500\n'
                        'Utilities: ₹1,000\n'
                        'Education: ₹10,000\n'
                        'Health: ₹5,000\n'
                        'Culture: ₹500\n'
                        'Others: ₹3,500\n',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Total Expenditure',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '₹30,000', // Replace with your actual total savings
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Total Savings',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '₹10,000', // Replace with your actual total savings
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            ),
        );
    }
}