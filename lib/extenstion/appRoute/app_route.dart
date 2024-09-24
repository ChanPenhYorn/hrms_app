import 'package:chanpenh_getx/views/authentication/login/first.dart';
import 'package:chanpenh_getx/views/home/home_view.dart';
import 'package:chanpenh_getx/views/test/test_view.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const home = '/';
  static const test = '/test';
  static const first = '/first';
  static const second = '/second';
  static const third = '/third';
  static const login = '/login';

  static List<GetPage> routes = [
    GetPage(name: AppRoutes.home, page: () => const HomeView()),
    GetPage(name: AppRoutes.test, page: () => const TestView()),
    GetPage(name: AppRoutes.test, page: () => const First()),
  ];
}
