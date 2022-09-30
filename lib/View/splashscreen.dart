import 'dart:async';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:covid_tracker/View/world_stats.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 4),
        () => Navigator.popAndPushNamed(context, WorldStats.screenName));
  }

  @override
  Widget build(BuildContext context) {
    // final medeiaQuery = MediaQuery.of(context).size;
    // var width = medeiaQuery.width;
    // var height = medeiaQuery.height;

    return Scaffold(
      body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            Flexible(
              flex: 5,
              child: AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, Widget? widget) {
                    return Transform.rotate(
                      angle: _controller.value * 2.0 * pi,
                      child: const Center(
                        child: Image(
                            image: AssetImage(r'assets/images/virus.png')),
                      ),
                    );
                  }),
            ),
            const Flexible(
                flex: 3,
                child: AutoSizeText(
                  'Covid-19\nTracker App',
                  style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ))
          ])),
    );
  }
}
