import 'package:flutter/material.dart';
import 'package:star_clock/digit.dart';

import 'package:flutter_clock_helper/model.dart';
import 'package:star_clock/utils/theme.dart';

import 'dart:async';
import 'package:intl/intl.dart';

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
  DateTime _dateTime = DateTime.now();
  Timer _timer;

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateTime();
    _updateModel();
  }

  @override
  void didUpdateWidget(StarClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    widget.model.dispose();
    super.dispose();
  }

  void _updateModel() {
    setState(() {});
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();
      // Update once per minute. If you want to update every second, use the
      // following code.
      _timer = Timer(
        Duration(minutes: 1) -
            Duration(seconds: _dateTime.second) -
            Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
      // Update once per second, but make sure to do it at the beginning of each
      // new second, so that the clock is accurate.
      // _timer = Timer(
      //   Duration(seconds: 1) - Duration(milliseconds: _dateTime.millisecond),
      //   _updateTime,
      // );
    });
  }

  // static ImageProvider bg =
  //     AssetImage('assets/jeremy-perkins-unsplash-min.jpg');
  // static ImageProvider bg = AssetImage('assets/max-mckinnon-unsplash.jpg');
  @override
  Widget build(BuildContext context) {
    final hour =
        DateFormat(widget.model.is24HourFormat ? 'HH' : 'hh').format(_dateTime);
    final minute = DateFormat('mm').format(_dateTime);

    final hourFirstDigit = hour.toString()[0];
    final hourSecondDigit = hour.toString()[1];

    final minuteFirstDigit = minute.toString()[0];
    final minuteSecondDigit = minute.toString()[1];

    Theme.of(context).brightness == Brightness.light
        ? themeStore.setTheme(_lightTheme)
        : themeStore.setTheme(_darkTheme);
    return Container(
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: bg,
      //     fit: BoxFit.cover,
      //   ),
      // ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Digit(int.parse(hourFirstDigit)),
              Digit(int.parse(hourSecondDigit)),
              SizedBox(
                width: 50,
                height: MediaQuery.of(context).size.height,
              ),
              Digit(int.parse(minuteFirstDigit)),
              Digit(int.parse(minuteSecondDigit)),
            ],
          ),
        ),
      ),
    );
  }
}
