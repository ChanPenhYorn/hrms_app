import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms_app/src/controller/user_me_controller.dart';
import 'package:hrms_app/src/core/services/api/api_extension_service.dart';
import 'package:hrms_app/src/core/services/local_storage_service.dart';
import 'package:hrms_app/src/core/utils/colors.dart';
import 'package:hrms_app/src/core/utils/space_exs.dart';
import 'package:hrms_app/src/core/utils/text_style.dart';
import 'package:hrms_app/src/views/auth/controller/welcome_con.dart';
import 'package:hrms_app/src/views/home/controller/home_controller.dart';
import 'package:hrms_app/src/widgets/app_drawer_widget.dart';
import 'package:intl/intl.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WelcomeCon());
    Get.put(UserController());

    final apiExtensionService = Get.put(ApiExtensionService());
    Get.put(LocalStorageService());
    final UserController userCon = Get.find();
    apiExtensionService.getMe();

    final homeCon = Get.put(HomeController());

    // List of widgets (pages) corresponding to each bottom navigation tab
    final List<Widget> pages = [
      const Center(child: Text("Home Page", style: TextStyle(fontSize: 24))),
      const Center(child: Text("Search Page", style: TextStyle(fontSize: 24))),
      const Center(
          child: Text("Notifications Page", style: TextStyle(fontSize: 24))),
      const Center(child: Text("Profile Page", style: TextStyle(fontSize: 24))),
    ];

    List<IconData> iconList = [
      Icons.home,
      Icons.calendar_month,
      Icons.history,
      Icons.person,
    ];

    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: scaffoldKey,
        drawer: const DrawerWidget(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  scaffoldKey.currentState?.openDrawer();
                },
                child: const CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    child: Image(
                      image: AssetImage("assets/images/boy.png"),
                      width: 30,
                    )),
              ),
              8.w,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "HI, ${userCon.userMe.value.firstname!} ${userCon.userMe.value.lastname!}",
                    style: AppFonts.bold(
                      fontSize: 16,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Text(
                    DateFormat("dd-MM-yyyy").format(userCon.userMe.value.dob!),
                    style: AppFonts.regular(
                      fontSize: 16,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: AppColors.primaryColor,
                ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: const Icon(Icons.add_circle_outline),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Obx(() => AnimatedBottomNavigationBar(
              hideAnimationCurve: Curves.bounceIn,
              backgroundColor: AppColors.primaryColor,
              activeColor: Colors.white,
              inactiveColor: Colors.black,
              icons: iconList,
              activeIndex: homeCon.pageIndex.value,
              gapLocation: GapLocation.center,
              notchSmoothness: NotchSmoothness.verySmoothEdge,
              onTap: (index) {
                homeCon.changePageIndex(index);
              },
            )),
        body: Obx(
          () => Stack(
            children: [
              // Display the selected page based on the bottomNavIndex
              pages[homeCon.pageIndex.value],
            ],
          ),
        ));
  }
}
