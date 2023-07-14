import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  String feedback = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Please provide your feedback:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: TextField(
                maxLines: null,
                onChanged: (value) {
                  setState(() {
                    feedback = value;
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Type your feedback here...',
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Perform action with the feedback, such as sending it to a server
                print('Feedback: $feedback');

                // Show a dialog or navigate to a success page
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Thank You!'),
                    content: const Text('Your feedback has been submitted.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          // You can navigate to another page here if needed
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: FeedbackPage(),
  ));
}
