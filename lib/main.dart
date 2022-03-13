import 'package:airtel/widgets/custom_calendar.dart';
import 'package:flutter/material.dart';
import '/screens/splash/splash_screen.dart';
import 'screens/toggle_bar/toggle_bar_screens.dart';

import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Airtel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: const SplashScreen(),
      home: ToggleBarScreens(),
    );
  }
}
