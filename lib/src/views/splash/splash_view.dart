import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms_app/src/views/splash/controller/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Show loading spinner
      ),
    );
  }
}
