import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'login_screen_bloc.dart';
import '/widgets/custom_btn.dart';
import '/utilities/constantces.dart';

class LoginScreen {

  // how to use initstate ??

  final LoginScreenBloc _bloc = LoginScreenBloc();

  Future showBottomSheetForLogin(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isTextFieldClicked = false;

    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      enableDrag: true,
      isDismissible: true,
      useRootNavigator: true,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: size.height * 0.48,
      ),
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SafeArea(
            child: ListView(
              children: [
                BottomSheet(
                  onClosing: () {},
                  backgroundColor: Colors.transparent,
                  builder: ((BuildContext context) {
                    return StatefulBuilder(
                      builder: ((context, setState) {
                        return Form(
                          key: _bloc.formKey,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              vertical: 40,
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.color.white,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(36),
                                topRight: Radius.circular(36),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: AppColors.color.red,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "Let's get started",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: AppColors.color.grey,
                                  ),
                                ),
                                const SizedBox(height: 40),
                                TextFormField(
                                  validator: RequiredValidator(
                                    errorText: "Please enter your Phone Number",
                                  ),
                                  controller: _bloc.phoneNumberController,
                                  keyboardType: TextInputType.phone,
                                  cursorColor: AppColors.color.darkGrey,
                                  showCursor: false,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor:
                                        AppColors.color.blue.withOpacity(0.05),
                                    hintText: "Mobile Number",
                                    hintStyle: TextStyle(
                                      color: AppColors.color.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                TextFormField(
                                  validator: MultiValidator(
                                    [
                                      RequiredValidator(
                                          errorText: "Password is required"),
                                      MinLengthValidator(6,
                                          errorText:
                                              "Password must contain at least 6 characters"),
                                      MaxLengthValidator(25,
                                          errorText:
                                              "Password cannot be more than 25 characters"),
                                      PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                                          errorText:
                                              "Password must have at least one special character"),
                                    ],
                                  ),
                                  onTap: () {
                                    setState(() {
                                      // TO_DO
                                    });
                                  },
                                  enableInteractiveSelection: true,
                                  controller: _bloc.passwordController,
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: true,
                                  showCursor: false,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor:
                                        AppColors.color.blue.withOpacity(0.05),
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                      color: AppColors.color.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                InkWell(
                                  onTap: (() {
                                    setState(() {
                                      // TO_DO
                                    });
                                  }),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "Forgot Password ?",
                                      style: TextStyle(
                                        color: AppColors.color.darkGrey,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 26),
                                CustomBtn(
                                  size: size,
                                  onPressed: () async {
                                    if (_bloc.formKey.currentState!
                                        .validate()) {
                                      await _bloc.rememberMyLogin(context);
                                    }
                                  },
                                  text: "login",
                                  primary: AppColors.color.red,
                                  onPrimary: AppColors.color.white,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    );
                  }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
