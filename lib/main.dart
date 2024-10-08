import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hrms_app/src/controller/user_me_controller.dart';
import 'package:hrms_app/src/core/services/local_storage_service.dart';
import 'package:hrms_app/src/core/utils/translate/translate.dart';
import 'package:hrms_app/src/core/navigation/appRoute/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensures bindings are ready for async operations
  await GetStorage.init();
  Get.put(UserController());
  // Initialize LocalStorageService lazily
  Get.lazyPut<LocalStorageService>(() => LocalStorageService());

  AppTranslations translations = AppTranslations();
  await translations.loadTranslations();

  runApp(MyApp(translations: translations));
}

class MyApp extends StatelessWidget {
  final AppTranslations translations;

  const MyApp({super.key, required this.translations});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      translations: translations, // Pass the loaded translations
      locale: const Locale('en', 'US'), // Default locale
      fallbackLocale: const Locale('en', 'US'), // Fallback locale
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('km', 'KH'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,

      darkTheme: ThemeData.dark(), // Define the dark theme
      themeMode: ThemeMode.light, // Initial theme mode

      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.routes,
    );
  }
}
