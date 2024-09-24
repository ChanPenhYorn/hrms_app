import 'package:chanpenh_getx/views/authentication/controller/welcome_con.dart';
import 'package:chanpenh_getx/widgets/button.dart';
import 'package:chanpenh_getx/widgets/drawer_widget.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final welcomeCon = Get.put(WelcomeCon());
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Obx(() => Stack(
            children: [
              PageView(
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) {
                  welcomeCon.changePageIndex(index);
                },
                pageSnapping: true,
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          color: Colors.blue,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: ButtonWidget(
                          label: 'Start',
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          color: Colors.red,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: ButtonWidget(
                          label: 'Start',
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          color: Colors.green,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: ButtonWidget(
                          label: 'Start',
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 100,
                  child: DotsIndicator(
                    decorator: DotsDecorator(
                        size: Size.square(9),
                        activeSize: Size(18.0, 9.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    dotsCount: 3,
                    position: welcomeCon.pagIndex.value,
                  ))
            ],
          )),
    );
  }
}
