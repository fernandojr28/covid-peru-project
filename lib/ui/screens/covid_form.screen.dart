import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:covid_peru_project/utils/colors.dart';

class CovidFormScreen extends StatefulWidget {
  CovidFormScreen({Key key}) : super(key: key);

  @override
  _CovidFormScreenState createState() => _CovidFormScreenState();
}

class _CovidFormScreenState extends State<CovidFormScreen> {

  final formKey     = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final inputDecoration = InputDecoration(
      hintStyle: TextStyle(color: covidBlue),
      hintText: 'Nombre',
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      fillColor: Colors.grey[100],
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
      )
    );

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        backgroundColor: covidRed.withOpacity(0.8),
        // actionsIconTheme: IconThemeData(color: covidPurple),
      ),
      resizeToAvoidBottomInset: true,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 25.0, bottom: 15.0),
            child: Image(
              width: 200.0,
              image: AssetImage('assets/health.png')
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20.0),
            child:  Text(
              "¿Cómo te llamas?",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500, color: covidBlue),
            )
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              cursorColor: covidBlue,
              decoration: inputDecoration,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: double.infinity,
                height: 50.0,
                child:  RaisedButton(
                  color: covidRed.withOpacity(0.8),
                  onPressed: ()=> Navigator.pushReplacementNamed(context, 'ask-one'),
                  child: Text(
                    'Siguiente',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white)
                  ),
                ),
              )
          ),
          ),
        ],
      )
    );
    
  }
}