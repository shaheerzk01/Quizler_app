import 'question.dart';

class Quiz_brain{
  int _questionNumber = 0;
  List<Question> _questionbank = [
    Question('Programming languages are used in computer programming to implement algorithms.', true),
    Question('Usually, the programming language uses real words for some of the commands, so that the language is easier for a human to read.', true),
    Question('Programming languages are used to make all the computer programs for software ONLY.', false),
    Question('Most programming languages consist of instruction for computers. There are programmable machines that use a set of specific instructions, rather than general programming languages.', true),
    Question('Examples of high-level languages include Turbo C, Turbo C++".', false),
    Question('Examples of computer procedural languages BASIC, C, FORTRAN, Java, and Pascal', true),
    Question(
         'Scripting languages are often used for short scripts over full computer programs. JavaScript, Python, and Ruby are all examples of scripting languages',
         true),
    Question(
        'Prolog (PROgramming PROgramming in LOGic) is a representative logic language representative logic',
        true),
    Question(
        'Logic programming languages, of which PROLOG(Programming in login) is the best known, state a program as a set of logical relations.',
        true),
    Question(
        'When a pure function is called with some given arguments, it will always return the same result, and CANNOT be affected by any mutable state or other side effects.',
        true),
    Question('Functional programming is based on mathematical functions of functional programming?".', true),
    Question(
        'Many high-level languages are NOT similar enough that programmers can easily understand source code written in multiple languages.',
        false),
    Question(
        'A programming language is a vocabulary and set of grammatical rules for instructing a computer or computing device to perform specific tasks.',
        true),
    Question('Programming Language code can be compiled into a "low-level language," which is recognized directly by the computer hardware', true)
  ];

  void nextQuestion(){
    if(_questionNumber< _questionbank.length-1){
      _questionNumber++;
    }
  }

  String getQuestion(){
    return _questionbank[_questionNumber].questionText;
  }

  bool getAnswer(){
    return _questionbank[_questionNumber].questionAnswer;
  }

  bool isFinished(){
    if(_questionNumber>=_questionbank.length-1){
      print('Now returning true');
      return true;
    }else{
      return false;
    }
  }

  void reset(){
    _questionNumber = 0;
  }

}