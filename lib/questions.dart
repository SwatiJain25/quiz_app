import 'package:flutter/material.dart';
import 'package:test_web_app/answer_button.dart';
import 'package:test_web_app/data/questionsanswers.dart';
import 'package:google_fonts/google_fonts.dart';
class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key,required this.onSelectAnswer,});

  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen>createState(){
return _QuestionsScreenState();
  }
}
class _QuestionsScreenState extends State<QuestionsScreen>{
  var currQuestionIndex=0;
  void answerQuestion(String selectedAnswers){
    widget.onSelectAnswer(selectedAnswers);
    setState(() {
    currQuestionIndex++;
      });
  }
  @override
  Widget build(context){
    final currentQuestion=questions[currQuestionIndex];
    return SizedBox(
      child:Container(width: double.infinity,
      margin: const EdgeInsets.all(40),
       child:  Column(
        
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        
      Text(currentQuestion.text,style:GoogleFonts.lato(
        color:Color.fromARGB(255, 213, 191, 226),
        fontSize:30,
        fontWeight:FontWeight.bold,
      )
      ,
      textAlign: TextAlign.center,),
      const SizedBox(height: 30),
      ...currentQuestion.getShuffledAnswers().map((answer) {
        return AnswerButton(
          answerText: answer,
         onTap: (){
           answerQuestion(answer);
         },
         );
            }
          ) 
        ],
      ),),
    );
  }
}