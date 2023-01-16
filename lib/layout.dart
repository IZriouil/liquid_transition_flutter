import 'package:flutter/material.dart';
import 'package:liquid_transition_flutter/liquid/animated_mountain_painter.dart';

class LiquidTransitionWidget extends StatefulWidget {
  const LiquidTransitionWidget({super.key});

  @override
  State<LiquidTransitionWidget> createState() => _LiquidTransitionWidgetState();
}

class _LiquidTransitionWidgetState extends State<LiquidTransitionWidget> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 200,
                clipBehavior: Clip.none,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFefdaa1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                    child: Text(
                  "Invite Friends",
                  style: Theme.of(context).textTheme.headlineSmall,
                )),
              ),
              Container(
                width: 80,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Expanded(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "Friends Nearby",
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: 3,
                        clipBehavior: Clip.none,
                        itemBuilder: ((context, index) {
                          return Container(
                            clipBehavior: Clip.none,
                            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xFF181718),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                const CircleAvatar(),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Issam Zriouil",
                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ],
                            ),
                          );
                        })),
                  ),
                ],
              )),
            ],
          ),
          Column(children: [
            SizedBox(
              height: 310,
            ),
            Stack(
              children: [
                Container(
                  height: 80,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: AnimatedMountainPainter(),
                ),
              ],
            ),
          ])
        ],
      ),
    );
  }
}
