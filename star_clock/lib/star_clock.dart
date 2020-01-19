import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

import 'package:flutter_clock_helper/model.dart';
import 'package:star_clock/clock.dart';
import 'package:star_clock/utils/theme.dart';

final _lightTheme = {
  'background': Color(0xFFFFF8E1),
  'digitLine': Colors.black,
  "digitPoint": Colors.black,
};

final _darkTheme = {
  'background': Colors.black54,
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
  static const day = FlareActor(
    "assets/day.flr",
    fit: BoxFit.fill,
    animation: "Untitled",
  );

  static const night = FlareActor(
    "assets/stars.flr",
    fit: BoxFit.fill,
    animation: "stars",
  );

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    isLight
        ? themeStore.setTheme(_lightTheme)
        : themeStore.setTheme(_darkTheme);
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        isLight ? day : night,
        Clock(
          model: widget.model,
        )
      ],
    );
  }
}
