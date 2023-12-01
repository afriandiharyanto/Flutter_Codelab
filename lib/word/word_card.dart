import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class WordCard extends StatelessWidget {
  const WordCard({super.key, required this.wordPair, required this.bgColor});

  final WordPair wordPair;
  final Color bgColor;

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
          "${wordPair.first} ${wordPair.second}",
          style: TextStyle(color: textColor, fontSize: 42.0),
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
