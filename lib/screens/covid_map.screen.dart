import 'package:flutter/material.dart';


class CovidMapScreen extends StatefulWidget {
  CovidMapScreen({Key key}) : super(key: key);

  @override
  _CovidMapScreenState createState() => _CovidMapScreenState();
}

class _CovidMapScreenState extends State<CovidMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(child: Icon(Icons.map, size: 64.0, color: Colors.white)),
    );
  }
}