import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/screens/imc_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              title: const Text('Imc Calculator'),
            ),
            backgroundColor: AppColors.background,
            body: ImcHomeScreen()));
  }
}
