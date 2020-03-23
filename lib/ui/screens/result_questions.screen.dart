import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:covid_peru_project/utils/colors.dart';

class ResultQuestionScreen extends StatefulWidget {
  ResultQuestionScreen({Key key}) : super(key: key);

  @override
  _ResultQuestionScreenState createState() => _ResultQuestionScreenState();
}

class _ResultQuestionScreenState extends State<ResultQuestionScreen> {

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
                image: AssetImage('assets/virus.png')
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              child:  Text(
                "Tienes varios síntomas que indican que eres un posible portador del coronavirus COVID-19",
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
                "Debido a tus síntomas y contactos, podrías haber adquirido el COVID-19, por lo que deberás guardar aislamiento domiciliario por 14 días. Coordina los permisos correspondientes con tu empleador. Puedes revisar estos consejos para este período en casa.",
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
                    'Llamar teléfono de emergencia',
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

