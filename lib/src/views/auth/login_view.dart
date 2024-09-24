import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms_app/src/core/constants/enum/textformfield_enum.dart';
import 'package:hrms_app/src/core/constants/responsive.dart';
import 'package:hrms_app/src/core/constants/size.dart';
import 'package:hrms_app/src/core/services/api/api_extension_service.dart';
import 'package:hrms_app/src/core/services/local_storage_service.dart';
import 'package:hrms_app/src/core/utils/colors.dart';
import 'package:hrms_app/src/core/utils/text_style.dart';
import 'package:hrms_app/src/core/navigation/appRoute/app_route.dart';
import 'package:hrms_app/src/views/auth/controller/login_con.dart';
import 'package:hrms_app/src/widgets/app_button_widget.dart';
import 'package:hrms_app/src/widgets/app_label_widget.dart';
import 'package:hrms_app/src/widgets/app_loading_widget.dart';
import 'package:hrms_app/src/widgets/app_textformfield_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    final localStorageService = Get.put(LocalStorageService());
    final apiExtensionService = Get.put(ApiExtensionService());

    TextEditingController email =
        TextEditingController(text: "superadmin@gmail.com");
    TextEditingController password = TextEditingController(text: "superadmin");

    final formKey = GlobalKey<FormState>();

    void loginMethod() async {
      if (formKey.currentState!.validate()) {
        await apiExtensionService
            .login(email.text, password.text)
            .then((value) async {
          if (value["access_token"] != null) {
            await localStorageService.saveToken("token", value["access_token"]);

            await apiExtensionService.getMe();

            Get.toNamed(AppRoutes.home);
          } else {
            if (kDebugMode) {
              print("Login failed, no token received.");
            }
          }
        });
      }
    }

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          // title: const LocalSwitcherWidget(),
          title: Text(
            "Login",
            style:
                AppFonts.regular(fontSize: 22, color: AppColors.primaryColor),
          ),
        ),
        backgroundColor: Colors.white,
        body: Align(
          alignment: Responsive.isMobile(context)
              ? Alignment.topCenter
              : Alignment.center,
          child: Container(
            alignment: Alignment.center,
            constraints: BoxConstraints(
              maxWidth: SPSSize.mediumSize,
            ),
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: SafeArea(
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Container(
                    padding: Responsive.isMobile(context)
                        ? const EdgeInsets.all(0)
                        : const EdgeInsets.all(60),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: Responsive.isMobile(context) ? 0 : 1,
                            color: Responsive.isMobile(context)
                                ? Colors.transparent
                                : Colors.grey)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 60),
                              alignment: Alignment.center,
                              // color: Colors.red,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/boss.png"))),
                              width: 100,
                              height: 100,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Hrms Application",
                              style: AppFonts.getTextStyle(
                                fontSize: 18,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 46,
                            ),
                            Text(
                              "login",
                              style: AppFonts.regular(
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const AppLabel(
                              label: 'Email',
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            //!Phone Text Field
                            AppTextFormField(
                              controller: email,
                              rule: TextFieldEnum.email,
                              labelText: "Enter your email",
                              prefixIcon: const Icon(
                                Icons.email,
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const AppLabel(
                              label: 'Password',
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            //!Password Text Field
                            Obx(
                              () => AppTextFormField(
                                controller: password,
                                rule: TextFieldEnum.password,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                labelText: 'Enter your password',
                                prefixIcon: const Icon(
                                  Icons.lock,
                                ),
                                obsecuretext:
                                    loginController.isObsecureText.value,
                                onShowPassword: (p0) {
                                  loginController.togglePasswordVisibility();
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),

                            Obx(() {
                              if (apiExtensionService.isLoading.value) {
                                return const AppLoadingWidget(); // Show the circular loading indicator
                              } else {
                                return AppButtonWidget(
                                  label: "Login",
                                  onPressed: () {
                                    loginMethod();
                                  },
                                );
                              }
                            }),
                            const SizedBox(
                              height: 16,
                            ),
                            // LoginRegisterNav(
                            //   labelButton: 'button.register',
                            //   labelText: '',
                            //   onTap: () {},
                            // )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
