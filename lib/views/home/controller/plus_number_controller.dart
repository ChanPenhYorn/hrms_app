import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class PlusNumberController extends GetxController {
  var number = 0.obs;

  void increaseNumber() {
    number++;
  }

  void snackerBar() {
    Get.snackbar("Number", " increased by 1");
  }
}
