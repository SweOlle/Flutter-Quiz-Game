import 'package:flutter/material.dart';
import 'trivia_data.dart';

class TriviaPage extends StatefulWidget {
  @override
  _TriviaPageState createState() => _TriviaPageState();
}

class _TriviaPageState extends State<TriviaPage> {
  late List<TriviaQuestion> questions;
  int currentQuestionIndex = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    // Set default category (you can change this to initialCategory based on your app logic)
    questions = [];
  }

  void _startQuiz(String category) {
    setState(() {
      // Set the questions based on the selected category
      switch (category) {
        case 'Geography':
          questions = List.from(geographyQuestions)..shuffle();
          break;
        case 'History':
          questions = List.from(historyQuestions)..shuffle();
          break;
        case 'Sport':
          questions = List.from(sportQuestions)..shuffle();
          break;
        // Add cases for other categories
      }
      currentQuestionIndex = 0;
      score = 0;
    });
    _showQuestion(context);
  }

  void _showQuestion(BuildContext context) {
    if (currentQuestionIndex < questions.length) {
      List<String> options = questions[currentQuestionIndex].options;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuestionScreen(
            questionNumber: currentQuestionIndex + 1,
            questionText: questions[currentQuestionIndex].question,
            options: questions[currentQuestionIndex].options,
            correctAnswer: questions[currentQuestionIndex].correctAnswer,
            onAnswerSelected: (selectedAnswer) {
              Navigator.pop(context);
              answerSelected(selectedAnswer);
            },
          ),
        ),
      );
    } else {
      _showResultDialog();
    }
  }

  void answerSelected(String selectedAnswer) {
    String correctAnswer = questions[currentQuestionIndex].correctAnswer;

    setState(() {
      if (selectedAnswer == correctAnswer) {
        score++;
      }

      // Move to the next question or end the quiz
      currentQuestionIndex++;
      _showQuestion(context);
    });
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Quiz Completed'),
          content: Text('Your Score: $score'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _restartQuiz(); // Call _restartQuiz to restart the quiz
              },
              child: Text('Restart'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                // You can navigate to another screen or perform other actions
              },
              child: Text('Quit'),
            ),
          ],
        );
      },
    );
  }

  void _restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
    });
    _showQuestion(context); // Start the quiz with the next question
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trivia'),
        backgroundColor: Colors.deepPurple[300],
      ),
      backgroundColor: Colors.deepPurple[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Select a Category',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 200),
            SizedBox(
              width: 200, // Adjust the width as needed
              height: 50, // Adjust the height as needed
              child: ElevatedButton(
                onPressed: () {
                  _startQuiz('Geography');
                },
                child: Text('Geography'),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 200, // Adjust the width as needed
              height: 50, // Adjust the height as needed
              child: ElevatedButton(
                onPressed: () {
                  _startQuiz('History');
                },
                child: Text('History'),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 200, // Adjust the width as needed
              height: 50, // Adjust the height as needed
              child: ElevatedButton(
                onPressed: () {
                  _startQuiz('Sport');
                },
                child: Text('Sport'),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 200, // Adjust the width as needed
              height: 50, // Adjust the height as needed
              child: ElevatedButton(
                onPressed: () {
                  _startQuiz('Cinema');
                },
                child: Text('Cinema'),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 200, // Adjust the width as needed
              height: 50, // Adjust the height as needed
              child: ElevatedButton(
                onPressed: () {
                  _startQuiz('Literature');
                },
                child: Text('Literature'),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 200, // Adjust the width as needed
              height: 50, // Adjust the height as needed
              child: ElevatedButton(
                onPressed: () {
                  _startQuiz('Food');
                },
                child: Text('Food'),
              ),
            ),
            SizedBox(height: 16),
            // Add buttons for other categories
          ],
        ),
      ),
    );
  }
}

class QuestionScreen extends StatefulWidget {
  final int questionNumber;
  final String questionText;
  final List<String> options;
  final String correctAnswer;
  final void Function(String) onAnswerSelected;

  QuestionScreen({
    required this.questionNumber,
    required this.questionText,
    required this.options,
    required this.correctAnswer,
    required this.onAnswerSelected,
  });

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  String? selectedAnswer;
  bool isAnsweredCorrectly = false;

  void _handleAnswer(String option) {
    bool isCorrect = option == widget.options[0];

    setState(() {
      isAnsweredCorrectly = isCorrect;
      selectedAnswer = option;
    });

    Future.delayed(Duration(seconds: 1), () {
      widget.onAnswerSelected(selectedAnswer!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${widget.questionNumber}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.questionText,
              style: TextStyle(fontSize: 26),
            ),
            SizedBox(height: 16),
            Column(
              children: widget.options.map((option) {
                return Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          _handleAnswer(option);
                        },
                        style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 18),
                          backgroundColor: () {
                            if (selectedAnswer == null) {
                              return Colors.blue;
                            } else if (selectedAnswer == option) {
                              if (option == widget.correctAnswer) {
                                return Colors.green;
                              } else {
                                return Colors.red;
                              }
                            } else if (option == widget.correctAnswer) {
                              return Colors.green;
                            } else {
                              return Colors.blue;
                            }
                          }(),
                        ),
                        child: Text(option),
                      ),
                    ),
                    SizedBox(height: 16), // Add space between buttons
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
