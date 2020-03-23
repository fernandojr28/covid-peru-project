import 'package:covid_peru_project/ui/components/screens/result_happy.screen.dart';
import 'package:flutter/material.dart';
import 'package:covid_peru_project/covid_home.dart';
import 'package:covid_peru_project/ui/components/screens/covid_form.screen.dart';
import 'package:covid_peru_project/ui/components/screens/ask_one.screen.dart';
import 'package:covid_peru_project/ui/components/screens/ask_two.screen.dart';
import 'package:covid_peru_project/ui/components/screens/ask_three.screen.dart';
import 'package:covid_peru_project/ui/components/screens/ask_four.screen.dart';
import 'package:covid_peru_project/ui/components/screens/ask_five.screen.dart';
import 'package:covid_peru_project/ui/components/screens/ask_six.screen.dart';
import 'package:covid_peru_project/ui/components/screens/result_questions.screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CovidPerú',
      routes: {
        'registro' : ( BuildContext context ) => CovidFormScreen(),
        'ask-one': ( BuildContext context ) => AskOneScreen(),
        'ask-two': ( BuildContext context ) => AskTwoScreen(),
        'ask-three': ( BuildContext context ) => AskThreeScreen(),
        'ask-four': ( BuildContext context ) => AskFourScreen(),
        'ask-five': ( BuildContext conntext ) => AskFiveScreen(),
        'ask-six': ( BuildContext conntext ) => AskSixScreen(),
        'result-question': ( BuildContext conntext ) => ResultQuestionScreen(),
        'result-happy': ( BuildContext conntext ) => ResultHappyScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CovidHome(),
    );
  }
}

