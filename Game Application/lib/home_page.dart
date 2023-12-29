import 'package:flutter/material.dart';

import 'trivia.dart';
import 'charades.dart';
import 'truth_or_dare.dart';
import 'would_you_rather.dart';
import 'most_likely_to.dart';

import 'trivia_data.dart';

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
      body: Column(
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
                CustomButton(
                  buttonText: 'Trivia Quiz',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TriviaPage()),
                    );
                  },
                ),
                CustomButton(
                  buttonText: 'Charades',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CharadesPage()),
                    );
                  },
                ),
                CustomButton(
                  buttonText: 'Truth or Dare',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TruthOrDarePage()),
                    );
                  },
                ),
                CustomButton(
                  buttonText: 'Would you rather?',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WouldYouRatherPage()),
                    );
                  },
                ),
                CustomButton(
                  buttonText: 'Most likely to',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MostLikelyToPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const CustomButton({
    required this.buttonText,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      width: 300.0,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(buttonText),
      ),
    );
  }
}
