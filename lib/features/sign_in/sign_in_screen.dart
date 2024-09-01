import 'package:e_commerce_app/core/resources/assets_manager.dart';
import 'package:e_commerce_app/core/resources/color_manager.dart';
import 'package:e_commerce_app/core/resources/font_manager.dart';
import 'package:e_commerce_app/core/resources/style_manager.dart';
import 'package:e_commerce_app/features/sign_in/sign_in_cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart'; // Import core Flutter libraries first

import '../../core/routes_manager/routes.dart';
import '../../core/widgets/custom_elevated_button.dart';
import '../../core/widgets/custom_text_form_field.dart';
import '../../core/widgets/validators/app_validators.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SignInViewModel signInViewModel = SignInViewModel();
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    ImageAsset.routeLogo,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Welcome Back To Route",
                    style: getTextStyle(
                      24.0,
                      FontWeightManager.semiBold,
                      ColorManager.white,
                    ),
                  ),
                  Text("Please sign in with your email",
                      style: getTextStyle(
                        16.0,
                        FontWeightManager.light,
                        ColorManager.white,
                      )),

                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Email",
                      style: getTextStyle(
                        18.0,
                        FontWeightManager.medium,
                        ColorManager.white,
                      ),
                    ),
                  ),
                  CustomTextFormField(
                    hint: "enter your email ",
                    validator: (val) => AppValidators.validateEmail(val),
                    controller: signInViewModel.emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  //password
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Password",
                      style: getTextStyle(
                        18.0,
                        FontWeightManager.medium,
                        ColorManager.white,
                      ),
                    ),
                  ),
                  CustomTextFormField(
                    hint: "enter your password",
                    validator: (val) => AppValidators.validatePassword(val),
                    controller: signInViewModel.passwordController,
                    isSecured: true,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Forgot password",
                        textAlign: TextAlign.end,
                        style: getTextStyle(
                          18.0,
                          FontWeightManager.regular,
                          ColorManager.white,
                        ),
                      )),
                  const SizedBox(
                    height: 35,
                  ),
                  CustomElevatedButton(
                      text: "Login",
                      onButtonClicked: () {
                        // signUpViewModel.signUp();
                      }),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.signUpScreenRoute);
                      },
                      child: Text(
                        "Don't have an account? Create Account",
                        style: getTextStyle(
                          18.0,
                          FontWeightManager.medium,
                          ColorManager.white,
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
