import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:math' as math;

class SizeAnimation extends StatefulWidget {
  final Widget child;

  SizeAnimation({this.child});

  @override
  State<StatefulWidget> createState() {
    return SizeAnimationState();
  }
}

class SizeAnimationState extends State<SizeAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _widthAnimation;
  Animation<double> _heightAnimation;
  StreamController<bool> isOpenedStreamController;
  Stream<bool> isOpenedStream;
  StreamSink<bool> isOpenedSink;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(
        milliseconds: 300,
      ),
      vsync: this,
    );

    isOpenedStreamController = PublishSubject<bool>();
    isOpenedStream = isOpenedStreamController.stream;
    isOpenedSink = isOpenedStreamController.sink;

    _widthAnimation = Tween<double>(begin: .65, end: 1.0).animate(
      CurvedAnimation(curve: Curves.easeInOut, parent: _animationController),
    );

    _heightAnimation = Tween<double>(begin: 50, end: 400).animate(
      CurvedAnimation(curve: Curves.easeInOut, parent: _animationController),
    );
    _animationController.addListener(() {
      this.setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    isOpenedStreamController.close();
    isOpenedSink.close();
    super.dispose();
  }

  void onPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        onPressed();
        print('object');
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedBuilder(
          animation: _widthAnimation,
          child: Container(
            alignment: Alignment.center,
            child: widget.child,
          ),
          builder: (context, child) {
            return Transform.scale(
              scale: _widthAnimation.value,
              child: child,
            );
          },
        ),
      ),
    );
  }
}
