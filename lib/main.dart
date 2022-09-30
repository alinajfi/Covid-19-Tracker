import 'package:covid_tracker/View/splashscreen.dart';
import 'package:covid_tracker/View/world_stats.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        WorldStats.screenName: (context) {
          return const WorldStats();
        }
      },
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
