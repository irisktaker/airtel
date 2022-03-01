import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:getwidget/components/checkbox/gf_checkbox.dart';

import '/utilities/constantces.dart';
import '/widgets/custom_btn.dart';
import 'register_screen_bloc.dart';

class RegisterScreen {
  final RegisterScreenBloc _bloc = RegisterScreenBloc();
  bool maxHeight = false;

  Future showBottomSheetForRegister(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      enableDrag: true,
      isDismissible: true,
      useRootNavigator: true,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: size.height * 0.73,
        // minHeight: size.height * 0.73,
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
                            height: size.height,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                vertical: 40, horizontal: 20),
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
                                  "Signup",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: AppColors.color.red,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "Register with airtel account number, to start your account!",
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
                                  validator: RequiredValidator(
                                    errorText: "Please enter your NIC Number",
                                  ),
                                  controller: _bloc.nicNumberController,
                                  keyboardType: TextInputType.number,
                                  cursorColor: AppColors.color.darkGrey,
                                  showCursor: false,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor:
                                        AppColors.color.blue.withOpacity(0.05),
                                    hintText: "NIC Number",
                                    hintStyle: TextStyle(
                                      color: AppColors.color.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                TextFormField(
                                  validator: RequiredValidator(
                                    errorText: "Please enter your NIC Number",
                                  ),
                                  controller: _bloc.emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: AppColors.color.darkGrey,
                                  showCursor: false,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor:
                                        AppColors.color.blue.withOpacity(0.05),
                                    hintText: "Email address",
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
                                  onTap: () {},
                                  enableInteractiveSelection: true,
                                  controller: _bloc.confPasswordController,
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
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Required";
                                    }
                                    return MatchValidator(
                                            errorText: "Passwords don't match")
                                        .validateMatch(
                                      value,
                                      _bloc.passwordController.text,
                                    );
                                  },
                                  onTap: () {},
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
                                    hintText: "Confirm password",
                                    hintStyle: TextStyle(
                                      color: AppColors.color.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: Transform.scale(
                                        scale: 0.9,
                                        child: GFCheckbox(
                                          activeBgColor: Colors.black,
                                          activeBorderColor: Colors.black,
                                          customBgColor: Colors.black,
                                          activeIcon: Container(
                                            width: 16,
                                            height: 16,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 2,
                                                color: Colors.white,
                                              ),
                                              color: Colors.black,
                                            ),
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              _bloc.isChecked = value;
                                            });
                                          },
                                          value: _bloc.isChecked,
                                          inactiveIcon: null,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      "Terms & conditions",
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 26),
                                CustomBtn(
                                  size: size,
                                  onPressed: () async {
                                    if (_bloc.formKey.currentState!.validate()) {}
                                  },
                                  text: "Sign Up",
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
