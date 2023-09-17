import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:quran_app/models/ayah_of%20_the_day.dart';
import 'package:quran_app/services/api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiServices _apiServices = ApiServices();
  AyahOfTheDay? data;

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    HijriCalendar.setLocal('ar');
    var _hijri = HijriCalendar.now();
    var day = DateTime.now();
    var format = DateFormat('EEE, d MMM, yyyy');
    var formatted = format.format(day);

    _apiServices.getAyahOfTheDay().then((value) => data = value);

    return SafeArea(
      child: Scaffold(
        body: Column(
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
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    formatted,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  RichText(
                    text: TextSpan(
                      children: <InlineSpan>[
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              _hijri.hDay.toString(),
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              _hijri.longMonthName,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              '${_hijri.hYear} AH',
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(top: 10, bottom: 20),
                  child: Column(
                    children: [
                      FutureBuilder<AyahOfTheDay>(
                          future: _apiServices.getAyahOfTheDay(),
                          builder: (context,(context, snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.none:
                              return Icon(Icons.sync_problem);
                              case ConnectionState.waiting:
                              case ConnectionSate.active:
                              return circularProgressIndicator;
                            }
                          })),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Quran Ayah of the Day',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Divider(
                                color: Colors.black,
                                thickness: 0.5,
                              ),
                              Text(
                                data!.arText!,
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              Text(
                                data!.enTran!,
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: <InlineSpan>[
                                    WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          data!.surNumber!.toString(),
                                        ),
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          data!.surEnName!,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
