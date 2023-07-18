import 'package:flutter/material.dart';
import 'package:minorproject2/ui/piechart.dart';
import 'package:minorproject2/ui/trans_details.dart';
//import '../../controllers/default_controller.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'piechart.dart';
import 'calenderapp.dart';
import 'faqs.dart';
import 'feedback.dart';
import 'loginpage.dart';
import 'addAccount.dart';

class DefaultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Text(
          "Appbar",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text("My Account"),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text('FeedBack'),
                ),
                PopupMenuItem<int>(
                  value: 2,
                  child: Text("Add Account"),
                ),
                PopupMenuItem<int>(
                  value: 3,
                  child: Text("FAQS"),
                ),
              ];
            },
            onSelected: (value) {
              if (value == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AuthenticationApp()),
                );
              } else if (value == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeedbackPage()),
                );
              } else if (value == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountDetailsApp()),
                );
              } else if (value == 3) {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Faqs()));
              }
            },
          ),
        ],
      ),
      persistentFooterButtons: <Widget>[
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.calendar_month_rounded),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CalendarPage()),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.pie_chart),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PieChartStats()),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.text_snippet_outlined),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TransactionDetailsPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ],
      body: GestureDetector(
        onVerticalDragEnd: (DragEndDetails details) {
          if (details.primaryVelocity! < 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CalendarPage()),
            );
          }
        },
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black,
                    child: SfRadialGauge(
                      axes: <RadialAxis>[
                        RadialAxis(
                          minimum: 0,
                          maximum: 100,
                          axisLabelStyle: const GaugeTextStyle(color: Colors.white),
                          ranges: <GaugeRange>[
                            GaugeRange(
                              startValue: 0,
                              endValue: 100,
                              color: Colors.orange,
                            ),
                          ],
                          pointers: const <GaugePointer>[
                            NeedlePointer(
                              value: 30,
                              enableAnimation: true,
                              needleColor: Colors.blueAccent,
                              knobStyle: KnobStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.black,
                    child: SfRadialGauge(
                      axes: <RadialAxis>[
                        RadialAxis(
                          minimum: 0,
                          maximum: 100,
                          axisLabelStyle: const GaugeTextStyle(color: Colors.white),
                          ranges: <GaugeRange>[
                            GaugeRange(
                              startValue: 0,
                              endValue: 100,
                              color: Colors.green,
                            ),
                          ],
                          pointers: const <GaugePointer>[
                            NeedlePointer(
                              value: 40,
                              enableAnimation: true,
                              needleColor: Colors.blueAccent,
                              knobStyle: KnobStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.black,
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                series: <ChartSeries>[
                  ColumnSeries<ChartData, String>(
                    dataSource: <ChartData>[
                      ChartData('Category 1', 25, 50),
                      ChartData('Category 2', 50, 75),
                      ChartData('Category 3', 75, 100),
                    ],
                    xValueMapper: (ChartData data, _) => data.category,
                    yValueMapper: (ChartData data, _) => data.value1,
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                    color: Colors.grey,
                  ),
                  ColumnSeries<ChartData, String>(
                    dataSource: <ChartData>[
                      ChartData('Category 1', 35, 60),
                      ChartData('Category 2', 60, 85),
                      ChartData('Category 3', 85, 110),
                    ],
                    xValueMapper: (ChartData data, _) => data.category,
                    yValueMapper: (ChartData data, _) => data.value2,
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                    color: Colors.blueGrey,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  final String category;
  final double value1;
  final double value2;

  ChartData(this.category, this.value1,this.value2);
}