import 'package:get/get.dart';

class LoginController extends GetxController {
  // Observable for obsecure text
  var isObsecureText = true.obs; // Using RxBool

  // Method to toggle obsecure text
  void togglePasswordVisibility() {
    isObsecureText.value = !isObsecureText.value;
  }
}
