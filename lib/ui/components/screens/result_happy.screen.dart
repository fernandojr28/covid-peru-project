import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:covid_peru_project/utils/colors.dart';

class ResultHappyScreen extends StatefulWidget {
  ResultHappyScreen({Key key}) : super(key: key);

  @override
  _ResultHappyScreenState createState() => _ResultHappyScreenState();
}

class _ResultHappyScreenState extends State<ResultHappyScreen> {

  final formKey     = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: covidGrey,
      appBar: AppBar(
        // centerTitle: true,
        // title: Text("Resultado"),
        leading: IconButton(
          icon: const Icon(Icons.clear),
          color: covidBlue,
          onPressed: ()  => Navigator.pushReplacementNamed(context, 'ask-one'),
        ),
        brightness: Brightness.light,
        backgroundColor: covidGrey,
        bottomOpacity: 0.0,
        elevation: 0,
        actions: <Widget>[
          
        ],
        // toolbarOpacity: 1.0,
        // actionsIconTheme: IconThemeData(color: covidPurple),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 25.0),
              child: Image(
                width: 100.0,
                image: AssetImage('assets/bacteria.png')
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              child:  Text(
                "No te preocupes, los síntomas que presentas en este momento no se consideran relacionados con el coronavirus COVID-19 según la evidencia científica disponible",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: covidBlue
                ),
                textAlign: TextAlign.center,
              )
            ),
            Container(
              child:  Text(
                "Sigue así lo estás haciendo bien. Ten en cuenta los consejos de prevención y mantén la atención a la aparición de posibles síntomas como tos, fiebre alta o falta de aire.",
                style: TextStyle(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w400,
                  color: covidBlue
                ),
                textAlign: TextAlign.center,
              )
            ),
            Expanded(
              child: Align(
                child: SizedBox(
                width: double.infinity,
                height: 50.0,
                child:  RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(50.0),
                    side: BorderSide(color: covidRed)
                  ),
                  color: covidRed.withOpacity(0.8),
                  onPressed: ()=> Navigator.pushReplacementNamed(context, 'ask-one'),
                  child: Text(
                    "¡Entendido!",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white)
                  ),
                ),
              ),
              ),
            )
            
          ],
        ),
      )
    );
    
  }
}

