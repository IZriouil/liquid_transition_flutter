import 'package:flutter/material.dart';
import 'package:liquid_transition_flutter/liquid/liquid_painter.widget.dart';

class TrashWidget extends StatefulWidget {
  const TrashWidget({super.key});

  @override
  State<TrashWidget> createState() => _TrashWidgetState();
}

class _TrashWidgetState extends State<TrashWidget> {
  bool _isOpen = false;
  bool _detaching = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          print("Opening");

          _isOpen = !_isOpen;
        });
      },
      child: Container(
        color: Colors.blue,
        width: 200,
        child: IntrinsicHeight(
          child: Column(children: [
            const Text("Hello"),
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              height: _isOpen ? 100 : 0,
              width: double.infinity,
              color: Colors.redAccent[100],
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: _detaching ? 0 : 100,
                child: CustomPaint(
                  painter: LiquidPainter(),
                ),
              ),
            ),
            const Text("Hello"),
          ]),
        ),
      ),
    );
  }
}
