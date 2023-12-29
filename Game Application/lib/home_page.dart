import 'package:flutter/material.dart';

import 'trivia.dart';
import 'charades.dart';
import 'truth_or_dare.dart';
import 'would_you_rather.dart';
import 'most_likely_to.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[300],
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.purple, Colors.blue],
            ),
          ),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
                alignment: Alignment.center,
                child: const Text(
                  'Party Game',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 46.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 200, // Adjust the width as needed
                      height: 50, // Adjust the height as needed
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.black)))),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TriviaPage()),
                          );
                        },
                        child: Text(
                          'Trivia Quiz',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200, // Adjust the width as needed
                      height: 50, // Adjust the height as needed
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.black)))),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CharadesPage()),
                          );
                        },
                        child: Text(
                          'Charades',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200, // Adjust the width as needed
                      height: 50, // Adjust the height as needed
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.black)))),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TruthOrDarePage()),
                          );
                        },
                        child: Text(
                          'Truth or Dare',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200, // Adjust the width as needed
                      height: 50, // Adjust the height as needed
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.black)))),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WouldYouRatherPage()),
                          );
                        },
                        child: Text(
                          'Would You Rather?',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200, // Adjust the width as needed
                      height: 50, // Adjust the height as needed
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.black)))),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MostLikelyToPage()),
                          );
                        },
                        child: Text(
                          'Most Likely To',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

/*
decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.purple, Colors.blue])),
                    */