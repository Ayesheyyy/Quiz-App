
import 'package:flutter/material.dart';
void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Question> questions = [
    Question('"Who is the captain of Pakisten mens cricket team?"', {'1-Babar Azam': true, '2-Shadab': false, '3-Shaheen': false, '4-Rizwan': false}),
    Question('"Who is the caption of pakisten cricket team when pak won the ODI world Cup in 1992?"', {'a-Waseem Akram': false, 'b-Shoaib Akhtar': false, 'c-Imran Khan': true, 'd-Ramiz Raja': false}),
    Question('"Who was appointed the coach of the Pakistani Cricket team after the World Cup of 2003?"',{'1-Saqlain Mushtaq':false,'2-Javed Miandad':true,'3-Inzmam ul Haq':false,'4-Umar Gul':false}),
    Question('"Who was the 1st test captain of Pakistan?"',{'a-shahid afridi':false,'b-shoiab akhtar':false,'c-Abdul kardar':true,'d-Imran Khan':false}),
    Question('"when did pak won the 1st world cup title?"',{'1-1992':true,'2-1998':false,'3-2003':false,'4-2009':false}),
    Question('"Which player has scored most fifties for Pak?"',{'a-Wasim Raja':false,'b-Saeed Anwar':false,'c-Javed Miandad':true,'d-Zaheer Abbas':false}),
    Question('"Who is the most Successful captain in T20?"', {'1-Babar Azam': true, '2-Virat Kohli': false, '3-Aron Finch': false, '4-Ben stokes': false}),
    Question('"Which country did pak tour in 1990-2000?"',{'a-England':false,'b-India':false,'c-Australia':true,'d-Zimbabwe':false}),
    Question('"Who replaced Waqar Younis as the test and one-day captain after 2003 world cup?"',{'1-Shahid Afridi':false,'2-Waseem Akram':false,'3-Ramiz Raja':false,'4-Rashid Latif':true}),
    Question('"The youngest player to take 10 wickets in a Test Match was who?"',{'a-Wasim Akram':true,'b-Abrar Ahmad':false,'c-Muhammad Amir':false,'d-Yasir shah':false}),
    Question('"Which country host the ODI World Cup 2023?"',{'1-Pakistan':false,'2-India':true,'3-Bangladesh':false,"4-SriLanka":false}),
    Question('"Pakistans longest stretch without a Test defeat was between 1986-87 and 1987-88 .How many Tests?"',{'a-16':true,'b-10':false,'c-20':false,'d-25':false}),
    Question('"Which fast bowler was known for his scorching yorkers, and had taken 416 wickets in 262 ODIs with a best performance of 7/36"',{'1-wasim Akram':false,'2-Shoiab Akhtar':false,'3-Waqar Younas':true,'4-Shaheen Afridi':false}),
    Question('"Which Pakistani player has most centuries in T20?"',{'a-Babar Azam':true,'b-Rizwan':false,'c-Shadab':false,'d-Fakhar Zaman':false}),
    Question('"Which country did not win the World Cup during those 25 years"',{'1-India':false,'2-England':true,'3-SriLanka':false,'4-Pakistan':false}),
    Question('"Which country did Pakistan beat in the semifinals, of the 1999 Cricket World Cup?"',{'a-India':false,'b-New Zealand':true,'c-SriLanka':false,'d-Pakistan':false}),
    Question('"Which team won the most titles of PSL?"',{'1-Karachi kings':false,'2-Peshawar Zalmi':false,'3-Multan Sultan':false,'4-Islamabad United':true}),
    Question('"Which PSl team has the record to qualify in every PSl?"',{'a-Lahore Qlandars':false,'b-Peshawar Zalmi':true,'c-Queta Gladiater':false,'d-Multan Sultan':false}),
    Question('"What year did PSL start?"',{'1-1970':false,'2-2011':false,'3-2016':true,'4-2019':false}),
    Question('"Where was the opening ceremony of PSL 1-4 held?"',{'a-Pakistan':false,'b-England':false,'c-UAE':true,'d-USA':false}),


  ];

  int currentQuestionIndex = 0;
  int score = 0;

  void _answerQuestion(bool isCorrect) {
    if (isCorrect) {
      setState(() {
        score++;
      });
    }
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Start Your Quiz!',style: TextStyle(color: Colors.yellow,fontSize: 25.0,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      backgroundColor: Colors.teal,
      body: currentQuestionIndex < questions.length
          ? Quiz(
        question: questions[currentQuestionIndex],
        answerQuestion: _answerQuestion,
      )
          : Result(score: score, total: questions.length),
    );
  }
}

class Question {
  final String questionText;
  final Map<String, bool> answers;

  Question(this.questionText, this.answers);
}

class Quiz extends StatelessWidget {
  final Question question;
  final Function(bool) answerQuestion;

  Quiz({required this.question, required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          question.questionText,
          style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30.0),
        ...question.answers.keys.map((answer) {
          return Answer(
            answerText: answer,
            isCorrect: question.answers[answer]!,
            answerQuestion: answerQuestion,
          );
        }).toList(),
      ],
    );
  }
}

class Answer extends StatelessWidget {
  final String answerText;
  final bool isCorrect;
  final Function(bool) answerQuestion;

  Answer({required this.answerText, required this.isCorrect, required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.yellow, // Background color
        ),
        child: Text(answerText),
        onPressed: () => answerQuestion(isCorrect),
      ),
    );
  }
}

class Result extends StatelessWidget {
  final int score;
  final int total;

  Result({required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Quiz Completed!',
            style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
          ),
          Text(
            'Your Score: $score / $total',
            style: TextStyle(fontSize: 22.0),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            child: Text('Restart Quiz'),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => QuizPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}