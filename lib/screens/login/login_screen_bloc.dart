import 'package:airtel/screens/toggle_bar/toggle_bar_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginScreenBloc {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Create storage variable
  final storage = const FlutterSecureStorage();

  Future<void> rememberMyLogin(BuildContext context) async {
    await storage.write(key: "phoneNumber", value: phoneNumberController.text);
    await storage.write(key: "password", value: passwordController.text);

    // if yes or not navigate to ToggleBarScreens
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const ToggleBarScreens(),
      ),
    );
  }

  // Read the value the user added to the field we get it from the controller
  Future<void> getUserLoginFromSecureStorage() async {
    phoneNumberController.text = await storage.read(key: "phoneNumber") ?? "";
    passwordController.text = await storage.read(key: "password") ?? "";
  }
}
