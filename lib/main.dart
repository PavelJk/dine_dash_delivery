import 'package:dine_dash_delivery/src/common/router/router.dart';
import 'package:dine_dash_delivery/src/common/theme/theme_data.dart';
import 'package:flutter/material.dart';

void main() {
  Future.delayed(const Duration(seconds: 3));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      routerConfig: goRouter,
    );
  }
}
