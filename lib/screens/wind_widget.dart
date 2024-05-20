import 'package:flutter/material.dart';

import 'inf_card_widget.dart';

class WindWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InfoCard(
      iconData: Icons.air_outlined,
      title: 'WIND',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: Size(100, 100), // Adjust the size as needed
                painter: CompassPainter(),
              ),
              Text(
                '9.72 \nkm/h',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CompassPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Draw the circle
    canvas.drawCircle(center, radius, paint);

    // Draw the compass lines
    final directions = ['N', 'E', 'S', 'W'];
    final offsets = [
      Offset(center.dx, center.dy - radius), // North
      Offset(center.dx + radius, center.dy), // East
      Offset(center.dx, center.dy + radius), // South
      Offset(center.dx - radius, center.dy), // West
    ];

    final textStyle = TextStyle(color: Colors.white, fontSize: 16);
    for (int i = 0; i < 4; i++) {
      // Draw the direction text
      final textPainter = TextPainter(
        text: TextSpan(text: directions[i], style: textStyle),
        textDirection: TextDirection.ltr,
      )..layout();
      textPainter.paint(
        canvas,
        offsets[i] - Offset(textPainter.width / 2, textPainter.height / 2),
      );
    }

    // Draw the lines from the center
    // for (final offset in offsets) {
    //   canvas.drawLine(center, offset, paint);
    // }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

