import 'package:hrms_app/src/views/auth/login_view.dart';
import 'package:hrms_app/src/views/home/home_view.dart';
import 'package:hrms_app/src/views/splash/splash_view.dart';
import 'package:get/get.dart';
import 'package:hrms_app/src/views/welcome/welcome_view.dart';

class AppRoutes {
  static const splash = '/';
  static const welcome = '/welcome';
  static const home = '/home';
  static const test = '/test';

  static const login = '/login';

  static List<GetPage> routes = [
    GetPage(name: AppRoutes.splash, page: () => const SplashView()),
    GetPage(name: AppRoutes.welcome, page: () => const WelcomeView()),
    GetPage(name: AppRoutes.home, page: () => const HomeView()),
    GetPage(name: AppRoutes.login, page: () => const LoginView()),
  ];
}
