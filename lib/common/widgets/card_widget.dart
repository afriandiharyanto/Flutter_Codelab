import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:freezed_annotation/freezed_annotation.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.mainWord,
    required this.bgColor,
    @Default("") this.additionalWord,
    @Default(42.0) required this.fontSize,
  });

  final String mainWord;
  final String? additionalWord;
  final Color bgColor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    // Color bgColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt());
    var textColor = Colors.black.withOpacity(0.7);
    if (isDarkColor(bgColor)) {
      textColor = Colors.white;
    }

    return Card(
      color: bgColor.withOpacity(1.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          "$mainWord ${additionalWord ?? ""}",
          style: TextStyle(color: textColor, fontSize: fontSize),
        ),
      ),
    );
  }

  bool isDarkColor(Color color) {
    double red = color.red * 0.2126;
    double green = color.green * 0.7152;
    double blue = color.blue * 0.0722;
    double sum = (red * red) + (green * green) + (blue * blue);

    return math.sqrt(sum) < 130.0;
  }
}
