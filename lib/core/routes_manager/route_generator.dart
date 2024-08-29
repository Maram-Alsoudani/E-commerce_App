import 'package:e_commerce_app/core/routes_manager/routes.dart';
import 'package:e_commerce_app/features/home/home_screen.dart';
import 'package:e_commerce_app/features/sign_up/sign_up_screen.dart';
import 'package:e_commerce_app/features/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/sign_in/sign_in_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreenRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.signUpScreenRoute:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case Routes.signInScreenRoute:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case Routes.homeScreenRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      default:
        return unDefinedRouteName();
    }
  }

  static Route<dynamic> unDefinedRouteName() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("No Route Found"),
              ),
              body: Center(
                child: Text("No Route Found"),
              ),
            ));
  }
}