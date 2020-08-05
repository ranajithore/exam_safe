import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: Loading(indicator: BallPulseIndicator(), size: 100.0,color: Colors.amber[400]),
        ),
      );
  }
}