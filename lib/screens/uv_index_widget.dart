import 'package:flutter/material.dart';

import 'gradient_progress_bar.dart';
import 'inf_card_widget.dart';

class UVIndexWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InfoCard(
      iconData: Icons.sunny,
      title: 'UV INDEX',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '4',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          Text(
            'Moderate',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          GradientProgressBar(
            value: 0.4,
            colors: [Colors.green, Colors.yellow, Colors.orange],
          ),
        ],
      ),
    );
  }
}