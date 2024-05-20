import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HourlyForecast extends StatelessWidget {
  final ScrollController scrollController;

  HourlyForecast({required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      itemCount: 24,
      itemBuilder: (context, index) {
        return Container(
          width: 70,
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.deepPurple[600]?.withOpacity(0.2),
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: Colors.white)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$index:00',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 5),
              Icon(Icons.cloud, color: Colors.white),
              SizedBox(height: 5),
              const Text(
                '25°C',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        );
      },
    );
  }
}


class WeeklyForecast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Weekly Forecast Content'),
    );
  }
}
