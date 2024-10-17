import 'package:flutter/material.dart';

BoxDecoration gradientBackground() {
  return const BoxDecoration(
    gradient: RadialGradient(
      colors: [
        Color(0xff2d9510),
        Color(0xff65c34b),
        Color(0xff5900ad),
      ],
      radius: 1.2,
      center: Alignment(0.0, 0.0),
      focal: Alignment(0.0, 0.0),
      focalRadius: 0.2,
    ),
  );
}
