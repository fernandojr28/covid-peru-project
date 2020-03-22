import 'package:flutter/material.dart';

class CovidFormScreen extends StatefulWidget {
  CovidFormScreen({Key key}) : super(key: key);

  @override
  _CovidFormScreenState createState() => _CovidFormScreenState();
}

class _CovidFormScreenState extends State<CovidFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(child: Icon(Icons.book, size: 64.0, color: Colors.white)),
    );
  }
}