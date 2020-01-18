import 'package:flutter/material.dart';

import 'package:flutter_clock_helper/model.dart';
import 'package:star_clock/clock.dart';
import 'package:star_clock/utils/theme.dart';

final _lightTheme = {
  'background': Colors.white,
  'digitLine': Colors.black,
  "digitPoint": Colors.black,
};

final _darkTheme = {
  'background': Colors.black,
  'digitLine': Colors.white70,
  'digitPoint': Colors.white,
};

class StarClock extends StatefulWidget {
  const StarClock(this.model);

  final ClockModel model;

  @override
  _StarClockState createState() => _StarClockState();
}

class _StarClockState extends State<StarClock> {
  // static const ImageProvider imgProvider =
  //     AssetImage('assets/jeremy-perkins-unsplash-min.jpg');

  // static const img = Image(
  //   image: imgProvider,
  //   fit: BoxFit.fitWidth,
  // );

  @override
  Widget build(BuildContext context) {
    Theme.of(context).brightness == Brightness.light
        ? themeStore.setTheme(_lightTheme)
        : themeStore.setTheme(_darkTheme);
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        // img,
        Clock(
          model: widget.model,
        )
      ],
    );
  }
}
