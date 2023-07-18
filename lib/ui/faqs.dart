import 'package:flutter/material.dart';

class Faqs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
      ),
      body: ListView(
        children: <Widget>[
          FaqItem(
            question: 'What is an expense tracker?',
            answer:
            'An expense tracker is a tool or application that helps you monitor and manage your personal or business expenses. It allows you to track and categorize your spending, set budgets, and gain insights into your financial habits.',
          ),
          FaqItem(
            question: 'Why should I use an expense tracker?',
            answer:
            'Using an expense tracker can provide numerous benefits. It helps you understand your spending patterns, identify areas where you can save money, stick to a budget, and achieve your financial goals. It also allows you to easily track and analyze your expenses, providing you with valuable insights into your financial health.',
          ),
          FaqItem(
            question: 'How do I manually add an expense in the app?',
            answer:
            'To add an expense manually, simply open the app, click on the calendar button and select the date of the transaction. Tap on the "+" button and enter the details such as the amount, category, and any additional information you want to include. Save the transaction, and it will be recorded in your tracker.',
          ),
          FaqItem(
            question: 'Can I categorize my expenses in the app?',
            answer:
            'Yes, categorizing expenses is an essential feature of our app. You can create custom categories or use predefined ones to organize your expenses. This allows you to analyze your spending patterns and track where your money is going.',
          ),
          FaqItem(
            question: 'Is it possible to set a budget in the app?',
            answer:
            'Absolutely! Our app allows you to set budgets for different categories or overall spending. You can define the budget amount and time period, and the app will help you stay within your desired limits by providing notifications or visual indicators.',
          ),
          FaqItem(
            question: 'How can I view my spending history?',
            answer:
            'You can easily view your spending history within the app. Look for the "Reports" or "Analytics" section, where you\'ll find various options to visualize your expenses over different time periods, view spending by category, and generate detailed reports.',
          ),
          FaqItem(
            question: 'Is my data synced across multiple devices?',
            answer:
            'Yes, if you\'re using our app on multiple devices, you can usually sync your data seamlessly. Simply sign in with the same account on each device, and your expense data will be synchronized, ensuring you have access to it wherever you go.',
          ),
          FaqItem(
            question: 'What should I do if I encounter a technical issue or have a question?',
            answer:
            'If you experience any technical issues or have questions about using our app, please contact our customer support team. We are here to assist you and ensure a smooth experience with our expense tracker app.',
          ),
        ],
      ),
    );
  }
}

class FaqItem extends StatefulWidget {
  final String question;
  final String answer;

  const FaqItem({
    required this.question,
    required this.answer,
  });

  @override
  _FaqItemState createState() => _FaqItemState();
}

class _FaqItemState extends State<FaqItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ExpansionTile(
            title: Text(widget.question),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(widget.answer),
              ),
            ],
            ),
        );
    }
}