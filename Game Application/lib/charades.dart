import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';
import 'charades_words.dart';

class CharadesPage extends StatefulWidget {
  @override
  _CharadesPageState createState() => _CharadesPageState();
}

class _CharadesPageState extends State<CharadesPage> {
  late Timer _timer;
  int _secondsRemaining = 0;
  String _currentWord = 'Tap to start';
  int _points = 0;
  bool _showGenerateButton = true;
  bool _showGameButtons = false;

  void _startTimer(int seconds) {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        _timer.cancel();
        _showResultDialog();
      } else {
        setState(() {
          _secondsRemaining--;
        });
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
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Charades'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_currentWord',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20.0),
            _showGenerateButton
                ? ElevatedButton(
                    onPressed: () {
                      _generateWord();
                    },
                    child: Text('Start'),
                  )
                : SizedBox(), // Only show the button if _showGenerateButton is true
            _showGameButtons
                ? Column(
                    children: [
                      SizedBox(height: 20.0),
                      Text(
                        'Time remaining: $_secondsRemaining seconds',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              _skipWord();
                            },
                            child: Text('Skip'),
                          ),
                          SizedBox(width: 20.0),
                          ElevatedButton(
                            onPressed: () {
                              _addPointAndSkipWord();
                            },
                            child: Text('Add Point & Skip'),
                          ),
                        ],
                      ),
                    ],
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
