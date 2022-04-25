import 'dart:typed_data';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:test/View/map.dart';
import '../helper.dart';
import '../widget/Person.dart';
import '../widget/botom Bar.dart';
import '../widget/hello.dart';
import '../widget/line Station.dart';
import 'menu.dart';
import 'dart:ui' as ui;

class Home extends StatefulWidget {

  static const routeName = "/home_screen";
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  String uid = "";
  String email = "";
  String name = "";
  String phone = "";
  String tagID = "";
  String nationalID = "";

  PanelController _pc = new PanelController();
  late GoogleMapController mapController;
  late PolylinePoints polylinePoints;
  LatLng center = LatLng(30.044420, 31.235712);
  Set<Marker> markers = {};
  Set<Polyline> polyline = {};
  List<LatLng> polylineCoordinates = [];
  MapType type = MapType.normal;
  late Animation<double> _animation;
  late AnimationController _animationController;


  @override
  void initState() {

    getUser();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );
    final curvedAnimation =
    CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    FloatingActionBubble floating = FloatingActionBubble(
      // Menu items
      items: <Bubble>[
        // Floating action menu item
        Bubble(
          title: "Search Your Destination",
          iconColor: ColorsHelp.backgroundG,
          bubbleColor: ColorsHelp.background,
          icon: Icons.search,
          titleStyle:
          TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => MapLocation()));
            _animationController.reverse();
          },
        ),
        // Floating action menu item
        Bubble(
          title: "Nearest station to me",
          iconColor: ColorsHelp.backgroundG,
          bubbleColor: ColorsHelp.background,
          icon: Icons.near_me,
          titleStyle:
          TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            Navigator.push(context,  MaterialPageRoute(
                builder: (_) => MapLocation(GetNearStation: 2,)));
            _animationController.reverse();
          },
        ),
        Bubble(
          title: "Get your location",
          iconColor: ColorsHelp.backgroundG,
          bubbleColor: ColorsHelp.background,
          icon: Icons.my_location,
          titleStyle:
          TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => MapLocation(GetLocation: 1,)));
            _animationController.reverse();
          },
        ),
        //Floating action menu item
        Bubble(
          title: " All Stations",
          iconColor: ColorsHelp.backgroundG,
          bubbleColor: ColorsHelp.background,
          icon: Icons.train,
          titleStyle:
          TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            setState(() {
              markers;
            });
            _animationController.reverse();
          },
        ),

        Bubble(
          title: "Satellite",
          iconColor: ColorsHelp.backgroundG,
          bubbleColor: ColorsHelp.background,
          icon: Icons.satellite_alt,
          titleStyle:
          TextStyle(fontSize: 15, color: Colors.white),
          onPress: () {
            setState(() {
              type = MapType.satellite;
            });
            _animationController.reverse();
          },
        ),
        Bubble(
          title: "Map",
          iconColor: ColorsHelp.backgroundG,
          bubbleColor: ColorsHelp.background,
          icon: Icons.map_outlined,
          titleStyle:
          TextStyle(fontSize: 15, color: Colors.white),
          onPress: () {
            setState(() {
              type = MapType.normal;
            });
            _animationController.reverse();
          },
        ),
      ],

      // animation controller
      animation: _animation,

      // On pressed change animation state
      onPress: () =>
      _animationController.isCompleted
          ? _animationController.reverse()
          : _animationController.forward(),

      // Floating Action button Icon color
      iconColor: ColorsHelp.backgroundG,

      // Flaoting Action button Icon
      backGroundColor: ColorsHelp.background,
      animatedIconData: AnimatedIcons.menu_close,
    );
    floating.onPress.call();
    super.initState();
  }

  marker() async {
    final Uint8List markerIcon = await getBytesFromAsset('assets/me.png');
    setState(() async {
      markers.add(Marker(
        //add first marker
          markerId: MarkerId("1"),
          position: LatLng(30.12411, 31.24358),

          //position of marker
          infoWindow: InfoWindow(
            //popup info
            title: 'Shubra El Kheima ',
            snippet: 'Shark El Seka El Hadid, Shubra El Kheima',
          ),
          icon: await BitmapDescriptor.fromBytes(markerIcon)

        //Icon for Marker
      ));
      markers.add(Marker(
        //add second marker
          markerId: MarkerId("2"),
          position: LatLng(30.1139678256, 31.2492867704),
          //position of marker
          infoWindow: InfoWindow(
            //popup info
              title: ' كلية الزراعة',
              snippet:
              'كلية الزراعة شبرا الخيمة, Cairo, Cairo Governorate, Egypt'),
          icon: await BitmapDescriptor.fromBytes(markerIcon)
//Icon for Marker
      ));
      markers.add(Marker(
        //add third marker
          markerId: MarkerId("4"),
          position: LatLng(30.10408, 31.24562),
          //position of marker
          infoWindow: InfoWindow(
            //popup info
              title: 'El Mazalat',
              snippet: 'El Mazalat Bridge, Cairo'),
          icon: await BitmapDescriptor.fromBytes(markerIcon)));
      markers.add(Marker(
        //add third marker
          markerId: MarkerId("5"),
          position: LatLng(30.0999764249, 31.2462914808),
          //position of marker
          infoWindow: InfoWindow(
            //popup info
              title: 'khalafawy',
              snippet: 'Cairo, Egypt'),
          icon: await BitmapDescriptor.fromBytes(markerIcon)));
      markers.add(Marker(
        //add third marker
          markerId: MarkerId("6"),
          position: LatLng(30.0879592, 31.2455034),
          //position of marker
          infoWindow: InfoWindow(
            //popup info
            title: 'St. Teresa ',
            snippet: 'Sherif, As Sahel, Cairo Governorate, Egypt',
          ),
          icon: await BitmapDescriptor.fromBytes(markerIcon)));
      markers.add(Marker(
        //add third marker
          markerId: MarkerId("7"),
          position: LatLng(30.0805881, 31.2454069),
          //position of marker
          infoWindow: InfoWindow(
            //popup info
            title: 'Rod El-Farag',
            snippet: 'Al Barad, As Sahel, Cairo Governorate, Egypt',
          ),
          icon: await BitmapDescriptor.fromBytes(markerIcon)));
      markers.add(Marker(
        //add third marker
          markerId: MarkerId("8"),
          position: LatLng(30.07222, 31.2449),
          //position of marker
          infoWindow: InfoWindow(
            //popup info
            title: 'Massara',
            snippet: 'Municipality Subdivision: قسم روض الفرج',
          ),
          icon: await BitmapDescriptor.fromBytes(markerIcon)));
      markers.add(Marker(
        //add third marker
          markerId: MarkerId("9"),
          position: LatLng(30.0624923, 31.2495352),
          //position of marker
          infoWindow: InfoWindow(
            //popup info
            title: 'محطه مترو رمسيس',
            snippet: 'Cairo, Cairo Governorate, Egypt',
          ),
          icon: await BitmapDescriptor.fromBytes(markerIcon)));
      markers.add(Marker(
        //add third marker
          markerId: MarkerId("10"),
          position: LatLng(30.0528795029, 31.2484762936),
          //position of marker
          infoWindow: InfoWindow(
            //popup info
            title: 'محطة مترو العتبة',
            snippet: 'Al Gomhoreya St., Cairo, Cairo Governorate, Egypt',
          ),
          icon: await BitmapDescriptor.fromBytes(markerIcon)));
      markers.add(Marker(
        //add third marker
          markerId: MarkerId("11"),
          position: LatLng(30.0472253902, 31.2463804933),
          //position of marker
          infoWindow: InfoWindow(
            //popup info
            title: 'محطه مترو عابدين',
            snippet: 'محطه مترو محمد نجيب, Cairo, Egypt',
          ),
          icon: await BitmapDescriptor.fromBytes(markerIcon)));
      markers.add(Marker(
        //add third marker
          markerId: MarkerId("12"),
          position: LatLng(30.0361495, 31.2024855501),
          //position of marker
          infoWindow: InfoWindow(
            //popup info
            title: 'محطه مترو التحرير',
            snippet: 'القاهره شارع التحرير محطه مترو البحوث',
          ),
          icon: await BitmapDescriptor.fromBytes(markerIcon)));
      markers.add(Marker(
        //add third marker
          markerId: MarkerId("13"),
          position: LatLng(30.0571, 31.2387),
          //position of marker
          infoWindow: InfoWindow(
            //popup info
            title: 'محطه مترو الاوبرا',
            snippet: 'دار الأوبرا المصرية, Cairo, Cairo Governorate, Egypt',
          ),
          icon: await BitmapDescriptor.fromBytes(markerIcon)));
    });
  }

  @override
  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      marker();
    });
  }

  Future<Uint8List> getBytesFromAsset(String path) async {
    double pixelRatio = MediaQuery
        .of(context)
        .devicePixelRatio;
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: pixelRatio.round() * 30);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    FloatingActionBubble floating = FloatingActionBubble(
      // Menu items
      items: <Bubble>[
        // Floating action menu item
        Bubble(
          title: "Search Your Destination",
          iconColor: ColorsHelp.backgroundG,
          bubbleColor: ColorsHelp.background,
          icon: Icons.search,
          titleStyle:
          TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => MapLocation()));
            _animationController.reverse();
          },
        ),
        // Floating action menu item
        Bubble(
          title: "Nearest station to me",
          iconColor: ColorsHelp.backgroundG,
          bubbleColor: ColorsHelp.background,
          icon: Icons.near_me,
          titleStyle:
          TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            Navigator.push(context,  MaterialPageRoute(
                builder: (_) => MapLocation(GetNearStation:2,)));
            _animationController.reverse();
          },
        ),
        Bubble(
          title: "Get your location",
          iconColor: ColorsHelp.backgroundG,
          bubbleColor: ColorsHelp.background,
          icon: Icons.my_location,
          titleStyle:
          TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => MapLocation(GetLocation: 1,)));
            _animationController.reverse();
          },
        ),
        //Floating action menu item
        Bubble(
          title: " All Stations",
          iconColor: ColorsHelp.backgroundG,
          bubbleColor: ColorsHelp.background,
          icon: Icons.train,
          titleStyle:
          TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            setState(() {
              markers;
            });
            _animationController.reverse();
          },
        ),

        Bubble(
          title: "Satellite",
          iconColor: ColorsHelp.backgroundG,
          bubbleColor: ColorsHelp.background,
          icon: Icons.satellite_alt,
          titleStyle:
          TextStyle(fontSize: 15, color: Colors.white),
          onPress: () {
            setState(() {
              type = MapType.satellite;
            });
            _animationController.reverse();
          },
        ),
        Bubble(
          title: "Map",
          iconColor: ColorsHelp.backgroundG,
          bubbleColor: ColorsHelp.background,
          icon: Icons.map_outlined,
          titleStyle:
          TextStyle(fontSize: 15, color: Colors.white),
          onPress: () {
            setState(() {
              type = MapType.normal;
            });
            _animationController.reverse();
          },
        ),
      ],

      // animation controller
      animation: _animation,

      // On pressed change animation state
      onPress: () =>
      _animationController.isCompleted
          ? _animationController.reverse()
          : _animationController.forward(),

      // Floating Action button Icon color
      iconColor: ColorsHelp.backgroundG,

      // Flaoting Action button Icon
      backGroundColor: ColorsHelp.background,
      animatedIconData: AnimatedIcons.menu_close,
    );

    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
        bottomNavigationBar: BotoomBar(
          index: 2,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        backgroundColor: const Color(0xffffffff),
        body: SafeArea(
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
                            context,
                            MaterialPageRoute(builder: (_) => Profile()));
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
                      name,
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
                      'Good Morning ${name.split(' ')[0]} :)',
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
                panel: Stack(
                  children: [
                    GoogleMap(
                        markers: markers,
                        initialCameraPosition:
                        CameraPosition(target: center, zoom: 12),
                        //17 is new zoom level

                        myLocationEnabled: true,
                        myLocationButtonEnabled: false,
                        mapType: type,
                        zoomGesturesEnabled: true,
                        zoomControlsEnabled: false,
                        rotateGesturesEnabled: false,
                        polylines: polyline,
                        onMapCreated: onMapCreated),
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

                    Container(
                      margin: EdgeInsets.only(top: 80),
                      height: 190,
                      child: Container(
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
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 5),
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
                                        borderRadius: BorderRadius.circular(
                                            20)),
                                  ),
                                  Container(
                                    height: 5,
                                    width: 2,
                                    decoration: BoxDecoration(
                                        color: ColorsHelp.background,
                                        borderRadius: BorderRadius.circular(
                                            20)),
                                  ),
                                  Container(
                                    height: 5,
                                    width: 2,
                                    decoration: BoxDecoration(
                                        color: ColorsHelp.background,
                                        borderRadius: BorderRadius.circular(
                                            20)),
                                  ),
                                  Container(
                                    height: 5,
                                    width: 2,
                                    decoration: BoxDecoration(
                                        color: ColorsHelp.background,
                                        borderRadius: BorderRadius.circular(
                                            20)),
                                  ),
                                  Container(
                                    height: 5,
                                    width: 2,
                                    decoration: BoxDecoration(
                                        color: ColorsHelp.background,
                                        borderRadius: BorderRadius.circular(
                                            20)),
                                  ),
                                  Container(
                                    height: 5,
                                    width: 2,
                                    decoration: BoxDecoration(
                                        color: ColorsHelp.background,
                                        borderRadius: BorderRadius.circular(
                                            20)),
                                  ),
                                  Container(
                                    height: 5,
                                    width: 2,
                                    decoration: BoxDecoration(
                                        color: ColorsHelp.background,
                                        borderRadius: BorderRadius.circular(
                                            20)),
                                  ),
                                  Container(
                                    height: 5,
                                    width: 2,
                                    decoration: BoxDecoration(
                                        color: ColorsHelp.background,
                                        borderRadius: BorderRadius.circular(
                                            20)),
                                  ),
                                  Container(
                                    height: 5,
                                    width: 2,
                                    decoration: BoxDecoration(
                                        color: ColorsHelp.background,
                                        borderRadius: BorderRadius.circular(
                                            20)),
                                  ),
                                  Container(
                                    height: 5,
                                    width: 2,
                                    decoration: BoxDecoration(
                                        color: ColorsHelp.background,
                                        borderRadius: BorderRadius.circular(
                                            20)),
                                  ),
                                  Container(
                                    height: 5,
                                    width: 2,
                                    decoration: BoxDecoration(
                                        color: ColorsHelp.background,
                                        borderRadius: BorderRadius.circular(
                                            20)),
                                  ),
                                  Container(
                                    height: 5,
                                    width: 2,
                                    decoration: BoxDecoration(
                                        color: ColorsHelp.background,
                                        borderRadius: BorderRadius.circular(
                                            20)),
                                  ),
                                  Container(
                                    height: 5,
                                    width: 2,
                                    decoration: BoxDecoration(
                                        color: ColorsHelp.background,
                                        borderRadius: BorderRadius.circular(
                                            20)),
                                  ),
                                  Container(
                                    height: 5,
                                    width: 2,
                                    decoration: BoxDecoration(
                                        color: ColorsHelp.background,
                                        borderRadius: BorderRadius.circular(
                                            20)),
                                  ),
                                  Container(
                                    height: 5,
                                    width: 2,
                                    decoration: BoxDecoration(
                                        color: ColorsHelp.background,
                                        borderRadius: BorderRadius.circular(
                                            20)),
                                  ),
                                  Container(
                                    height: 5,
                                    width: 2,
                                    decoration: BoxDecoration(
                                        color: ColorsHelp.background,
                                        borderRadius: BorderRadius.circular(
                                            20)),
                                  ),
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                        color: ColorsHelp.background,
                                        borderRadius: BorderRadius.circular(
                                            20)),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                        style:
                                        TextStyle(color: ColorsHelp.background),
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
                                                      BorderRadius.circular(20),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            offset: Offset(
                                                                1, 4),
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
                                                                        (
                                                                        BuildContext
                                                                        context) {
                                                                      return Align(
                                                                          alignment:
                                                                          Alignment(
                                                                              0,
                                                                              0.4),
                                                                          child:
                                                                          Container(
                                                                            padding:
                                                                            EdgeInsets
                                                                                .only(
                                                                                left: 20),
                                                                            decoration: BoxDecoration(
                                                                                color: Colors
                                                                                    .white
                                                                                    .withOpacity(
                                                                                    0.8),
                                                                                borderRadius: BorderRadius
                                                                                    .only(
                                                                                  topRight: Radius
                                                                                      .circular(
                                                                                      130),
                                                                                  topLeft: Radius
                                                                                      .circular(
                                                                                      130),
                                                                                )),
                                                                            width:
                                                                            300,
                                                                            height:
                                                                            400,
                                                                            child: LineStation(
                                                                                Text1:
                                                                                "Helwan",
                                                                                Text2:
                                                                                "Ain Helwan",
                                                                                Text3:
                                                                                "Helwan University",
                                                                                Text4:
                                                                                "Wadi Hof",
                                                                                Text5:
                                                                                "Hadayek Helwan",
                                                                                Text6:
                                                                                "El_Maasara",
                                                                                Text7:
                                                                                "Tora El_Asmant",
                                                                                Text8:
                                                                                "Kozzika",
                                                                                Text9:
                                                                                "Tora El_Balad",
                                                                                Text10:
                                                                                "Sakanat El_maadi",
                                                                                Text11:
                                                                                "Maddi",
                                                                                Text12:
                                                                                "Hadayek El_Maadi",
                                                                                Text13:
                                                                                "Dar El_Salam"),
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
                                                                          fontSize: 10,
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
                                          animationType: DialogTransitionType
                                              .size,
                                          curve: Curves.fastOutSlowIn,
                                          duration: Duration(seconds: 1),
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      width: 100,
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.my_location,
                                          color: ColorsHelp.background,
                                        ))
                                  ],
                                ),
                                Container(
                                  width: 250,
                                  height: 3,
                                  color: ColorsHelp.background,
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      child: Text(
                                        "To Station",
                                        style:
                                        TextStyle(color: ColorsHelp.background),
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
                                                      BorderRadius.circular(20),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            offset: Offset(
                                                                1, 4),
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
                                                                        (
                                                                        BuildContext
                                                                        context) {
                                                                      return Align(
                                                                          alignment:
                                                                          Alignment(
                                                                              0,
                                                                              0.4),
                                                                          child:
                                                                          Container(
                                                                            padding:
                                                                            EdgeInsets
                                                                                .only(
                                                                                left: 20),
                                                                            decoration: BoxDecoration(
                                                                                color: Colors
                                                                                    .white
                                                                                    .withOpacity(
                                                                                    0.8),
                                                                                borderRadius: BorderRadius
                                                                                    .only(
                                                                                  topRight: Radius
                                                                                      .circular(
                                                                                      130),
                                                                                  topLeft: Radius
                                                                                      .circular(
                                                                                      130),
                                                                                )),
                                                                            width:
                                                                            300,
                                                                            height:
                                                                            400,
                                                                            child: LineStation(
                                                                                Text1:
                                                                                "Helwan",
                                                                                Text2:
                                                                                "Ain Helwan",
                                                                                Text3:
                                                                                "Helwan University",
                                                                                Text4:
                                                                                "Wadi Hof",
                                                                                Text5:
                                                                                "Hadayek Helwan",
                                                                                Text6:
                                                                                "El_Maasara",
                                                                                Text7:
                                                                                "Tora El_Asmant",
                                                                                Text8:
                                                                                "Kozzika",
                                                                                Text9:
                                                                                "Tora El_Balad",
                                                                                Text10:
                                                                                "Sakanat El_maadi",
                                                                                Text11:
                                                                                "Maddi",
                                                                                Text12:
                                                                                "Hadayek El_Maadi",
                                                                                Text13:
                                                                                "Dar El_Salam"),
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
                                                                          fontSize: 10,
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
                                          animationType: DialogTransitionType
                                              .size,
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
                        ),
                      ),
                    ),

                    // Show current location button

                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.1,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          decoration: BoxDecoration(
                              color: ColorsHelp.background,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        _pc.close();
                                      },
                                      icon: Icon(
                                        Icons.arrow_back_ios,
                                        color: ColorsHelp.backgroundG,
                                        size: 30,
                                      )),
                                  Text(
                                    "Booking Tickets",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 15),
                                child: GestureDetector(
                                  child: Person(
                                      high: 50,
                                      width: 50,
                                      color: Colors.white,
                                      color2: ColorsHelp.background,
                                      size: 40,
                                      reduis: 40),
                                ),
                              )
                            ],
                          )),
                    ),

                    Align(
                        alignment: Alignment(1, 0.3),
                        child: Container(
                          child: floating,
                        )),
                  ],
                ),
                collapsed: Column(
                  children: [
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 0, color: ColorsHelp.background),
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

  Future<void> getUser() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      uid = prefs.getString("uid") ?? "";
      email = prefs.getString("email") ?? "";
      name = prefs.getString("name") ?? "";
      phone = prefs.getString("phone") ?? "";
      tagID = prefs.getString("tagID") ?? "";
      nationalID = prefs.getString("nationalID") ?? "";

      //log("email: ${tagID}");
    });
    //return User(uid: "",email: email ,name: name, phone: phone, tagID: tagID, nationalID: nationalID);
  }
}
