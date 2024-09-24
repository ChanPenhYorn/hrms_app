import 'package:chanpenh_getx/extenstion/appRoute/app_route.dart';
import 'package:chanpenh_getx/views/calendar/calendar_view.dart';
import 'package:chanpenh_getx/views/home/controller/plus_number_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final PlusNumberController controller = Get.put(PlusNumberController());

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
          Center(
            child: Obx(() => Text("Value: ${controller.number}")),
          ),
          const Center(
            child: Text("Home View"),
          ),
          ElevatedButton(
              onPressed: () {
                controller.increaseNumber();
              },
              child: const Text("Calculate")),
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
                Get.to(const CalendarView());
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
                Get.toNamed(AppRoutes.test);
              },
              child: const Text("Login")),
        ],
      ),
    );
  }
}
