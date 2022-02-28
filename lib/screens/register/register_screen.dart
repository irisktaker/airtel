import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../utilities/constantces.dart';
import '/widgets/custom_btn.dart';

class SignUpScreen {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController nicNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confPasswordController = TextEditingController();

  Future showBottomSheetForSignUp(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      enableDrag: true,
      isDismissible: true,
      useRootNavigator: true,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: size.height * 0.74,
      ),
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: BottomSheet(
            onClosing: () {},
            backgroundColor: Colors.transparent,
            builder: ((BuildContext context) {
              return StatefulBuilder(
                builder: ((context, setState) {
                  return Form(
                    key: formKey,
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
                          const SizedBox(height: 26),
                          TextFormField(
                            validator: (value) {
                              RequiredValidator(
                                errorText: "Please enter your Phone Number",
                              );
                            },
                            controller: phoneNumberController,
                            keyboardType: TextInputType.phone,
                            cursorColor: AppColors.color.darkGrey,
                            showCursor: false,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              filled: true,
                              fillColor: AppColors.color.blue.withOpacity(0.05),
                              hintText: "Mobile Number",
                              hintStyle: TextStyle(
                                color: AppColors.color.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            validator: (value) {
                              RequiredValidator(
                                errorText: "Please enter your NIC Number",
                              );
                            },
                            controller: nicNumberController,
                            keyboardType: TextInputType.number,
                            cursorColor: AppColors.color.darkGrey,
                            showCursor: false,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              filled: true,
                              fillColor: AppColors.color.blue.withOpacity(0.05),
                              hintText: "NIC Number",
                              hintStyle: TextStyle(
                                color: AppColors.color.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            validator: (value) {
                              RequiredValidator(
                                errorText: "Please enter your NIC Number",
                              );
                            },
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: AppColors.color.darkGrey,
                            showCursor: false,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              filled: true,
                              fillColor: AppColors.color.blue.withOpacity(0.05),
                              hintText: "Email address",
                              hintStyle: TextStyle(
                                color: AppColors.color.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            validator: (value) {
                              MultiValidator(
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
                              );
                            },
                            onTap: () {},
                            enableInteractiveSelection: true,
                            controller: confPasswordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            showCursor: false,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              filled: true,
                              fillColor: AppColors.color.blue.withOpacity(0.05),
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
                                passwordController.text,
                              );
                            },
                            onTap: () {},
                            enableInteractiveSelection: true,
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            showCursor: false,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              filled: true,
                              fillColor: AppColors.color.blue.withOpacity(0.05),
                              hintText: "Confirm password",
                              hintStyle: TextStyle(
                                color: AppColors.color.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Checkbox(value: value, onChanged: onChanged)
                          // Text(
                          //   "Forgot Password ?",
                          //   style: TextStyle(
                          //     color: AppColors.color.darkGrey,
                          //     fontSize: 14,
                          //   ),
                          // ),
                          const SizedBox(height: 26),
                          CustomBtn(
                            size: size,
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {}
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
        );
      },
    );
  }
}
