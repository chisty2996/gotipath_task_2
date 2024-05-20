import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'hourly_forecast.dart';

class TabBarContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: <Widget>[
          TabBar(
            tabs: [
              Tab(text: 'Hourly Forecast'),
              Tab(text: 'Weekly Forecast'),
            ],
          ),
        ],
      ),
    );
  }
}

class TabBarViewContainer extends StatelessWidget {
  final ScrollController scrollController;

  TabBarViewContainer({required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: TabBarView(
        children: [
          // Hourly Forecast
          HourlyForecast(scrollController: scrollController),
          // Weekly Forecast
          WeeklyForecast(),
        ],
      ),
    );
  }
}
