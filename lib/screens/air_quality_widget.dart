import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotipath_task/screens/gradient_progress_bar.dart';
import 'package:gotipath_task/screens/weather_list_screen.dart';

import 'inf_card_widget.dart';

class AirQualityWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InfoCard(
      iconData: Icons.ac_unit,
      title: 'AIR QUALITY',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '3-Low Health Risk',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),

          GradientProgressBar(
            value: 0.3,
            colors: [Colors.green, Colors.yellow, Colors.red],
          ),
          const SizedBox(height: 16,),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => WeatherList()));
            },
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('See more', style: TextStyle(color: Colors.white, fontSize: 16)),
                Icon(Icons.arrow_forward_ios, color: Colors.grey),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
