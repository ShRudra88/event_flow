import 'package:flutter/material.dart';

BoxDecoration gradientBackground() {
  return const BoxDecoration(
    gradient: RadialGradient(
      colors: [
        Color(0xFFcb6ce6),
        Color(0xFF6a4bc3),
        Color(0xFF004aad),
      ],
      radius: 1.2,
      center: Alignment(0.0, 0.0),
      focal: Alignment(0.0, 0.0),
      focalRadius: 0.2,
    ),
  );
}
