import 'dart:math' show cos, sqrt, asin;

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapService {


  late PolylinePoints polylinePoints;
  GoogleMapController? _controller;
   LatLng center = LatLng(30.033333, 31.233334);
  Location currentLocation = Location();
   Set<Marker> markers = {};

    Set<Polyline>polyline={};
  List<LatLng> polylineCoordinates = [];
  late LatLng _new ;

  LatLng _news =  LatLng( 29.841, 31.301);






  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }
}