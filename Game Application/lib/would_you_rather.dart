import 'package:flutter/material.dart';
import 'dart:math';
import 'would_you_rather_data.dart';

class WouldYouRatherPage extends StatefulWidget {
  @override
  _WouldYouRatherPageState createState() => _WouldYouRatherPageState();
}

class _WouldYouRatherPageState extends State<WouldYouRatherPage> {
  late String option1 = "Tap to Start";
  late String option2 = "";
  bool _showGenerateButton = true;
  bool _showGameButtons = false;

  void _generateWouldYouRather() {
    setState(() {
      WouldYouRather sentence = _getRandomWouldYouRather();
      option1 = sentence.option1;
      option2 = sentence.option2;
      _showGenerateButton = false;
      _showGameButtons = true;
    });
  }

  WouldYouRather _getRandomWouldYouRather() {
    // Replace this with your logic to fetch a random option
    final randomIndex = Random().nextInt(wouldYouRatherListEng.length);
    return wouldYouRatherListEng[randomIndex];
  }

  void _nextWouldYouRather() {
    setState(() {
      _generateWouldYouRather();
    });
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '$option1',
                    style: TextStyle(fontSize: 28.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                if (option2.isNotEmpty)
                  Column(
                    children: [
                      SizedBox(height: 20.0),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'OR',
                          style: TextStyle(fontSize: 28.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 20.0),
                    ],
                  ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '$option2',
                    style: TextStyle(fontSize: 28.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          _showGenerateButton
              ? Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.black)))),
                    onPressed: () {
                      _generateWouldYouRather();
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
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.black)))),
                          onPressed: () {
                            _nextWouldYouRather();
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
