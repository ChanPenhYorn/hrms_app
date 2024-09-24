import 'package:get/get.dart';
import 'package:hrms_app/src/model/user_model.dart';

class UserController extends GetxController {
  Rx<UserModel> userMe = UserModel().obs;

  void setUser(UserModel newUser) {
    userMe.value = newUser;
  }
}
