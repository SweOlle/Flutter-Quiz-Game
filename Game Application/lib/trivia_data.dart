class TriviaQuestion {
  String question;
  List<String> options;
  String correctAnswer;

  TriviaQuestion({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}

List<TriviaQuestion> geographyQuestions = [
  TriviaQuestion(
    question: 'What is the capital of Spain?',
    options: ['Lissabon', 'Madrid', 'Barcelona', 'Rome'],
    correctAnswer: 'Madrid',
  ),

  TriviaQuestion(
    question: 'Which is not a country in Europe?',
    options: ['Paris', 'Italy', 'Germany', 'Ukraine'],
    correctAnswer: 'Paris',
  ),
  TriviaQuestion(
    question: 'Which river is the longest in the world?',
    options: ['Amazon', 'Nile', 'Yangtze', 'Mississippi'],
    correctAnswer: 'Nile',
  ),

  TriviaQuestion(
    question: 'What is the capital of Japan?',
    options: ['Beijing', 'Tokyo', 'Seoul', 'Bangkok'],
    correctAnswer: 'Tokyo',
  ),

  TriviaQuestion(
    question: 'Which mountain range separates Europe and Asia?',
    options: ['Himalayas', 'Andes', 'Ural Mountains', 'Rocky Mountains'],
    correctAnswer: 'Ural Mountains',
  ),

  TriviaQuestion(
    question: 'In which ocean is the Great Barrier Reef located?',
    options: [
      'Atlantic Ocean',
      'Indian Ocean',
      'Arctic Ocean',
      'Pacific Ocean'
    ],
    correctAnswer: 'Pacific Ocean',
  ),

  TriviaQuestion(
    question: 'Which desert is the largest in the world?',
    options: [
      'Gobi Desert',
      'Sahara Desert',
      'Mojave Desert',
      'Karakum Desert'
    ],
    correctAnswer: 'Sahara Desert',
  ),
  // Add more geography questions...
];

List<TriviaQuestion> historyQuestions = [
  TriviaQuestion(
    question: 'When did WW2 start?',
    options: ['1936', '1942', '1932', '1939'],
    correctAnswer: '1939',
  ),

  TriviaQuestion(
    question: 'When did WW2 end?',
    options: ['1899', '1919', '1954', '1945'],
    correctAnswer: '1945',
  ),
  TriviaQuestion(
    question: 'Who was the first President of the United States?',
    options: [
      'Thomas Jefferson',
      'George Washington',
      'John Adams',
      'Abraham Lincoln'
    ],
    correctAnswer: 'George Washington',
  ),

  TriviaQuestion(
    question: 'In which year did World War II end?',
    options: ['1943', '1945', '1948', '1950'],
    correctAnswer: '1945',
  ),

  TriviaQuestion(
    question: 'Who wrote "Romeo and Juliet"?',
    options: [
      'Charles Dickens',
      'William Shakespeare',
      'Jane Austen',
      'Mark Twain'
    ],
    correctAnswer: 'William Shakespeare',
  ),

  TriviaQuestion(
    question: 'Which famous speech begins with "I have a dream..."?',
    options: [
      'Gettysburg Address',
      'Emancipation Proclamation',
      'I Have a Dream',
      'Inaugural Address'
    ],
    correctAnswer: 'I Have a Dream',
  ),

  TriviaQuestion(
    question: 'Who was the first woman to win a Nobel Prize?',
    options: [
      'Marie Curie',
      'Rosa Parks',
      'Mother Teresa',
      'Margaret Thatcher'
    ],
    correctAnswer: 'Marie Curie',
  ),

  // Add more geography questions...
];

List<TriviaQuestion> sportQuestions = [
  TriviaQuestion(
    question: 'Who won Ballon dor 2023 ',
    options: [
      'Cristiano Ronaldo',
      'Lionel Messi',
      'Kylian Mbappe',
      'Erling Haaland'
    ],
    correctAnswer: 'Lionel Messi',
  ),
  TriviaQuestion(
    question: 'Which country hosted the 2016 Summer Olympics?',
    options: ['United States', 'Brazil', 'Russia', 'China'],
    correctAnswer: 'Brazil',
  ),

  TriviaQuestion(
    question:
        'Who holds the record for the most goals scored in FIFA World Cup history?',
    options: ['Lionel Messi', 'Pele', 'Cristiano Ronaldo', 'Diego Maradona'],
    correctAnswer: 'Miroslav Klose',
  ),

  TriviaQuestion(
    question: 'In which sport would you perform a slam dunk?',
    options: ['Soccer', 'Tennis', 'Basketball', 'Golf'],
    correctAnswer: 'Basketball',
  ),

  TriviaQuestion(
    question: 'Which city is known as the "Home of the Olympics"?',
    options: ['Los Angeles', 'Tokyo', 'Paris', 'Athens'],
    correctAnswer: 'Athens',
  ),

  TriviaQuestion(
    question: 'Who won the most Formula One World Championships?',
    options: [
      'Michael Schumacher',
      'Ayrton Senna',
      'Lewis Hamilton',
      'Sebastian Vettel'
    ],
    correctAnswer: 'Lewis Hamilton',
  ),
  // Add more geography questions...
];
