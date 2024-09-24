import 'package:get/get.dart';

class WelcomeCon extends GetxController {
  var pagIndex = 0.obs;
  void changePageIndex(int index) {
    pagIndex.value = index;
  }
}
