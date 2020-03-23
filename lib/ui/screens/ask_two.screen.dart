import 'package:covid_peru_project/utils/colors.dart';
import 'package:flutter/material.dart';

class AskTwoScreen extends StatefulWidget {
  AskTwoScreen({Key key}) : super(key: key);

  @override
  _AskTwoScreenState createState() => _AskTwoScreenState();
}

class _AskTwoScreenState extends State<AskTwoScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * .40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/fondo.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .60,
              color: Colors.white,
            )
          ],
        ),
        Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * .30,
            right: 20.0,
            left: 20.0
          ),
          child: Container(
            height: 425,
            width: MediaQuery.of(context).size.width,
            child: _cardAskTwo(context)
          ),
        )
      ],
    );
  }
}


Widget _cardAskTwo(BuildContext context) {
  return Card(
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Colors.white70, width: 1),
      borderRadius: BorderRadius.circular(18),
    ),
    color: Colors.white,
    elevation: 4.0,
    child: Container(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image(
              width: 100.0,
              image: AssetImage('assets/care.png')
            ),
            Text(
              "¿Tienes alguna patología previa?",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w500,
                color: covidBlue
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              child: Text(
                "(Diabetes, Enfermedad hepática crónica, Enfermedad cardiovascular, Enfermedad pulomar crónica, Enfermedad renal crónica, Enfermedad neurológica o reuromuscular crócica, Inmunodeficiencia, Embarazo, Post-parto, Cáncer)",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w300,
                  color: covidBlue
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 120.0,
                  child: RaisedButton(
                    padding: EdgeInsets.all(12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(50.0),
                      side: BorderSide(color: Colors.red)
                    ),
                    color: covidLightRed,
                    onPressed: ()=> Navigator.pushReplacementNamed(context, 'ask-three'),
                    child: Text('NO',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)
                    ),
                  ),
                ),
                Container(
                  width: 120.0,
                  child: RaisedButton(
                    padding: EdgeInsets.all(12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: BorderSide(color: covidLightGreen)
                    ),
                    color: covidLightGreen,
                    onPressed: () => Navigator.pushReplacementNamed(context, 'ask-three'),
                    child: Text('SÍ',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)
                    ),
                  ),
                )
              ],
            )
          ],
        )
      ),
    ),
  );
}