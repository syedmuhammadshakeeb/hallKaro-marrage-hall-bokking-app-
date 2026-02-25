import 'package:flutter/material.dart';
import 'package:hall_karo/app/src/features/splash/component/splash_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SplashBody(),
    );
  }
}