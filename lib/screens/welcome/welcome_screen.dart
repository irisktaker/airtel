import 'package:flutter/material.dart';

import '../../widgets/show_bottom_sheet_for_languages.dart';
import '/widgets/custom_btn.dart';
import '/constantces.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.color.gradientRed,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(flex: 6),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/logo.png"),
                  Image.asset("assets/images/brandname.png"),
                ],
              ),
              const Spacer(flex: 6),
              Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.color.white,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Enjoy the worlds fastest and best network",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: AppColors.color.white,
                ),
              ),
              const Spacer(flex: 2),
              CustomBtn(
                size: size,
                onPressed: () {},
                text: "sign up",
                primary: AppColors.color.red,
                onPrimary: AppColors.color.white,
              ),
              const SizedBox(height: 16),
              CustomBtn(
                size: size,
                onPressed: () {},
                text: "login",
                primary: AppColors.color.white,
                onPrimary: AppColors.color.red,
              ),
              const Spacer(flex: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Language",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: AppColors.color.white,
                    ),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      ShowBottomSheetForLanguages().showBottomSheetForLanguages(context);
                    },
                    child: Container(
                      width: 80,
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.color.darkGrey.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          "English",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: AppColors.color.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
