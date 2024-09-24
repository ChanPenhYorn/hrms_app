import 'package:get/get.dart';
import 'package:hrms_app/src/controller/user_me_controller.dart';
import 'package:hrms_app/src/core/services/api/api_endpoint_service.dart';
import 'package:hrms_app/src/core/services/api/api_service.dart';
import 'package:hrms_app/src/core/services/local_storage_service.dart';
import 'package:hrms_app/src/model/user_model.dart';

class ApiExtensionService extends GetxController {
  final localStorageService = Get.put(LocalStorageService());
  var isLoading = false.obs;
  Future<Map<String, dynamic>> login(String email, String password) async {
    isLoading.value = true;
    Map<String, dynamic>? responseGet;
    ApiService apiService = ApiService();

    Map<String, dynamic> body = {
      'email': email,
      'password': password,
    };

    // Example GET request
    try {
      responseGet = await apiService.request(
          endpoint: ApiEndpointService.login, // Dynamic route
          method: 'POST',
          headers: {
            'Content-Type': 'application/json', // Ensuring JSON content type
          },
          body: body);

      if (responseGet["success"] == true) {
        Get.snackbar('Information', "Login successful");
        return responseGet["data"];
      } else {
        Get.snackbar('Information', responseGet["data"]["detail"]);
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', "Failed to login: $e");
    } finally {
      isLoading.value = false;
    }

    return responseGet!["data"];
  }

  Future<Map<String, dynamic>> getMe() async {
    String? token = await localStorageService.getToken("token");
    final userController = Get.put(UserController());
    isLoading.value = true;
    Map<String, dynamic>? responseGet;
    ApiService apiService = ApiService();

    // Example GET request
    try {
      responseGet = await apiService.request(
        endpoint: ApiEndpointService.getMe, // Dynamic route
        method: 'GET',
        headers: {
          'Content-Type': 'application/json', // Ensuring JSON content type
          'Authorization': 'Bearer $token',
        },
      );

      if (responseGet["success"] == true) {
        Get.snackbar('Information', "Login successful");

        UserModel user = UserModel.fromJson(responseGet["data"]);

        userController.setUser(user);
        return responseGet["data"];
      } else {
        Get.snackbar('Information', responseGet["data"]["detail"]);
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', "Failed to login: $e");
    } finally {
      isLoading.value = false;
    }

    return responseGet!["data"];
  }
}
