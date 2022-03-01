import 'package:flutter/cupertino.dart';

class PopularPlans {
  String internetPackage;
  String validationCode;
  int validity;
  VoidCallback onPress;

  PopularPlans({
    required this.internetPackage,
    required this.validationCode,
    required this.validity,
    required this.onPress,
  });

}