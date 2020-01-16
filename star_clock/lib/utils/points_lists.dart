import 'package:flutter/material.dart';

Map<String, Map<String, dynamic>> pointsDescription = {
  'ZERO': {
    'count': 6, // number of points needed to draw given digit
    'close': true, // indicates if digit should have cloased path
    'closeAt': 0, // closing index
  },
  'ONE': {
    'count': 3,
    'close': false,
  },
  'TWO': {
    'count': 5,
    'close': false,
  },
  'THREE': {
    'count': 7,
    'close': false,
  },
  'FOUR': {
    'count': 4,
    'close': true,
    'closeAt': 1,
  },
  'FIVE': {
    'count': 7,
    'close': false,
  },
  'SIX': {
    'count': 7,
    'close': true,
    'closeAt': 3,
  },
  'SEVEN': {
    'count': 4,
    'close': false,
  },
  'EIGHT': {
    'count': 6,
    'close': true,
    'closeAt': 0,
  },
  'NINE': {
    'count': 7,
    'close': true,
    'closeAt': 3,
  },
};

List<Offset> zero(Size size) {
  // Offset pointZeroZero = Offset(0, 0);
  // X  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0

  // 0  X  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  final Offset p1 = Offset(size.width / 2, 0);

  // 0  0  0
  // 0  0  X
  // 0  0  0
  // 0  0  0
  // 0  0  0
  final Offset p2 = Offset(size.width, size.height * 1 / 5);

  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  X
  // 0  0  0
  final Offset p3 = Offset(size.width, size.height * 4 / 5);

  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  X  0
  final Offset p4 = Offset(size.width / 2, size.height);

  // 0  0  0
  // 0  0  0
  // 0  0  0
  // X  0  0
  // 0  0  0
  final Offset p5 = Offset(0, size.height * 4 / 5);

  // 0  0  0
  // X  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  final Offset p6 = Offset(0, size.height * 1 / 5);

  // goal shape
  // 0  X  0
  // X  0  X
  // 0  0  0
  // X  0  X
  // 0  X  0
  return [p1, p2, p3, p4, p5, p6];
}

List<Offset> one(Size size) {
  // Offset pointZeroZero = Offset(0, 0);
  // X  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0

  // 0  0  0
  // 0  0  0
  // X  0  0
  // 0  0  0
  // 0  0  0
  final Offset p1 = Offset(0, size.height / 2);

  // 0  X  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  final Offset p2 = Offset(size.width / 2, 0);

  // 0  0  0
  // 0  0  0
  // 0  X  0
  // 0  0  0
  // 0  0  0
  // final Offset p3 = Offset(size.width / 2, size.height / 2);

  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  X  0
  final Offset p3 = Offset(size.width / 2, size.height);

  // goal shape
  // 0  X  0
  // 0  0  0
  // X  X  0
  // 0  0  0
  // 0  X  0
  return [p1, p2, p3];
}

List<Offset> two(Size size) {
  // 0  0  0
  // X  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  final Offset p1 = Offset(0, size.height * 1 / 5);

  // 0  X  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  final Offset p2 = Offset(size.width / 2, 0);

  // 0  0  0
  // 0  0  X
  // 0  0  0
  // 0  0  0
  // 0  0  0
  final Offset p3 = Offset(size.width, size.height * 1 / 5);

  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  // X  0  0
  final Offset p4 = Offset(0, size.height);

  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  X
  final Offset p5 = Offset(size.width, size.height);

  // goal shape
  // 0  X  0
  // X  0  X
  // 0  0  0
  // 0  0  0
  // X  0  X
  return [p1, p2, p3, p4, p5];
}

List<Offset> three(Size size) {
  // 0  0  0
  // X  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  final Offset p1 = Offset(0, size.height * 1 / 5);

  // 0  X  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  final Offset p2 = Offset(size.width / 2, 0);

  // 0  0  0
  // 0  0  X
  // 0  0  0
  // 0  0  0
  // 0  0  0
  final Offset p3 = Offset(size.width, size.height * 1 / 5);

  // 0  0  0
  // 0  0  0
  // 0  X  0
  // 0  0  0
  // 0  0  0
  final Offset p4 = Offset(size.width / 2, size.height / 2);

  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  X
  // 0  0  0
  final Offset p5 = Offset(size.width, size.height * 4 / 5);

  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  X  0
  final Offset p6 = Offset(size.width / 2, size.height);

  // 0  0  0
  // 0  0  0
  // 0  0  0
  // X  0  0
  // 0  0  0
  final Offset p7 = Offset(0, size.height * 4 / 5);

  // goal shape
  // 0  X  0
  // X  0  X
  // 0  X  0
  // X  0  X
  // 0  X  0
  return [p1, p2, p3, p4, p5, p6, p7];
}

List<Offset> four(Size size) {
  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  X
  final Offset p1 = Offset(size.width, size.height);

  // 0  0  0
  // 0  0  0
  // 0  0  X
  // 0  0  0
  // 0  0  0
  final Offset p2 = Offset(size.width, size.height / 2);

  // 0  0  X
  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  final Offset p3 = Offset(size.width, 0);

  // 0  0  0
  // 0  0  0
  // X  0  0
  // 0  0  0
  // 0  0  0
  final Offset p4 = Offset(0, size.height / 2);

  // goal shape
  // 0  0  X
  // 0  0  0
  // X  0  X
  // 0  0  0
  // 0  0  X
  return [p1, p2, p3, p4];
}

