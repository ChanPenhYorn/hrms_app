import 'package:hrms_app/src/core/navigation/appRoute/app_route.dart';
import 'package:hrms_app/src/core/utils/colors.dart';
import 'package:hrms_app/src/core/utils/space_exs.dart';
import 'package:hrms_app/src/core/utils/text_style.dart';
import 'package:hrms_app/src/views/auth/controller/welcome_con.dart';
import 'package:hrms_app/src/widgets/app_button_widget.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final welcomeCon = Get.put(WelcomeCon());
    final PageController pageController = PageController(initialPage: 0);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => Stack(
            children: [
              PageView(
                controller: pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) {
                  welcomeCon.changePageIndex(index);
                },
                pageSnapping: true,
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 130, bottom: 20),
                              width: double.infinity,
                              child: const Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/images/welcome/3911502.jpg")),
                            ),
                            Text(
                              "Welcome to HRMS System",
                              style: AppFonts.bold(
                                  fontSize: 22, color: AppColors.primaryColor),
                            ),
                            16.h,
                            Text(
                              "Welcome to HRMS System",
                              style: AppFonts.regular(
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 100),
                        child: AppButtonWidget(
                          label: 'Start',
                          onPressed: () {
                            pageController.animateToPage(
                              1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                            welcomeCon.changePageIndex(1);
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(50),
                              width: double.infinity,
                              child: const Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/images/welcome/3908990.jpg")),
                            ),
                            Text(
                              "Welcome to HRMS System",
                              style: AppFonts.bold(
                                  fontSize: 22, color: AppColors.primaryColor),
                            ),
                            16.h,
                            Text(
                              "Welcome to HRMS System",
                              style: AppFonts.regular(
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 100),
                        child: AppButtonWidget(
                          label: 'Next',
                          onPressed: () {
                            pageController.animateToPage(
                              2,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                            welcomeCon.changePageIndex(2);
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(50),
                              width: double.infinity,
                              child: const Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/images/welcome/4867780.jpg")),
                            ),
                            Text(
                              "Welcome to HRMS System",
                              style: AppFonts.bold(
                                  fontSize: 22, color: AppColors.primaryColor),
                            ),
                            16.h,
                            Text(
                              "Welcome to HRMS System",
                              style: AppFonts.regular(
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 100),
                        child: AppButtonWidget(
                          label: 'Next',
                          onPressed: () {
                            Get.toNamed(AppRoutes.login);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 200,
                child: DotsIndicator(
                  decorator: DotsDecorator(
                      size: const Size.square(9),
                      // color: AppColors.primaryColor,
                      activeColor: AppColors.primaryColor,
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  dotsCount: 3,
                  position: welcomeCon.pagIndex.value,
                ),
              ),
            ],
          )),
    );
  }
}
