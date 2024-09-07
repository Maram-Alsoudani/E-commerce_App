import 'package:e_commerce_app/core/routes_manager/route_generator.dart';
import 'package:e_commerce_app/features/home/tabs/home_tab/cubit/home_tab_cubit.dart';
import 'package:e_commerce_app/features/home/tabs/products_tab/cubit/products_tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routes_manager/routes.dart';
import 'di/di.dart';

void main() {
  configureDependencies();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => getIt<HomeTabViewModel>()),
    BlocProvider(create: (context) => getIt<ProductsTabViewModel>())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homeScreenRoute,
      onGenerateRoute: RouteGenerator.getRoute,
      // home: const Home(),
    );
  }
}
