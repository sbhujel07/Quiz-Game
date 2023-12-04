import 'package:flutter/material.dart';
import 'package:alert_dialog/alert_dialog.dart';
import 'package:flutter_quiz/questionbook.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /*List<String> question = [
    'KP OLI is the Prime Minister of Nepal ?',
    'Kathmandu is Capital City of Nepal ?',
    'Sun rises from East ?',
    'Flutter is developed by Microsoft?',
    'Gautaum Boudha was born in Nepal?',
    'Mount Everest is lies in Bangladesh?',
  ];*/
  List<QuestionBank> questionList = [
    QuestionBank(question: 'KP OLI is the Prime Minister of Nepal ?', answer: false),
    QuestionBank(question:'Kathmandu is Capital City of Nepal ?', answer:true),
    QuestionBank(question:'Kathmandu is Capital City of Nepal ?', answer:true),
    QuestionBank(question:'Kathmandu is Capital City of Nepal ?', answer:true),
    QuestionBank(question:'Kathmandu is Capital City of Nepal ?', answer:true),
    QuestionBank(question:'Kathmandu is Capital City of Nepal ?', answer:true),
  ];
  int questionumber = 0;
  int score = 0;
  void nextquestion(BuildContext context) {
    if (questionumber == question.length - 1) {
      setState(() {
        alert(context, title: Text('Thanks!! your Score is $score'));
      });

      ;
      setState(() {
        getTrackWidget = [];
        questionumber = 0;
      });
    } else {
      questionumber++;
    }
  }
  void checkAnswer(bool selectedAnswer){
    if(answer[questionumber]==selectedAnswer){
      setState(() {
        if (answer[questionumber] == true) {
          getTrackWidget.add(
            Icon(
              Icons.check,
              color: Colors.cyan,
            ),
          );
          score++;
        } else {
          getTrackWidget.add(
            Icon(
              Icons.close,
              color: Colors.redAccent,
            ),
          );
        }
        nextquestion(context);

    }
  }

  List<Widget> getTrackWidget = [];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/image.png'), fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    question[questionumber],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    onPressed: () {

                      });
                    },
                    child: Center(
                      child: Text(
                        'TRUE',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                      ),
                    )),
              ),
              Expanded(
                  child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                ),
                onPressed: () {
                  setState(() {
                    if (answer[questionumber] == false) {
                      getTrackWidget.add(
                        Icon(
                          Icons.check,
                          color: Colors.cyan,
                        ),
                      );
                      score++;
                    } else {
                      getTrackWidget.add(
                        Icon(
                          Icons.close,
                          color: Colors.redAccent,
                        ),
                      );
                    }
                    nextquestion(context);
                  });
                },
                child: Center(
                  child: Text(
                    'FALSE',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                ),
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: getTrackWidget,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
