import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BatteryLevelWidget extends StatelessWidget {
  double batteryLevel;
  final double frameWidth;
  final double frameHeight;

  BatteryLevelWidget({
    Key? key,
    required this.batteryLevel,
    required this.frameWidth,
    required this.frameHeight,
  }) : super(key: key);
  void setLevel(double lvl) {
    batteryLevel = lvl;
    if (lvl > 1) {
      batteryLevel = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Battery frame image
        SizedBox(
          width: frameWidth,
          height: frameHeight,
          child: Image.asset(
            'assets/images/empty-battery.png',
            fit: BoxFit.fill,
          ),
        ),

        //Rectangle for battery level
        Positioned(
          left: 3,
          child: Container(
            margin: const EdgeInsets.only(top: 5),
            width: (frameWidth - 10) * batteryLevel,
            height: frameHeight - 10,
            color: (batteryLevel > 0.75)
                ? Colors.green
                : (batteryLevel > 0.40)
                    ? Colors.orange
                    : Colors.red,
          ),
        ),
      ],
    );
  }
}
