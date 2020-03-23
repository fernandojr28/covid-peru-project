import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:covid_peru_project/utils/colors.dart';

class AskOneScreen extends StatefulWidget {
  AskOneScreen({Key key}) : super(key: key);

  @override
  _AskOneScreenState createState() => _AskOneScreenState();
}

class _AskOneScreenState extends State<AskOneScreen> {

  final formKey     = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: covidGrey,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Síntomas"),
        leading: Icon(Icons.arrow_back),
        backgroundColor: covidRed.withOpacity(0.8),
        // actionsIconTheme: IconThemeData(color: covidPurple),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              child:  Text(
                "¿Cómo te sientes hoy 22 de marzo?",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,
                  color: covidBlue
                ),
                textAlign: TextAlign.center,
              )
            ),
            Container(
              child:  Text(
                "Conocer tu estado de salud nos permite prevenir la propagación del Coronavirus.",
                style: TextStyle(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w400,
                  color: covidBlue
                ),
                textAlign: TextAlign.center,
              )
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    IconButton(
                      icon: Image.asset('assets/smile.png'),
                      iconSize: 100,
                      onPressed: () => Navigator.pushReplacementNamed(context, 'result-happy'),
                    ),
                    Text(
                      "Me siento bien",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: covidBlue
                      )
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    IconButton(
                      icon: Image.asset('assets/sad.png'),
                      iconSize: 100,
                      onPressed: () => Navigator.pushReplacementNamed(context, 'ask-two'),
                    ),
                    Text(
                      "Me siento mal",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: covidBlue
                      )
                    )
                  ],
                )
              ],
            )
          ],
        ),
      )
    );
    
  }
}

