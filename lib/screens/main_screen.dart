import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/contants/constants.dart';

import 'package:quran_app/screens/audio_screen.dart';
import 'package:quran_app/screens/home_screen.dart';
import 'package:quran_app/screens/prayer_screen.dart';
import 'package:quran_app/screens/quran_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectIndex = 0;
  final List<Widget> _widgetList = [
    const HomeScreen(),
    const QuranScreen(),
    const AudioScreen(),
    const PrayerScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _widgetList[selectIndex],
        bottomNavigationBar: ConvexAppBar(
          items: [
            TabItem(
                icon: Image.asset(
                  'assets/home.png',
                  color: Colors.white,
                ),
                title: 'Home'),
            TabItem(
                icon: Image.asset(
                  'assets/holyQuran.png',
                  color: Colors.white,
                ),
                title: 'Quran'),
            TabItem(
                icon: Image.asset(
                  'assets/audio.png',
                  color: Colors.white,
                ),
                title: 'Audio'),
            TabItem(
                icon: Image.asset(
                  'assets/mosque.png',
                  color: Colors.white,
                ),
                title: 'Prayer'),
          ],
          initialActiveIndex: 0,
          onTap: updateIndex,
          backgroundColor: Constants.kPrimary,
          activeColor: Constants.kPrimary,
        ),
      ),
    );
  }

  void updateIndex(index) {
    setState(() {
      selectIndex = index;
    });
  }
}
