import 'dart:async';
import 'dart:typed_data';

import 'package:covid_peru_project/models/country.model.dart';
import 'package:covid_peru_project/models/summary.model.dart';
import 'package:covid_peru_project/repositories/covid.repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import 'dart:ui' as ui;

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
  BitmapDescriptor pinCovidImage = BitmapDescriptor.defaultMarker;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-12.1085849, -77.031424),
    zoom: 1,
  );

  // static final CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((c) {
      print('CUANTA VECES SE EJECUTA ESTO??');
      if (mounted) {
        this.renderSummaryModal();
        this.renderMarkers();
      }
    });

    //  this.renderMarkers();
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

      BitmapDescriptor _countryMarker = BitmapDescriptor.defaultMarker;
      _countryMarker = await generateMarkerPerDeath(e);
      final Marker mark = Marker(
        markerId: _markerId,
        position: LatLng(e.lat, e.long),
        infoWindow: InfoWindow(
            title: e.deaths.toString() + ' muertos',
            snippet: e.countryRegion +
                (e.provinceState == null ? '' : ' - ' + e.provinceState)),
        icon: _countryMarker,
      );
      markers[_markerId] = mark;
    }
    this.setState(() {});

    //confirmedInWorld = await covidRepository.confirmed();
    //recoveredInWorld = await covidRepository.recovered();
  }

  Future<BitmapDescriptor> generateMarkerPerDeath(Country _country) async {
    int radius = 25;

    if (_country.deaths > 100 && _country.deaths < 1000) radius = 50;
    if (_country.deaths >= 1000 && _country.deaths < 2000) radius = 120;
    if (_country.deaths >= 2000 && _country.deaths < 3500) radius = 170;
    if (_country.deaths >= 3500) radius = 220;

    final onValue = await getBytesFromCanvas(radius, radius);
    return BitmapDescriptor.fromBytes(onValue);
  }

  @override
  Widget build(BuildContext context) {
    if (isFirst) {
      isFirst = false;
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
              color: Color(0xfa212121).withOpacity(0.9),
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                    TextSpan(
                        text: summary.deaths.toString(),
                        style: TextStyle(color: Colors.white)),
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                    TextSpan(
                        text: summary.confirmed.toString(),
                        style: TextStyle(color: Colors.white)),
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                    TextSpan(
                        text: summary.recovered.toString(),
                        style: TextStyle(color: Colors.white)),
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

  Future<Uint8List> getBytesFromCanvas(int width, int height) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = Color(0XFF9e110f).withOpacity(0.8);
    final Radius radius = Radius.circular(width * 2.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0.0, 0.0, width.toDouble(), height.toDouble()),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        paint);
    TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
    painter.text = TextSpan(
      text: '',
      style: TextStyle(fontSize: 25.0, color: Colors.white),
    );
    painter.layout();
    painter.paint(
        canvas,
        Offset((width * 0.5) - painter.width * 0.5,
            (height * 0.5) - painter.height * 0.5));
    final img = await pictureRecorder.endRecording().toImage(width, height);
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    return data.buffer.asUint8List();
  }
}
