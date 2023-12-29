import 'package:flutter/material.dart';
import 'dart:math';

import 'truth_or_dare_data.dart';

class TruthOrDarePage extends StatefulWidget {
  @override
  _TruthOrDarePageState createState() => _TruthOrDarePageState();
}

class _TruthOrDarePageState extends State<TruthOrDarePage> {
  List<String> truths = truthsEng;

  List<String> dares = daresEng;

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
        backgroundColor: Colors.deepPurple[300],
      ),
      backgroundColor: Colors.deepPurple[300],
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
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.black)))),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Get Truth',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: () {
                    _getDare();
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.black)))),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Get Dare',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
