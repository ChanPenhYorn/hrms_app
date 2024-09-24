import 'package:hrms_app/src/core/services/local_storage_service.dart';
import 'package:hrms_app/src/core/navigation/appRoute/app_route.dart';

import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final localStorageService = Get.put(LocalStorageService());

    return Drawer(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          Column(
            children: [
              Text("hello".tr),
              Text("welcome".tr),
            ],
          ),
          const Center(),
          const Center(
            child: Text("Home View"),
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Calculate")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  "Success", // Title
                  "Data has been saved successfully!", // Message
                  snackPosition: SnackPosition.BOTTOM, // Snackbar position
                  backgroundColor: Colors.green, // Background color
                  colorText: Colors.white, // Text color
                  icon: const Icon(Icons.check, color: Colors.white), // Icon
                  duration: const Duration(seconds: 3), // Duration
                );
              },
              child: const Text("Get Snackbar")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                if (Get.isDarkMode) {
                  Get.changeTheme(ThemeData.light());
                } else {
                  Get.changeTheme(ThemeData.dark());
                }
              },
              child: const Text("Get Change Theme")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                var locale = Get.locale == const Locale('en', 'US')
                    ? const Locale('km', 'KH')
                    : const Locale('en', 'US');
                Get.updateLocale(locale);
              },
              child: const Text("Get Change Locale")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                // Get.to(const CalendarView());
              },
              child: const Text("Go Calendar")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.test);
              },
              child: const Text("Test View")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                localStorageService.removeToken("token");
                Get.toNamed(AppRoutes.login);
                // Get.back();
              },
              child: const Text("logout")),
        ],
      ),
    );
  }
}
