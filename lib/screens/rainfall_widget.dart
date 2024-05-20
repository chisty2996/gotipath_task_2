import 'package:flutter/material.dart';

import 'inf_card_widget.dart';

class RainfallWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InfoCard(
      iconData: Icons.water_drop_rounded,
      title: 'RAINFALL',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '1.8 mm ',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
          Text("in last hour",style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),)
        ],
      ),
    );
  }
}