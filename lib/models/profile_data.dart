import 'package:flutter/cupertino.dart';

class ProfileData {
  String image;
  String description;
  VoidCallback onPress;

  ProfileData({
    required this.image,
    required this.description,
    required this.onPress,
  });
}