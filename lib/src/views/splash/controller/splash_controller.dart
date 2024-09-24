import 'package:get/get.dart';
import 'package:hrms_app/src/core/services/local_storage_service.dart';
import 'package:hrms_app/src/views/home/home_view.dart';
import 'package:hrms_app/src/views/welcome/welcome_view.dart';

class SplashController extends GetxController {
  final LocalStorageService _localStorageService =
      Get.find<LocalStorageService>();

  @override
  void onInit() {
    super.onInit();
    checkAuthentication();
  }

  Future<void> checkAuthentication() async {
    String? token = await _localStorageService.getToken("token");
    bool isTokenExpired = _localStorageService.isTokenExpired(token.toString());

    if (token != "" && !isTokenExpired) {
      Get.offAll(() => const HomeView());
    } else {
      Get.offAll(() => const WelcomeView());
    }
  }
}
