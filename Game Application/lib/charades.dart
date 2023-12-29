import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';
import 'charades_data.dart';

class CharadesPage extends StatefulWidget {
  @override
  _CharadesPageState createState() => _CharadesPageState();
}

class _CharadesPageState extends State<CharadesPage> {
  Timer? _timer;
  int _secondsRemaining = 0;
  String _currentWord = 'Tap to start';
  int _points = 0;
  bool _showGenerateButton = true;
  bool _showGameButtons = false;
  bool _mounted = false;

  @override
  void initState() {
    super.initState();
    _mounted = true;
  }

  @override
  void dispose() {
    _timer?.cancel();
    _mounted = false;
    super.dispose();
  }

  void _startTimer(int seconds) {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
        if (_mounted) {
          _showResultDialog();
        }
      } else {
        if (_mounted) {
          setState(() {
            _secondsRemaining--;
          });
        }
      }
    });
  }

  void _generateWord() {
    setState(() {
      _currentWord = _getRandomWord();
      _secondsRemaining = 60; // Make user input?
      _showGenerateButton = false;
      _showGameButtons = true;
      _startTimer(_secondsRemaining);
    });
  }

  String _getRandomWord() {
    // Replace this with your logic to fetch a random word
    final randomIndex = Random().nextInt(charadesWordsEng.length);
    return charadesWordsEng[randomIndex];
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Game Over'),
          content: Text('Points: $_points'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _restartGame();
              },
              child: Text('Restart'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context); // Go back to the home page
              },
              child: Text('Quit'),
            ),
          ],
        );
      },
    );
  }

  void _skipWord() {
    setState(() {
      _currentWord = _getRandomWord();
    });
  }

  void _addPointAndSkipWord() {
    setState(() {
      _points++;
      _currentWord = _getRandomWord();
    });
  }

  void _restartGame() {
    setState(() {
      _points = 0;
      _showGenerateButton = true;
      _showGameButtons = false;
      _currentWord = 'Tap to start';
      _timer?.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Charades'),
        backgroundColor: Colors.deepPurple[300],
      ),
      backgroundColor: Colors.deepPurple[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Text(
                '$_currentWord',
                style: TextStyle(fontSize: 46.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          _showGenerateButton
              ? Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _generateWord();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Start',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                )
              : SizedBox(), // Only show the button if _showGenerateButton is true
          _showGameButtons
              ? Column(
                  children: [
                    Text(
                      'Time remaining: $_secondsRemaining seconds',
                      style: TextStyle(fontSize: 28.0),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _skipWord();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'Skip',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _addPointAndSkipWord();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'Correct',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : SizedBox(),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
