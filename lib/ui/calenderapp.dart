// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
//
// void main() {
//   runApp(CalendarApp());
// }
//
// class CalendarApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Calendar App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: CalendarPage(),
//     );
//   }
// }
//
// class CalendarPage extends StatefulWidget {
//   @override
//   _CalendarPageState createState() => _CalendarPageState();
// }
//
// class _CalendarPageState extends State<CalendarPage> {
//   final ValueNotifier<DateTime> _selectedDate = ValueNotifier(DateTime.now());
//   DateTime _focusedDay = DateTime.now();
//
//   void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
//     setState(() {
//       _selectedDate.value = selectedDay;
//       _focusedDay = focusedDay;
//     });
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => AddTransactionPage(selectedDay)),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Calendar'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             TableCalendar(
//               focusedDay: _focusedDay,
//               firstDay: DateTime(2010),
//               lastDay: DateTime(2030),
//               selectedDayPredicate: (day) => isSameDay(_selectedDate.value, day),
//               onDaySelected: _onDaySelected,
//               onPageChanged: (focusedDay) {
//                 setState(() {
//                   _focusedDay = focusedDay;
//                 });
//               },
//             ),
//             GestureDetector(
//               onVerticalDragEnd: (details) {
//                 if (details.primaryVelocity! > 0) {
//                   Navigator.pop(context);
//                 }
//               },
//               child: Container(
//                 height: 200, // Adjust the height as needed
//                 color: Colors.grey, // Add your desired background color
//                 child: const Center(
//                   child: Text(
//                     'Scroll Up to Go Back',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white, // Add your desired text color
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class AddTransactionPage extends StatelessWidget {
//   final DateTime selectedDay;
//
//   AddTransactionPage(this.selectedDay);
//
//   bool _isExpense = false;
//   DateTime _selectedTime = DateTime.now();
//   double _amount = 0.0;
//   String _notes = '';
//   String? _selectedAccount;
//   String? _selectedCategory;
//
//   final List<String> _accounts = ['Account 1', 'Account 2', 'Account 3', 'Cash', 'Card'];
//   final List<String> _categories = [
//     'Food',
//     'Social Life',
//     'Pets',
//     'Transport',
//     'Apparels',
//     'Utilities',
//     'Education',
//     'Health',
//     'Culture',
//     'Others',
//   ];
//   final List<IconData> _categoryIcons = [
//     Icons.fastfood,
//     Icons.group,
//     Icons.pets,
//     Icons.directions_car,
//     Icons.style,
//     Icons.lightbulb,
//     Icons.school,
//     Icons.favorite,
//     Icons.theater_comedy,
//     Icons.more_horiz,
//   ];
//
//   late List<DropdownMenuItem<String>> _categoryItems;
//
//   void _toggleExpense(bool? value) {
//     if (value != null) {
//       _isExpense = value;
//     }
//   }
//
//   Future<void> _selectTime(BuildContext context) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.fromDateTime(_selectedTime),
//     );
//     if (picked != null) {
//       _selectedTime = DateTime(
//         selectedDay.year,
//         selectedDay.month,
//         selectedDay.day,
//         picked.hour,
//         picked.minute,
//       );
//     }
//   }
//
//   void _selectAccount(String? account) {
//     _selectedAccount = account;
//   }
//
//   void _selectCategory(String? category) {
//     _selectedCategory = category;
//   }
//
//   void _saveTransaction(BuildContext context) {
//     if (_selectedAccount != null && _selectedCategory != null) {
//       // Perform transaction save logic here
//       Navigator.pop(context);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please select an account and category.'),
//           behavior: SnackBarBehavior.floating,
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     _categoryItems = List.generate(_categories.length, (index) {
//       return DropdownMenuItem<String>(
//         value: _categories[index],
//         child: Row(
//           children: [
//             Icon(_categoryIcons[index]),
//             const SizedBox(width: 8.0),
//             Text(_categories[index]),
//           ],
//         ),
//       );
//     });
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Transaction'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Date: ${selectedDay.day}/${selectedDay.month}/${selectedDay.year}',
//                 style: const TextStyle(fontSize: 18),
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 'Account:',
//                 style: TextStyle(fontSize: 18),
//               ),
//               DropdownButtonFormField<String>(
//                 value: _selectedAccount,
//                 items: _accounts.map((account) {
//                   return DropdownMenuItem<String>(
//                     value: account,
//                     child: Text(account),
//                   );
//                 }).toList(),
//                 onChanged: _selectAccount,
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 'Category:',
//                 style: TextStyle(fontSize: 18),
//               ),
//               DropdownButtonFormField<String>(
//                 value: _selectedCategory,
//                 items: _categoryItems,
//                 onChanged: _selectCategory,
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 children: [
//                   const Text(
//                     'Type:',
//                     style: TextStyle(fontSize: 18),
//                   ),
//                   const SizedBox(width: 10),
//                   const Text('Income'),
//                   Radio(
//                     value: false,
//                     groupValue: _isExpense,
//                     onChanged: _toggleExpense,
//                   ),
//                   const SizedBox(width: 10),
//                   const Text('Expense'),
//                   Radio(
//                     value: true,
//                     groupValue: _isExpense,
//                     onChanged: _toggleExpense,
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 children: [
//                   const Text(
//                     'Time:',
//                     style: TextStyle(fontSize: 18),
//                   ),
//                   const SizedBox(width: 10),
//                   TextButton(
//                     onPressed: () => _selectTime(context),
//                     child: Text(
//                       '${_selectedTime.hour}:${_selectedTime.minute.toString().padLeft(2, '0')}',
//                       style: const TextStyle(fontSize: 18),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 'Amount:',
//                 style: TextStyle(fontSize: 18),
//               ),
//               TextFormField(
//                 keyboardType: TextInputType.number,
//                 onChanged: (value) {
//                   _amount = double.tryParse(value) ?? 0.0;
//                 },
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 'Notes:',
//                 style: TextStyle(fontSize: 18),
//               ),
//               TextFormField(
//                 onChanged: (value) {
//                   _notes = value;
//                 },
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () => _saveTransaction(context),
//                 child: const Text('Save'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(CalendarApp());
}

class CalendarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CalendarPage(),
    );
  }
}

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final ValueNotifier<DateTime> _selectedDate = ValueNotifier(DateTime.now());
  DateTime _focusedDay = DateTime.now();

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDate.value = selectedDay;
      _focusedDay = focusedDay;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TransactionPage(selectedDay)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
              focusedDay: _focusedDay,
              firstDay: DateTime(2010),
              lastDay: DateTime(2030),
              selectedDayPredicate: (day) => isSameDay(_selectedDate.value, day),
              onDaySelected: _onDaySelected,
              onPageChanged: (focusedDay) {
                setState(() {
                  _focusedDay = focusedDay;
                });
              },
            ),
            GestureDetector(
              onVerticalDragEnd: (details) {
                if (details.primaryVelocity! > 0) {
                  Navigator.pop(context);
                }
              },
              child: Container(
                height: 200, // Adjust the height as needed
                color: Colors.grey, // Add your desired background color
                child: const Center(
                  child: Text(
                    'Scroll Up to Go Back',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Add your desired text color
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionPage extends StatelessWidget {
  final DateTime selectedDay;

  TransactionPage(this.selectedDay);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Date: ${selectedDay.day}/${selectedDay.month}/${selectedDay.year}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddTransactionPage(selectedDay)),
                );
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'No transaction data available for this date.',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddTransactionPage extends StatelessWidget {
  final DateTime selectedDay;

  AddTransactionPage(this.selectedDay);

  bool _isExpense = false;
  DateTime _selectedTime = DateTime.now();
  double _amount = 0.0;
  String _notes = '';
  String? _selectedAccount;
  String? _selectedCategory;

  final List<String> _accounts = ['Account 1', 'Account 2', 'Account 3', 'Cash', 'Card'];
  final List<String> _categories = [
    'Food',
    'Social Life',
    'Pets',
    'Transport',
    'Apparels',
    'Utilities',
    'Education',
    'Health',
    'Culture',
    'Others',
  ];
  final List<IconData> _categoryIcons = [
    Icons.fastfood,
    Icons.group,
    Icons.pets,
    Icons.directions_car,
    Icons.style,
    Icons.lightbulb,
    Icons.school,
    Icons.favorite,
    Icons.theater_comedy,
    Icons.more_horiz,
  ];

  late List<DropdownMenuItem<String>> _categoryItems;

  void _toggleExpense(bool? value) {
    if (value != null) {
      _isExpense = value;
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedTime),
    );
    if (picked != null) {
      _selectedTime = DateTime(
        selectedDay.year,
        selectedDay.month,
        selectedDay.day,
        picked.hour,
        picked.minute,
      );
    }
  }

  void _selectAccount(String? account) {
    _selectedAccount = account;
  }

  void _selectCategory(String? category) {
    _selectedCategory = category;
  }

  void _saveTransaction(BuildContext context) {
    if (_selectedAccount != null && _selectedCategory != null) {
      // Perform transaction save logic here
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select an account and category.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _categoryItems = List.generate(_categories.length, (index) {
      return DropdownMenuItem<String>(
        value: _categories[index],
        child: Row(
          children: [
            Icon(_categoryIcons[index]),
            const SizedBox(width: 8.0),
            Text(_categories[index]),
          ],
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Transaction'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date: ${selectedDay.day}/${selectedDay.month}/${selectedDay.year}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              const Text(
                'Account:',
                style: TextStyle(fontSize: 18),
              ),
              DropdownButtonFormField<String>(
                value: _selectedAccount,
                items: _accounts.map((account) {
                  return DropdownMenuItem<String>(
                    value: account,
                    child: Text(account),
                  );
                }).toList(),
                onChanged: _selectAccount,
              ),
              const SizedBox(height: 20),
              const Text(
                'Category:',
                style: TextStyle(fontSize: 18),
              ),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                items: _categoryItems,
                onChanged: _selectCategory,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    'Type:',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(width: 10),
                  const Text('Income'),
                  Radio(
                    value: false,
                    groupValue: _isExpense,
                    onChanged: _toggleExpense,
                  ),
                  const SizedBox(width: 10),
                  const Text('Expense'),
                  Radio(
                    value: true,
                    groupValue: _isExpense,
                    onChanged: _toggleExpense,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    'Time:',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () => _selectTime(context),
                    child: Text(
                      '${_selectedTime.hour}:${_selectedTime.minute.toString().padLeft(2, '0')}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Amount:',
                style: TextStyle(fontSize: 18),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _amount = double.tryParse(value) ?? 0.0;
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Notes:',
                style: TextStyle(fontSize: 18),
              ),
              TextFormField(
                onChanged: (value) {
                  _notes = value;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _saveTransaction(context),
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
