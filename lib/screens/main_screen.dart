import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
  List<Widget> _widgetList = [
    HomeScreen(),
    QuranScreen(),
    AudioScreen(),
    PrayerScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: SvgPicture.asset('assets/quran.svg'), title: 'Quran'),
          TabItem(icon: Icons.add, title: 'Audio'),
          TabItem(icon: Icons.message, title: 'Prayer'),
        ],
        initialActiveIndex: 0,
        onTap: updateIndex,
      )),
    );
  }

  void updateIndex(index) {
    setState(() {
      selectIndex = index;
    });
  }
}
