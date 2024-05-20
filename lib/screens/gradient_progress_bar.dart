import 'package:flutter/material.dart';

class GradientProgressBar extends StatelessWidget {
  final double value;
  final List<Color> colors;

  GradientProgressBar({required this.value, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 10,
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        Container(
          height: 10,
          width: MediaQuery.of(context).size.width * value,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: colors),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ],
    );
  }
}