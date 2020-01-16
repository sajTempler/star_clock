import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:star_clock/utils/points_lists.dart';
import 'package:star_clock/utils/theme.dart';

class Digit extends StatefulWidget {
  final digit;

  Digit(this.digit);

  @override
  _DigitState createState() => _DigitState();
}

class _DigitState extends State<Digit> {
  Function _getPointsMethod(num number) {
    switch (number) {
      case 0:
        return zero;
      case 1:
        return one;
      case 2:
        return two;
      case 3:
        return three;
      case 4:
        return four;
      case 5:
        return five;
      case 6:
        return six;
      case 7:
        return seven;
      case 8:
        return eight;
      case 9:
        return nine;
      default:
        return zero;
    }
  }

  Map<String, dynamic> _getPointsCount(num number) {
    switch (number) {
      case 0:
        return pointsDescription['ZERO'];
      case 1:
        return pointsDescription['ONE'];
      case 2:
        return pointsDescription['TWO'];
      case 3:
        return pointsDescription['THREE'];
      case 4:
        return pointsDescription['FOUR'];
      case 5:
        return pointsDescription['FIVE'];
      case 6:
        return pointsDescription['SIX'];
      case 7:
        return pointsDescription['SEVEN'];
      case 8:
        return pointsDescription['EIGHT'];
      case 9:
        return pointsDescription['NINE'];
      default:
        return pointsDescription['ZERO']; // should be longest
    }
  }

  @override
  void didUpdateWidget(Digit oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.digit != oldWidget.digit) {
      _updateDigit();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _updateDigit() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 6.5,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: DigitDrawer(
          pointsGetter: _getPointsMethod(widget.digit),
          pointDetails: _getPointsCount(widget.digit),
        ),
      ),
    );
  }
}

class DigitDrawer extends StatefulWidget {
  final Function pointsGetter;
  final Map<String, dynamic> pointDetails;

  const DigitDrawer({
    this.pointsGetter,
    this.pointDetails,
  });

  @override
  _DigitDrawerState createState() => _DigitDrawerState();
}

class _DigitDrawerState extends State<DigitDrawer>
    with SingleTickerProviderStateMixin {
  @override
  void didUpdateWidget(DigitDrawer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.pointsGetter != oldWidget.pointsGetter) {
      _updateDigit();
    }
  }

  void _updateDigit() {
    setState(() {
      _params = generateParameteres(widget.pointDetails['count']);
    });
  }

  AnimationController animationController;
  Animation<double> animation;

  double _fraction = 1.0;
  bool _forward = true;

  List _params = [];

  List generateParameteres(num length) {
    List result = [];

    for (num i = 0; i < length; i++) {
      result.add({
        'dx': Random().nextInt(25),
        'dy': Random().nextInt(25),
        'xAxis': Random().nextBool(),
        'yAxis': Random().nextBool(),
      });
    }

    return result;
  }

  @override
  void initState() {
    super.initState();
    _params = generateParameteres(widget.pointDetails['count']);

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..forward();

    animation = Tween(begin: 0.0, end: 1.0).animate(animationController)
      ..addListener(() {
        setState(() {
          _fraction = animation.value;
        });

        if (animation.status == AnimationStatus.completed) {
          if (_forward) {
            // animate back
            animationController.animateTo(0);
            _forward = false;
          } else {
            setState(() {
              _params = generateParameteres(widget.pointDetails['count']);
            });
            animationController.animateTo(1);
            _forward = true;
          }
        }
      });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) => CustomPaint(
        painter: DigitPainter(
          pointsGetter: widget.pointsGetter,
          params: _params,
          pointDetails: widget.pointDetails,
          fraction: _fraction,
        ),
      ),
    );
  }
}

class DigitPainter extends CustomPainter {
  Function pointsGetter;
  final fraction;
  final List params;
  final Map<String, dynamic> pointDetails;

  List<Offset> _startingPoints;

  DigitPainter({
    this.pointsGetter,
    this.fraction,
    this.params,
    this.pointDetails,
  }) : assert(
          pointsGetter != null,
          fraction != null,
        );

  @override
  void paint(Canvas canvas, Size size) {
    List<Offset> _points;

    final linePaint = Paint();
    final pointPaint = Paint();

    final theme = themeStore.getTheme();

    pointPaint
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 7
      ..color = theme['digitPoint'] ?? Colors.red;

    linePaint
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = theme['digitLine'] ?? Colors.red;

    if (_startingPoints == null) {
      _startingPoints = pointsGetter(size);
      _points = _startingPoints;
    }

    _points = _startingPoints;

    for (int i = 0; i < _points.length - 1; i++) {
      Offset inputPoint = _points[i];
      Offset outputPoint = Offset(
        inputPoint.dx +
            (params[i]['dx'] * fraction * (params[i]['xAxis'] ? 1 : -1)),
        inputPoint.dy +
            (params[i]['dy'] * fraction * (params[i]['yAxis'] ? 1 : -1)),
      );

      _points[i] = outputPoint;
    }

    for (int i = 0; i < _points.length; i++) {
      if (i + 1 < _points.length) {
        canvas.drawLine(_points[i], _points[i + 1], linePaint);
      }

      if (i == _points.length - 1 && pointDetails['close']) {
        canvas.drawLine(
          _points[i],
          _points[pointDetails['closeAt']],
          linePaint,
        );
      }
    }

    canvas.drawPoints(PointMode.points, _points, pointPaint);
  }

  @override
  bool shouldRepaint(DigitPainter old) {
    return fraction != old.fraction && old._startingPoints == _startingPoints;
  }
}
