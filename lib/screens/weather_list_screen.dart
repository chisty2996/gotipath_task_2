import 'package:flutter/material.dart';


class WeatherList extends StatefulWidget {
  @override
  State<WeatherList> createState() => _WeatherListState();
}

class _WeatherListState extends State<WeatherList> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Weather", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      backgroundColor:  Colors.deepPurpleAccent.withOpacity(0.6),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey[600]),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16.0),
              children: [
                WeatherWidget(
                  temperature: '19°',
                  highLow: 'H:24°  L:18°',
                  location: 'Bengaluru, India',
                  weatherIcon: Icons.cloud,
                  condition: 'Mid Rain',
                ),
                SizedBox(height: 16),
                WeatherWidget(
                  temperature: '22°',
                  highLow: 'H:26°  L:18°',
                  location: 'Chennai, India',
                  weatherIcon: Icons.cloud,
                  condition: 'Fast Wind',
                ),
                SizedBox(height: 16),
                WeatherWidget(
                  temperature: '29°',
                  highLow: 'H:33°  L:27°',
                  location: 'Delhi, India',
                  weatherIcon: Icons.cloud,
                  condition: 'Cloudy',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WeatherWidget extends StatelessWidget {
  final String temperature;
  final String highLow;
  final String location;
  final IconData weatherIcon;
  final String condition;

  WeatherWidget({
    required this.temperature,
    required this.highLow,
    required this.location,
    required this.weatherIcon,
    required this.condition,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        ClipRRect(
          borderRadius: BorderRadius.circular(20),

          child: CustomPaint(
            painter: WeatherWidgetPainter(),
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          temperature,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Text(
                          highLow,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          location,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 10,),
                        // Icon(
                        //   weatherIcon,
                        //   color: Colors.white,
                        //   size: 48,
                        // ),
                        Text(
                          condition,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 180,
          child: Image.asset(
            'assets/cloud.png',
            fit: BoxFit.cover,
            height: 150,
            width: 200,
          ),
        ),
      ],
    );
  }
}

class WeatherWidgetPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        colors: [Colors.deepPurple, Colors.deepPurpleAccent],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, size.height * 0.45)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


