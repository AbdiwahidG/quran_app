import 'package:flutter/material.dart';
import 'package:quran_app/screens/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quran App',
      theme: ThemeData(
          //primarySwatch: Constatnts.kSwatchColor,
          fontFamily: 'Poppins'),
      home: SplashScreen(),
    );
  }
}
