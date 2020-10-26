import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = new QuizBrain();
void main() {
  runApp(Quizler());
}




class Quizler extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[600],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
              child: QuizPage()
          ),
        ),

      ),

    );
  }
}
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List <Icon> scoreKeeper =[];
  void cheakAnswer(bool Ans){
    setState(() {
      if(Ans == quizBrain.getAnswer()){
        scoreKeeper.add(Icon(Icons.check,color: Colors.green));
      }
      else{
        scoreKeeper.add(Icon(Icons.close,color: Colors.red));
      }
      quizBrain.nextQuestion();
    });

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
      Expanded(
      flex: 5,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            quizBrain.getQuestionText(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(10),
//            child: Center(
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.green,
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),

                onPressed: () {
                  cheakAnswer(true);

                },
              ),
            ),
          ),

        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(10),
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.red,
                child: Text(
                  'False',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  cheakAnswer(false);

                },
              ),
            ),
          ),
        Row(
          children: scoreKeeper,
        )



   ]
    );
  }
}


