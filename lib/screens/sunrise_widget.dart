import 'package:flutter/material.dart';

import 'inf_card_widget.dart';

class SunriseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InfoCard(
      iconData: Icons.sunny_snowing,
      title: 'SUNRISE',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '5:28 AM',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          CustomPaint(
            size: Size(100, 40),
            painter: SunriseCurvePainter(),
          ),
          SizedBox(height: 8),
          Text(
            'Sunset: 7:25 PM',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}

class SunriseCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(size.width / 2, 0, size.width, size.height);

    // Draw the curve
    canvas.drawPath(path, paint);

    // Find the intersection point (for simplicity, assume it is at 1/3 of the width)
    final intersectionPointX = size.width / 3;
    final intersectionPointY = size.height - (size.height / 3);
    final intersectionPoint = Offset(intersectionPointX, intersectionPointY);

    // Draw the horizontal intersecting line
    final linePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawLine(
      Offset(0, intersectionPointY),
      Offset(size.width, intersectionPointY),
      linePaint,
    );

    // Draw the circle at the intersection point
    final circlePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(intersectionPoint, 4, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}