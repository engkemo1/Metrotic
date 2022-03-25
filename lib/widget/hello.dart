import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'botom Bar.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile>with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;
  bool upDown = true;

  @override
  void initState() {
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 180),

      vsync: this,
    );

    _animation = new CurvedAnimation(
      parent: _controller!,
      curve: new Interval(0.0, 1.0, curve: Curves.linear),
    );
  }
  @override
  Widget build(BuildContext context) {
    final ui.Size logicalSize = MediaQuery.of(context).size;
    final double _width = logicalSize.width;
    final double _height = logicalSize.height;

    void _up(){
      setState((){
        if(upDown) {
          upDown = false;
          _controller?.forward(from: 0.0);
        } else {
          upDown = true;
          _controller?.reverse(from: 1.0);
        }
      });
    }
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: BotoomBar(index: 3,),
      body: SafeArea(
          child: Container()
    ));
  }
}