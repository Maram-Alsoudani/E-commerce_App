import 'package:e_commerce_app/core/routes_manager/route_generator.dart';
import 'package:flutter/material.dart';

import 'core/routes_manager/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashScreenRoute,
      onGenerateRoute: RouteGenerator.getRoute,
      // home: const Home(),
    );
  }
}