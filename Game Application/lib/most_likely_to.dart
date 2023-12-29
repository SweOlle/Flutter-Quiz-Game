import 'package:flutter/material.dart';
import 'dart:math';
import 'most_likely_to_data.dart';

class MostLikelyToPage extends StatefulWidget {
  @override
  _MostLikelyToPageState createState() => _MostLikelyToPageState();
}

class _MostLikelyToPageState extends State<MostLikelyToPage> {
  String _currentSentence = 'Tap to start';
  bool _showGenerateButton = true;
  bool _showGameButtons = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _generateSentence() {
    setState(() {
      _currentSentence = _getRandomSentence();
      _showGenerateButton = false;
      _showGameButtons = true;
    });
  }

  void _nextSentence() {
    setState(() {
      _currentSentence = _getRandomSentence();
    });
  }

  String _getRandomSentence() {
    // Replace this with your logic to fetch a random word
    final randomIndex = Random().nextInt(mostLikelyToListEng.length);
    return mostLikelyToListEng[randomIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Most Likely To'),
        backgroundColor: Colors.deepPurple[300],
      ),
      backgroundColor: Colors.deepPurple[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Text(
                '$_currentSentence',
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
                      _generateSentence();
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
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _nextSentence();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'Next',
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
