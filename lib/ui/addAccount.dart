import 'package:flutter/material.dart';

void main() {
  runApp(AccountDetailsApp());
}

class AccountDetailsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AccountDetailsPage(),
    );
  }
}

class AccountDetailsPage extends StatefulWidget {
  @override
  _AccountDetailsPageState createState() => _AccountDetailsPageState();
}

class _AccountDetailsPageState extends State<AccountDetailsPage> {
  String? accountNumber;
  String? bankName;
  String? branchName;
  String? accountType;
  bool isSavingAccount = false;

  void _saveAccountDetails() {
    // Perform saving of account details logic here
    // You can access the entered details using the variables above
    print('Account Details Saved!');
    print('Account Number: $accountNumber');
    print('Bank Name: $bankName');
    print('Branch Name: $branchName');
    print('Account Type: $accountType');
    print('Is Saving Account: $isSavingAccount');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Account Number'),
              onChanged: (value) {
                setState(() {
                  accountNumber = value;
                });
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(labelText: 'Bank Name'),
              onChanged: (value) {
                setState(() {
                  bankName = value;
                });
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(labelText: 'Branch Name'),
              onChanged: (value) {
                setState(() {
                  branchName = value;
                });
              },
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: accountType,
              decoration: InputDecoration(labelText: 'Account Type'),
              items: ['Savings', 'Current']
                  .map((type) => DropdownMenuItem(
                value: type,
                child: Text(type),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  accountType = value;
                });
              },
            ),
            SizedBox(height: 20),
            CheckboxListTile(
              title: Text('Is Saving Account?'),
              value: isSavingAccount,
              onChanged: (value) {
                setState(() {
                  isSavingAccount = value ?? false;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveAccountDetails,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
