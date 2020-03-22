import 'package:covid_peru_project/screens/covid_form.screen.dart';
import 'package:covid_peru_project/screens/covid_map.screen.dart';
import 'package:flutter/material.dart';

class CovidHome extends StatefulWidget {
  CovidHome({Key key}) : super(key: key);

  @override
  _CovidHomeState createState() => _CovidHomeState();
}

//#02c6c1

class _CovidHomeState extends State<CovidHome> 
  with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {


    final _kTabPages = <Widget>[
      CovidMapScreen(),
      CovidFormScreen()
    ];

    final _kTabs = <Tab>[
      Tab(icon: new Icon(Icons.map)),
      Tab(icon: new Icon(Icons.book))
    ];



    return Scaffold(
     
     backgroundColor:  Color(0xf0d32d32),
     body: TabBarView(
        controller: _tabController,
        children: _kTabPages,
      ),
      
      bottomNavigationBar: Container(
        color: Colors.white,
        child: new TabBar(
          controller: _tabController,
          tabs: _kTabs,
          labelColor: Color(0xf0d32d32),
          unselectedLabelColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: Colors.red,
        ),
      ),
    );
  }
}