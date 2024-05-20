import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotipath_task/screens/rainfall_widget.dart';
import 'package:gotipath_task/screens/sunrise_widget.dart';
import 'package:gotipath_task/screens/uv_index_widget.dart';
import 'package:gotipath_task/screens/wind_widget.dart';

import 'air_quality_widget.dart';
import 'hourly_forecast.dart';

class ExpandableBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.5,
      maxChildSize: 0.8,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.deepPurple[700]?.withOpacity(0.6),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              Container(
                height: 4,
                width: 40,
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              // Tab Bar and Tab View wrapped in DefaultTabController
              DefaultTabController(
                length: 2,
                child: Expanded(
                  child: Column(
                    children: [
                       const TabBar(
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.white,

                        indicatorColor: Colors.white,
                        tabs: [
                          Tab(text: 'Hourly Forecast',),
                          Tab(text: 'Weekly Forecast'),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            // Hourly Forecast
                            HourlyForecast(scrollController: scrollController),
                            // Weekly Forecast
                            WeeklyForecast(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Scrollable content
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: EdgeInsets.all(16),
                  children: [
                    AirQualityWidget(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        UVIndexWidget(),
                        SunriseWidget(),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        WindWidget(),
                        RainfallWidget(),
                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}