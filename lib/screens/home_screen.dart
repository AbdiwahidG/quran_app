import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _hijri = HijriCalendar.now();
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: _size.height * 0.22, // 22 %
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/background_img.jpg'),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: <InlineSpan>[
                        WidgetSpan(
                          style: TextStyle(fontSize: 20),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              _hijri.hDay.toString(),
                            ),
                          ),
                        ),
                        WidgetSpan(
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              _hijri.longMonthName,
                            ),
                          ),
                        ),
                        WidgetSpan(
                          style: TextStyle(fontSize: 20),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${_hijri.hYear} AH',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
