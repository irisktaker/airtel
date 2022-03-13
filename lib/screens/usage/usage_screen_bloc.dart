import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:flutter/material.dart';

import '/singleton/singleton.dart';

int index = 0;

class UsageScreenBloc {
  final GlobalKey<AnimatedCircularChartState> chartKey =
      GlobalKey<AnimatedCircularChartState>();

  double dataUsed = Singleton.instance.internetData[index].dataUsed /
      Singleton.instance.internetData[index].totalData *
      100;

  double availableData = Singleton.instance.internetData[index].availableData /
      Singleton.instance.internetData[index].totalData *
      100;

  bool showInternetSpeedSectionBorder = false;
  bool showCalenderAndDataSectionBorder = false;
  bool showPlansSectionBorder = false;

  BoxBorder? border = Border.all(
    color: const Color.fromARGB(255, 15, 211, 15),
    width: 2,
  );
}
