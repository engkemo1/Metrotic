import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:test/widget/AppBar.dart';
import '../helper.dart';
import '../widget/Person.dart';
import '../widget/botom Bar.dart';
import '../widget/hello.dart';
import '../widget/line Station.dart';
import 'menu.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PanelController _pc = new PanelController();
  CameraPosition _initialLocation = CameraPosition(target: LatLng(30.033333, 31.233334),zoom: 11.5,tilt: 50.0);
  late GoogleMapController mapController;
int? index;
  late Position _currentPosition;
  String _currentAddress = '';

  final startAddressController = TextEditingController();
  final destinationAddressController = TextEditingController();

  final startAddressFocusNode = FocusNode();
  final desrinationAddressFocusNode = FocusNode();

  String _startAddress = '';
  String _destinationAddress = '';
  String? _placeDistance;

  Set<Marker> markers = {};

  late PolylinePoints polylinePoints;
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Widget _textField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String label,
    required String hint,
    required double width,
    required Icon prefixIcon,
    Widget? suffixIcon,
    required Function(String) locationCallback,
  }) {
    return Container(
      width: width * 0.8,
      child: TextField(
        onChanged: (value) {
          locationCallback(value);
        },
        controller: controller,
        focusNode: focusNode,
        decoration: new InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.blue.shade300,
              width: 2,
            ),
          ),
          contentPadding: EdgeInsets.all(15),
          hintText: hint,
        ),
      ),
    );
  }
  void getLocation() async {
    await Geolocator.getCurrentPosition().then((value)  {
      mapController
          .animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
          target: LatLng(value.latitude , value.longitude ),
          
          zoom: 10.0,tilt: 50.0
      )));
      setState(() {
        polylineCoordinates.add(LatLng(value.latitude , value.longitude ));
        polylineCoordinates.add(LatLng( 29.841, 31.301));

        markers.add (Marker(
            onTap: (){
              setState(() {
                mapController
                    .animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
                    target: LatLng(value.latitude , value.longitude ),
                    zoom: 20.0,tilt: 50.0
                )));
              });
            },

            markerId: MarkerId('Home'),
            position: LatLng(value.latitude , value.longitude )),);
        markers.add(Marker(
          onTap: (){
            mapController
                .animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
                target:LatLng( 29.841, 31.301),
                zoom: 20.0,tilt: 50.0
            )));
          },
          markerId: MarkerId("destination"),
          position: LatLng( 29.841, 31.301),
          infoWindow: InfoWindow(

          ),

          icon: BitmapDescriptor.defaultMarker,
        ));
      });

    });
  }
  _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        _currentPosition = position;
        print('CURRENT POS: $_currentPosition');
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );
      });
      await _getAddress();
    }).catchError((e) {
      print(e);
    });
  }
  _getAddress() async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
        "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
        startAddressController.text = _currentAddress;
        _startAddress = _currentAddress;
      });
    } catch (e) {
      print(e);
    }
  }
  Future<bool> _calculateDistance() async {
    try {
      List<Location> startPlacemark = await locationFromAddress(_startAddress);
      List<Location> destinationPlacemark =
      await locationFromAddress(_destinationAddress);

      double startLatitude = _startAddress == _currentAddress
          ? _currentPosition.latitude
          : startPlacemark[0].latitude;

      double startLongitude = _startAddress == _currentAddress
          ? _currentPosition.longitude
          : startPlacemark[0].longitude;

      double destinationLatitude = destinationPlacemark[0].latitude;
      double destinationLongitude = destinationPlacemark[0].longitude;

      String startCoordinatesString = '($startLatitude, $startLongitude)';
      String destinationCoordinatesString =
          '($destinationLatitude, $destinationLongitude)';

      Marker startMarker = Marker(
        markerId: MarkerId(startCoordinatesString),
        position: LatLng(startLatitude, startLongitude),
        infoWindow: InfoWindow(
          title: 'Start $startCoordinatesString',
          snippet: _startAddress,
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      // Destination Location Marker
      Marker destinationMarker = Marker(
        markerId: MarkerId(destinationCoordinatesString),
        position: LatLng(destinationLatitude, destinationLongitude),
        infoWindow: InfoWindow(
          title: 'Destination $destinationCoordinatesString',
          snippet: _destinationAddress,
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      markers.add(startMarker);
      markers.add(destinationMarker);

      print(
        'START COORDINATES: ($startLatitude, $startLongitude)',
      );
      print(
        'DESTINATION COORDINATES: ($destinationLatitude, $destinationLongitude)',
      );


      double miny = (startLatitude <= destinationLatitude)
          ? startLatitude
          : destinationLatitude;
      double minx = (startLongitude <= destinationLongitude)
          ? startLongitude
          : destinationLongitude;
      double maxy = (startLatitude <= destinationLatitude)
          ? destinationLatitude
          : startLatitude;
      double maxx = (startLongitude <= destinationLongitude)
          ? destinationLongitude
          : startLongitude;

      double southWestLatitude = miny;
      double southWestLongitude = minx;

      double northEastLatitude = maxy;
      double northEastLongitude = maxx;


      mapController.animateCamera(
        CameraUpdate.newLatLngBounds(
          LatLngBounds(
            northeast: LatLng(northEastLatitude, northEastLongitude),
            southwest: LatLng(southWestLatitude, southWestLongitude),
          ),
          100.0,
        ),
      );



      await _createPolylines(startLatitude, startLongitude, destinationLatitude,
          destinationLongitude);

      double totalDistance = 0.0;

      // Calculating the total distance by adding the distance
      // between small segments
      // for (int i = 0; i < polylineCoordinates.length - 1; i++) {
      //   totalDistance += _coordinateDistance(
      //     polylineCoordinates[i].latitude,
      //     polylineCoordinates[i].longitude,
      //     polylineCoordinates[i + 1].latitude,
      //     polylineCoordinates[i + 1].longitude,
      //   );
      // }
      //
      // setState(() {
      //   _placeDistance = totalDistance.toStringAsFixed(2);
      //   print('DISTANCE: $_placeDistance km');
      // });

      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }

  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  _createPolylines(
      double startLatitude,
      double startLongitude,
      double destinationLatitude,
      double destinationLongitude,
      ) async {
    polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyAWdsVZ10-lbtg_6-d2weqxOSHRZ9h4y-Q", // Google Maps API Key
      PointLatLng(startLatitude, startLongitude),
      PointLatLng(destinationLatitude, destinationLongitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylineCoordinates,
      width: 3,
    );
    polylines[id] = polyline;
  }

  @override
  void initState() {
    super.initState();
    getLocation();
    _getCurrentLocation();
  }


  @override
  void dispose() {
    _pc;
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        key: _scaffoldKey,

        bottomNavigationBar: BotoomBar(
          index: 2,
        ),
        backgroundColor: const Color(0xffffffff),
        body:
        SafeArea(
            child: Stack(children: <Widget>[
          Container(
            height: height / 0.5,
            decoration: BoxDecoration(
              color: const Color(0xff00334a),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10, top: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Menu()));
                        },
                        child: Image.asset(
                          "assets/menu.png",
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Profile()));
                  },
                  child: Person(
                      high: 120,
                      width: 120,
                      color: Colors.white,
                      color2: ColorsHelp.background,
                      size: 120,
                      reduis: 80),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Kamal Magdy ',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 25,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w700,
                    height: 1.608695652173913,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
                Text(
                  'Daily ticket',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Colors.green,
                    height: 1.608695652173913,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Good Morning kamal :)',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    color: Colors.green,
                    height: 1.608695652173913,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
                Text(
                  "Where Do You Want \n To Go Today ?",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w700,
                    height: 1.608695652173913,
                  ),
                  textAlign: TextAlign.center,
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
              ],
            ),
          ),
          SlidingUpPanel(
            controller: _pc,
            minHeight: height * 0.4,
            maxHeight: height,
            panel:

              Stack(
                children: [


                  GoogleMap(
                    markers: Set<Marker>.from(markers),
                    initialCameraPosition: _initialLocation,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    mapType: MapType.normal,
                    zoomGesturesEnabled: true,
                    zoomControlsEnabled: false,
                    polylines: Set<Polyline>.of(polylines.values),
                    onMapCreated: (GoogleMapController controller) {
                      mapController = controller;
                    },
                  ),
                  // Show zoom buttons
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ClipOval(
                            child: Material(
                              color: Colors.blue.shade100, // button color
                              child: InkWell(
                                splashColor: Colors.blue, // inkwell color
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Icon(Icons.add),
                                ),
                                onTap: () {
                                  mapController.animateCamera(
                                    CameraUpdate.zoomIn(),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          ClipOval(
                            child: Material(
                              color: Colors.blue.shade100, // button color
                              child: InkWell(
                                splashColor: Colors.blue, // inkwell color
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Icon(Icons.remove),
                                ),
                                onTap: () {
                                  mapController.animateCamera(
                                    CameraUpdate.zoomOut(),
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  // Show the place input fields & button for
                  // showing the route

index==1?     // showing the route
SafeArea(
  child: Container(
    alignment: Alignment.topCenter,
    margin: EdgeInsets.only(top: 80),
    child: Padding(

      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        width: width * 0.9,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Starions',
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 10),
              _textField(
                  label: 'Start',
                  hint: 'Choose starting point',
                  prefixIcon: Icon(Icons.looks_one),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.my_location),
                    onPressed: () {
                      startAddressController.text = _currentAddress;
                      _startAddress = _currentAddress;
                    },
                  ),
                  controller: startAddressController,
                  focusNode: startAddressFocusNode,
                  width: width,
                  locationCallback: (String value) {
                    setState(() {
                      _startAddress = value;
                    });
                  }),
              SizedBox(height: 10),
              _textField(
                  label: 'Destination',
                  hint: 'Choose destination',
                  prefixIcon: Icon(Icons.looks_two),
                  controller: destinationAddressController,
                  focusNode: desrinationAddressFocusNode,
                  width: width,
                  locationCallback: (String value) {
                    setState(() {
                      _destinationAddress = value;
                    });
                  }),
              SizedBox(height: 10),
              Visibility(
                visible: _placeDistance == null ? false : true,
                child: Text(
                  'DISTANCE: $_placeDistance km',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 5),
              ElevatedButton(
                onPressed: (_startAddress != '' &&
                    _destinationAddress != '')
                    ? () async {
                  startAddressFocusNode.unfocus();
                  desrinationAddressFocusNode.unfocus();
                  setState(() {
                    if (markers.isNotEmpty) markers.clear();
                    if (polylines.isNotEmpty)
                      polylines.clear();
                    if (polylineCoordinates.isNotEmpty)
                      polylineCoordinates.clear();
                    _placeDistance = null;
                  });

                  _calculateDistance().then((isCalculated) {
                    if (isCalculated) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        SnackBar(
                          content: Text(
                              'Distance Calculated Sucessfully'),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        SnackBar(
                          content: Text(
                              'Error Calculating Distance'),
                        ),
                      );
                    }
                  });
                }
                    : null,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Show Route'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ),
):
                      Container(
                        margin: EdgeInsets.only(top: 80),
height: 190,
                        child: Container(
                          padding: EdgeInsets.only(top: 20),
                          height: 100,
                          margin: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            color: const Color(0xbfffffff),
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                                width: 1.0, color: const Color(0xbf00334a)),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0x1f000000),
                                offset: Offset(0, 3),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                          color: ColorsHelp.background,
                                          borderRadius: BorderRadius.circular(20)),
                                    ),
                                    Container(
                                      height: 5,
                                      width: 2,
                                      decoration: BoxDecoration(
                                          color: ColorsHelp.background,
                                          borderRadius: BorderRadius.circular(20)),
                                    ),
                                    Container(
                                      height: 5,
                                      width: 2,
                                      decoration: BoxDecoration(
                                          color: ColorsHelp.background,
                                          borderRadius: BorderRadius.circular(20)),
                                    ),
                                    Container(
                                      height: 5,
                                      width: 2,
                                      decoration: BoxDecoration(
                                          color: ColorsHelp.background,
                                          borderRadius: BorderRadius.circular(20)),
                                    ),
                                    Container(
                                      height: 5,
                                      width: 2,
                                      decoration: BoxDecoration(
                                          color: ColorsHelp.background,
                                          borderRadius: BorderRadius.circular(20)),
                                    ),
                                    Container(
                                      height: 5,
                                      width: 2,
                                      decoration: BoxDecoration(
                                          color: ColorsHelp.background,
                                          borderRadius: BorderRadius.circular(20)),
                                    ),
                                    Container(
                                      height: 5,
                                      width: 2,
                                      decoration: BoxDecoration(
                                          color: ColorsHelp.background,
                                          borderRadius: BorderRadius.circular(20)),
                                    ),
                                    Container(
                                      height: 5,
                                      width: 2,
                                      decoration: BoxDecoration(
                                          color: ColorsHelp.background,
                                          borderRadius: BorderRadius.circular(20)),
                                    ),
                                    Container(
                                      height: 5,
                                      width: 2,
                                      decoration: BoxDecoration(
                                          color: ColorsHelp.background,
                                          borderRadius: BorderRadius.circular(20)),
                                    ),
                                    Container(
                                      height: 5,
                                      width: 2,
                                      decoration: BoxDecoration(
                                          color: ColorsHelp.background,
                                          borderRadius: BorderRadius.circular(20)),
                                    ),
                                    Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                          color: ColorsHelp.background,
                                          borderRadius: BorderRadius.circular(20)),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                        child: Text(
                                          "From Station",
                                          style: TextStyle(
                                              color: ColorsHelp.background),
                                        ),
                                        onTap: () {
                                          _pc.open();
                                          showAnimatedDialog(
                                            context: context,
                                            barrierDismissible: true,
                                            builder: (BuildContext context) {
                                              return Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              offset: Offset(1, 4),
                                                              color: Colors.grey,
                                                              blurRadius: 3)
                                                        ]),
                                                    height: 120,
                                                    width: 300,
                                                    child: Column(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                            children: [
                                                              Container(
                                                                height: 35,
                                                                width: 120,
                                                                decoration: BoxDecoration(
                                                                    color: ColorsHelp
                                                                        .background,
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        20)),
                                                                child:
                                                                GestureDetector(
                                                                  child: Center(
                                                                    child: Text(
                                                                      "First Line",
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                          10,
                                                                          color: Colors
                                                                              .white,
                                                                          decoration:
                                                                          TextDecoration
                                                                              .none),
                                                                    ),
                                                                  ),
                                                                  onTap: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                    showAnimatedDialog(
                                                                      context:
                                                                      context,
                                                                      barrierDismissible:
                                                                      true,
                                                                      builder:
                                                                          (BuildContext
                                                                      context) {
                                                                        return Align(
                                                                            alignment: Alignment(
                                                                                0,
                                                                                0.4),
                                                                            child:
                                                                            Container(
                                                                              padding:
                                                                              EdgeInsets.only(left: 20),
                                                                              decoration: BoxDecoration(
                                                                                  color: Colors.white.withOpacity(0.6),
                                                                                  borderRadius: BorderRadius.circular(20)),
                                                                              width:
                                                                              300,
                                                                              height:
                                                                              400,
                                                                              child: LineStation(
                                                                                  Text1: "Helwan",
                                                                                  Text2: "Ain Helwan",
                                                                                  Text3: "Helwan University",
                                                                                  Text4: "Wadi Hof",
                                                                                  Text5: "Hadayek Helwan",
                                                                                  Text6: "El_Maasara",
                                                                                  Text7: "Tora El_Asmant",
                                                                                  Text8: "Kozzika",
                                                                                  Text9: "Tora El_Balad",
                                                                                  Text10: "Sakanat El_maadi",
                                                                                  Text11: "Maddi",
                                                                                  Text12: "Hadayek El_Maadi",
                                                                                  Text13: "Dar El_Salam"),
                                                                            ));
                                                                      },
                                                                      animationType:
                                                                      DialogTransitionType
                                                                          .slideFromBottomFade,
                                                                      curve: Curves
                                                                          .fastOutSlowIn,
                                                                      duration:
                                                                      Duration(
                                                                          seconds:
                                                                          2),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                              Container(
                                                                height: 35,
                                                                width: 120,
                                                                decoration: BoxDecoration(
                                                                    color: ColorsHelp
                                                                        .background,
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        20)),
                                                                child:
                                                                GestureDetector(
                                                                  child: Center(
                                                                      child: Text(
                                                                        "Second Line",
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                            fontSize:
                                                                            10,
                                                                            color: Colors
                                                                                .white,
                                                                            decoration:
                                                                            TextDecoration
                                                                                .none),
                                                                      )),
                                                                  onTap: () {},
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                            children: [
                                                              Container(
                                                                height: 35,
                                                                width: 120,
                                                                decoration: BoxDecoration(
                                                                    color: ColorsHelp
                                                                        .background,
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        20)),
                                                                child:
                                                                GestureDetector(
                                                                  child: Center(
                                                                    child: Text(
                                                                      "Third Line",
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                          10,
                                                                          color: Colors
                                                                              .white,
                                                                          decoration:
                                                                          TextDecoration
                                                                              .none),
                                                                    ),
                                                                  ),
                                                                  onTap: () {},
                                                                ),
                                                              ),
                                                              Container(
                                                                height: 35,
                                                                width: 120,
                                                              ),
                                                            ],
                                                          )
                                                        ])),
                                              );
                                            },
                                            animationType:
                                            DialogTransitionType.size,
                                            curve: Curves.fastOutSlowIn,
                                            duration: Duration(seconds: 1),
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        width: 100,
                                      ),
                                      IconButton(
                                          onPressed: () {

                                            _getCurrentLocation();
                                          },
                                          icon: Icon(
                                            Icons.my_location,
                                            color: ColorsHelp.background,
                                          ))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            width: 250,
                                            height: 3,
                                            color: ColorsHelp.background,
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          GestureDetector(
                                            child: Text(
                                              "To Station",
                                              style: TextStyle(
                                                  color: ColorsHelp.background),
                                            ),
                                            onTap: () {
                                              _pc.open();
                                              showAnimatedDialog(
                                                context: context,
                                                barrierDismissible: true,
                                                builder: (BuildContext context) {
                                                  return Align(
                                                    alignment: Alignment.center,
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  offset:
                                                                  Offset(1, 4),
                                                                  color:
                                                                  Colors.grey,
                                                                  blurRadius: 3)
                                                            ]),
                                                        height: 120,
                                                        width: 300,
                                                        child: Column(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                                children: [
                                                                  Container(
                                                                    height: 35,
                                                                    width: 120,
                                                                    decoration: BoxDecoration(
                                                                        color: ColorsHelp
                                                                            .background,
                                                                        borderRadius:
                                                                        BorderRadius.circular(
                                                                            20)),
                                                                    child:
                                                                    GestureDetector(
                                                                      child: Center(
                                                                        child: Text(
                                                                          "First Line",
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight
                                                                                  .bold,
                                                                              fontSize:
                                                                              10,
                                                                              color: Colors
                                                                                  .white,
                                                                              decoration:
                                                                              TextDecoration.none),
                                                                        ),
                                                                      ),
                                                                      onTap: () {
                                                                        Navigator.pop(
                                                                            context);
                                                                        showAnimatedDialog(
                                                                          context:
                                                                          context,
                                                                          barrierDismissible:
                                                                          true,
                                                                          builder:
                                                                              (BuildContext
                                                                          context) {
                                                                            return Align(
                                                                                alignment: Alignment(0,
                                                                                    0.4),
                                                                                child:
                                                                                Container(
                                                                                  padding: EdgeInsets.only(left: 20),
                                                                                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.6), borderRadius: BorderRadius.circular(20)),
                                                                                  width: 300,
                                                                                  height: 400,
                                                                                  child: LineStation(Text1: "Helwan", Text2: "Ain Helwan", Text3: "Helwan University", Text4: "Wadi Hof", Text5: "Hadayek Helwan", Text6: "El_Maasara", Text7: "Tora El_Asmant", Text8: "Kozzika", Text9: "Tora El_Balad", Text10: "Sakanat El_maadi", Text11: "Maddi", Text12: "Hadayek El_Maadi", Text13: "Dar El_Salam"),
                                                                                ));
                                                                          },
                                                                          animationType:
                                                                          DialogTransitionType
                                                                              .slideFromBottomFade,
                                                                          curve: Curves
                                                                              .fastOutSlowIn,
                                                                          duration: Duration(
                                                                              seconds:
                                                                              2),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    height: 35,
                                                                    width: 120,
                                                                    decoration: BoxDecoration(
                                                                        color: ColorsHelp
                                                                            .background,
                                                                        borderRadius:
                                                                        BorderRadius.circular(
                                                                            20)),
                                                                    child:
                                                                    GestureDetector(
                                                                      child: Center(
                                                                          child:
                                                                          Text(
                                                                            "Second Line",
                                                                            style: TextStyle(
                                                                                fontWeight:
                                                                                FontWeight
                                                                                    .bold,
                                                                                fontSize:
                                                                                10,
                                                                                color: Colors
                                                                                    .white,
                                                                                decoration:
                                                                                TextDecoration.none),
                                                                          )),
                                                                      onTap: () {},
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                                children: [
                                                                  Container(
                                                                    height: 35,
                                                                    width: 120,
                                                                    decoration: BoxDecoration(
                                                                        color: ColorsHelp
                                                                            .background,
                                                                        borderRadius:
                                                                        BorderRadius.circular(
                                                                            20)),
                                                                    child:
                                                                    GestureDetector(
                                                                      child: Center(
                                                                        child: Text(
                                                                          "Third Line",
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight
                                                                                  .bold,
                                                                              fontSize:
                                                                              10,
                                                                              color: Colors
                                                                                  .white,
                                                                              decoration:
                                                                              TextDecoration.none),
                                                                        ),
                                                                      ),
                                                                      onTap: () {},
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    height: 35,
                                                                    width: 120,
                                                                  ),
                                                                ],
                                                              )
                                                            ])),
                                                  );
                                                },
                                                animationType:
                                                DialogTransitionType.size,
                                                curve: Curves.fastOutSlowIn,
                                                duration: Duration(seconds: 1),
                                              );
                                            },
                                          )
                                        ],

                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),




                  // Show current location button
                  SafeArea(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                        child: ClipOval(
                          child: Material(
                            color: Colors.orange.shade100, // button color
                            child: InkWell(
                              splashColor: Colors.orange, // inkwell color
                              child: SizedBox(
                                width: 56,
                                height: 56,
                                child: Icon(Icons.my_location),
                              ),
                              onTap: () {

                                    mapController.animateCamera(
                                  CameraUpdate.newCameraPosition(
                                    CameraPosition(
                                      target: LatLng(
                                        _currentPosition.latitude,
                                        _currentPosition.longitude,
                                      ),
                                      zoom: 18.0,
                                    ),
                                  ),
                                );

                              // setState(() {
                              //   getLocation();
                              // });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: AppBarr(text: "Booking Ticket",),
                  ),

Align(alignment:Alignment(1,0.6),child:                   FloatingActionButton(onPressed: (){
  if(index==0)
  setState(() {
  index=1;

});
 else
   setState(() {
     index =0;
   });


  },child:index==0? Icon(Icons.search):Icon(Icons.select_all)),
    ),
                  Align(alignment:Alignment(1,0.4),child:                   FloatingActionButton(onPressed: (){

setState(() {
  _getCurrentLocation();
});

                  },child:Icon(Icons.my_location)),
                  )

                ],
              ),

            collapsed: Column(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0, color: ColorsHelp.background),
                    color: const Color(0xff00334a),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                    ),
                  ),
                  child: Center(
                    child: Container(
                      height: 10,
                      width: 80,
                      color: Colors.green,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ])));
  }


}
