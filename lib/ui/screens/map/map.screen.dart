import 'dart:async';

import 'package:covid_peru_project/models/country.model.dart';
import 'package:covid_peru_project/models/summary.model.dart';
import 'package:covid_peru_project/repositories/covid.repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  bool isFirst = true;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  CovidRepository covidRepository = CovidRepository();
  Summary summary;
  DeathsInWorld deathsInWorld;
  RecoveredInWorld recoveredInWorld;
  ConfirmedInWorld confirmedInWorld;

  Set<Marker> markersDeathsInWorld;
  Set<Marker> markersRecoveredInWorld;
  Set<Marker> markersConfirmedInWorld;

  GoogleMapController _controller;

  //Marker
  BitmapDescriptor pinCovidImage;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-12.1085849, -77.031424),
    zoom: 3.4746,
  );

  // static final CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  initState() {
    super.initState();

    this.renderSummaryModal();
    //  this.renderMarkers();
  }

  loadPinCovidImage() async {
    http
        .get(
            'https://cdn4.iconfinder.com/data/icons/dangerous/512/biohazard-512.png')
        .then((response) {
      print('asignando imagne');
      this.setState(() {
        pinCovidImage = BitmapDescriptor.fromBytes(response.bodyBytes);
      });
    });

    // pinCovidImage = await BitmapDescriptor.fromAssetImage(
    //     ImageConfiguration(devicePixelRatio: 2.5),
    //     'assets/destination_map_marker.png');
  }

  renderSummaryModal() async {
    summary = await covidRepository.summary();
    this.setState(() {});
  }

  renderMarkers() async {
    await Future.delayed(Duration(seconds: 2));
    deathsInWorld = await covidRepository.deaths();
    print('TOTAL MUERTES ->' + deathsInWorld.countries.length.toString());

    for (Country e in deathsInWorld.countries) {
      MarkerId _markerId = MarkerId(e.countryRegion + e.deaths.toString());
      print('---->> Marker add ' + e.countryRegion + e.deaths.toString());

      final Marker mark = Marker(
          markerId: _markerId,
          position: LatLng(e.lat, e.long),
          infoWindow: InfoWindow(title: e.deaths.toString(), snippet: '*'),
          icon: pinCovidImage);
      markers[_markerId] = mark;
    }
    this.setState(() {});

    //confirmedInWorld = await covidRepository.confirmed();
    //recoveredInWorld = await covidRepository.recovered();
  }

  @override
  Widget build(BuildContext context) {
    if (isFirst) {
      isFirst = false;
      this.loadPinCovidImage();
      this.renderMarkers();
    }
    return new Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            markers: Set<Marker>.of(markers.values),
            onMapCreated: (GoogleMapController controller) {
              _controller = controller;
              setNightModeToMap();
            },
          ),
          summary != null ? renderSummary() : Container()
        ],
      ),
    );
  }

  Widget renderSummary() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
          margin: EdgeInsets.only(top: 40),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  text: '',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Total muertes : ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: summary.deaths.toString()),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: '',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Total confirmados : ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: summary.confirmed.toString()),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: '',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Total recuperados : ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: summary.recovered.toString()),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  setNightModeToMap() {
    getJsonFile("assets/maps/night.json").then(setMapStyle);
  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  void setMapStyle(String mapStyle) {
    _controller.setMapStyle(mapStyle);
  }

  // Future<void> _goToTheLake() async {
  //   //_controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
