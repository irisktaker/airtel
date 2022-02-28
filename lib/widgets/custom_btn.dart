// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../utilities/constantces.dart';

class CustomBtn extends StatelessWidget {
  void Function()? onPressed;
  String text;
  Color? primary = AppColors.color.red;
  Color? onPrimary = AppColors.color.white;

  CustomBtn({
    Key? key,
    required this.size,
    required this.onPressed,
    required this.text,
    this.primary,
    this.onPrimary,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          primary: primary,
          onPrimary: onPrimary,
          side: (primary == AppColors.color.red)
              ? BorderSide.none
              : BorderSide(
                  color: AppColors.color.white,
                  width: 2,
                ),
        ),
        child: Text(
          text.toUpperCase(),
        ),
      ),
    );
  }
}