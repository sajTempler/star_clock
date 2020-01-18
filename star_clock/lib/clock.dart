import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:star_clock/digit.dart';

import 'package:intl/intl.dart';
import 'package:star_clock/utils/theme.dart';

class Clock extends StatefulWidget {
  const Clock({this.model, Key key}) : super(key: key);

  final ClockModel model;

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
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
  void didUpdateWidget(Clock oldWidget) {
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
      //   Duration(seconds: 3) - Duration(milliseconds: _dateTime.millisecond),
      //   _updateTime,
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    final hour =
        DateFormat(widget.model.is24HourFormat ? 'HH' : 'hh').format(_dateTime);
    final minute = DateFormat('mm').format(_dateTime);

    final hourFirstDigit = hour.toString()[0];
    final hourSecondDigit = hour.toString()[1];

    final minuteFirstDigit = minute.toString()[0];
    final minuteSecondDigit = minute.toString()[1];
    return Container(
      color: themeStore.getTheme()['background'],
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
