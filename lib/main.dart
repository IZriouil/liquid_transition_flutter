import 'package:flutter/material.dart';
import 'package:liquid_transition_flutter/liquid/animated_mountain_painter.dart';
import 'package:liquid_transition_flutter/liquid/liquid_app.dart';

import 'layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        showPerformanceOverlay: true,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          accentColor: Colors.yellow,
        ),
        home: Scaffold(backgroundColor: Colors.black, body: const LiquidApplication()
            // Container(
            //     color: Colors.black,
            //     height: double.infinity,
            //     padding: const EdgeInsets.all(8.0),
            //     width: double.infinity,
            //     child: const AnimatedMountainPainter()),
            ));
  }
}