List<Offset> five(Size size) {
  // 0  0  X
  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  final Offset p1 = Offset(size.width, 0);

  // X  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  final Offset p2 = Offset(0, 0);

  // 0  0  0
  // 0  0  0
  // X  0  0
  // 0  0  0
  // 0  0  0
  final Offset p3 = Offset(0, size.height * 2 / 5);

  // 0  0  0
  // 0  0  0
  // 0  X  0
  // 0  0  0
  // 0  0  0
  final Offset p4 = Offset(size.width / 2, size.height / 2);

  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  X
  // 0  0  0
  final Offset p5 = Offset(size.width, size.height * 4 / 5);

  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  X  0
  final Offset p6 = Offset(size.width / 2, size.height);

  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  // X  0  0
  final Offset p7 = Offset(0, size.height);

  // goal shape
  // 0  X  X
  // X  0  0
  // X  X  0
  // 0  0  X
  // X  X  0
  return [p1, p2, p3, p4, p5, p6, p7];
}

List<Offset> six(Size size) {
  // 0  0  0
  // 0  0  X
  // 0  0  0
  // 0  0  0
  // 0  0  0
  final Offset p1 = Offset(size.width, size.height * 1 / 5);

  // 0  X  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  final Offset p2 = Offset(size.width / 2, 0);

  // 0  0  0
  // X  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  final Offset p3 = Offset(0, size.height * 1 / 5);

  // 0  0  0
  // 0  0  0
  // 0  0  0
  // X  0  0
  // 0  0  0
  final Offset p4 = Offset(0, size.height * 4 / 5);

  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  X  0
  final Offset p5 = Offset(size.width / 2, size.height);

  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  X
  // 0  0  0
  final Offset p6 = Offset(size.width, size.height * 4 / 5);

  // 0  0  0
  // 0  0  0
  // 0  X  0
  // 0  0  0
  // 0  0  0
  final Offset p7 = Offset(size.width / 2, size.height / 2);

  // goal shape
  // 0  X  0
  // X  0  X
  // 0  X  0
  // X  0  X
  // 0  X  0
  return [p1, p2, p3, p4, p5, p6, p7];
}

List<Offset> seven(Size size) {
  // 0  0  0
  // X  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  final Offset p1 = Offset(0, size.height * 1 / 5);

  // X  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  final Offset p2 = Offset(0, 0);

  // 0  0  X
  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  final Offset p3 = Offset(size.width, 0);

  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  X  0
  final Offset p4 = Offset(size.width / 2, size.height);

  // goal shape
  // X  0  X
  // X  0  0
  // 0  0  0
  // 0  0  0
  // 0  X  0
  return [p1, p2, p3, p4];
}

List<Offset> eight(Size size) {
  // todo try adding moving point to the middle

  // 0  0  0
  // 0  0  X
  // 0  0  0
  // 0  0  0
  // 0  0  0
  final Offset p1 = Offset(size.width, size.height * 1 / 5);

  // 0  X  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  final Offset p2 = Offset(size.width / 2, 0);

  // 0  0  0
  // X  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  final Offset p3 = Offset(0, size.height * 1 / 5);

  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  X
  // 0  0  0
  final Offset p4 = Offset(size.width, size.height * 4 / 5);

  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  X  0
  final Offset p5 = Offset(size.width / 2, size.height);

  // 0  0  0
  // 0  0  0
  // 0  0  0
  // X  0  0
  // 0  0  0
  final Offset p6 = Offset(0, size.height * 4 / 5);

  // goal shape
  // 0  X  0
  // X  0  X
  // 0  X  0
  // X  0  X
  // 0  X  0
  return [p1, p2, p3, p4, p5, p6];
}

List<Offset> nine(Size size) {
  // 0  0  0
  // 0  0  0
  // 0  0  0
  // X  0  0
  // 0  0  0
  final Offset p1 = Offset(0, size.height * 4 / 5);

  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  X  0
  final Offset p2 = Offset(size.width / 2, size.height);

  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  X
  // 0  0  0
  final Offset p3 = Offset(size.width, size.height * 4 / 5);

  // 0  0  0
  // 0  0  X
  // 0  0  0
  // 0  0  0
  // 0  0  0
  final Offset p4 = Offset(size.width, size.height * 1 / 5);

  // 0  X  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  final Offset p5 = Offset(size.width / 2, 0);

  // 0  0  0
  // X  0  0
  // 0  0  0
  // 0  0  0
  // 0  0  0
  final Offset p6 = Offset(0, size.height * 1 / 5);

  // 0  0  0
  // 0  0  0
  // 0  X  0
  // 0  0  0
  // 0  0  0
  final Offset p7 = Offset(size.width / 2, size.height / 2);

  // goal shape
  // 0  X  0
  // X  0  X
  // 0  X  0
  // X  0  X
  // 0  X  0
  return [p1, p2, p3, p4, p5, p6, p7];
}
