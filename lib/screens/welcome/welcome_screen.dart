import 'package:flutter/material.dart';

import '../languages/languages.dart';
import '../login/login_screen_bloc.dart';
import '../../utilities/constantces.dart';
import '../register/register_screen.dart';
import '../login/login_screen.dart';
import '/widgets/custom_btn.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  final LoginScreenBloc _loginScreenBloc = LoginScreenBloc();

  @override
  void initState() {
    super.initState();

    _loginScreenBloc.getUserLoginFromSecureStorage();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                onPressed: () {
                  RegisterScreen().showBottomSheetForRegister(context);
                },
                text: "sign up",
                primary: const Color(0xFFD6001C),
                onPrimary: AppColors.color.white,
              ),
              const SizedBox(height: 16),
              CustomBtn(
                size: size,
                onPressed: () {
                  LoginScreen().showBottomSheetForLogin(context);
                },
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
                      ShowBottomSheetLanguages().showBottomSheetForLanguages(context);
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
