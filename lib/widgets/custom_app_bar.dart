import 'package:airtel/screens/toggle_bar/toggle_bar_screens.dart';
import 'package:flutter/material.dart';
import '../utilities/constantces.dart';

AppBar customAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.color.white,
      elevation: 0,
      leadingWidth: 100,
      leading: InkWell(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ToggleBarScreens(),
            ),
          );
        },
        child: Image.asset(
          "assets/images/logowithname.png",
        ),
      ),
      actions: [
        InkWell(
          onTap: (){
            // TO_DO
          },
          child: Image.asset(
            "assets/icons/notification.png",
          ),
        ),
      ],
    );
  }