import 'package:flutter/cupertino.dart';

class PopularPlans {
  String internetPackage;
  String validationCode;
  int validity;
  VoidCallback onPress;
  int internetSpeed;

  PopularPlans({
    required this.internetPackage,
    required this.validationCode,
    required this.validity,
    required this.onPress,
    required this.internetSpeed,
  });

}