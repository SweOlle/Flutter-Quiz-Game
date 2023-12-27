import 'package:flutter/material.dart';
import 'dart:math';

class TruthOrDarePage extends StatefulWidget {
  @override
  _TruthOrDarePageState createState() => _TruthOrDarePageState();
}

class _TruthOrDarePageState extends State<TruthOrDarePage> {
  List<String> truths = [
    'What is your biggest fear?',
    'What is your most embarrassing moment?',
    'Have you ever cheated on a test?',
    // Add more truths as needed
  ];

  List<String> dares = [
    'Sing a song in front of everyone.',
    'Do 10 jumping jacks.',
    'Tell a joke to make everyone laugh.',
    // Add more dares as needed
  ];

  String _currentTask = 'Tap to get Truth or Dare';

  void _getTruth() {
    setState(() {
      _currentTask = _getRandomTask(truths);
    });
  }

  void _getDare() {
    setState(() {
      _currentTask = _getRandomTask(dares);
    });
  }

  String _getRandomTask(List<String> tasks) {
    final random = Random();
    final index = random.nextInt(tasks.length);
    return tasks[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Truth or Dare'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_currentTask',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _getTruth();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Text('Get Truth'),
                ),
                SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: () {
                    _getDare();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Text('Get Dare'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
