import 'dart:ui' show Color;

const double opacity = 0.8,
    redMultiplier = 0.299,
    greenMultiplier = 0.587,
    blueMultiplier = 0.114,
    lightnessLimit = 0.5;

const Color darkColor = Color.fromRGBO(0, 0, 0, opacity), lightColor = Color.fromRGBO(255, 255, 255, opacity);
