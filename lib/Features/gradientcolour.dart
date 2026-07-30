import 'dart:math';

import 'package:flutter/services.dart';

final List<Color> GradientColors = [
  const Color(0xFFFF416C),
  const Color(0xFFFF4B2B),
  const Color(0xFF0052D4),
  const Color(0xFF4364F7),
  const Color(0xFF00B4DB),
  const Color(0xFF0083B0),
  const Color(0xFF11998E),
  const Color(0xFF38EF7D),
  const Color(0xFF8A2387),
  const Color(0xFFE94057),
];
Random random = Random();

List<Color> getcolor() {
  var x=random.nextInt(10);
  var y=random.nextInt(10);
  return [GradientColors[x],GradientColors[y]];
}
