import 'package:course_management/infastructures/routes/course_management_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:course_management/course_management.dart';
import 'package:course_management/pages/home_page/home_page.dart';
import 'package:course_management/generated/locales.g.dart'
    as course_management;
import 'package:taav_ui/generated/locales.g.dart' as taav_ui;
import 'package:taav_ui/taav_ui.dart';

class LocalizationService extends Translations {
  LocalizationService() {
    fa.addAll(taav_ui.Locales.fa);
    en.addAll(taav_ui.Locales.en);
    fa.addAll(course_management.Locales.fa_IR);
    en.addAll(course_management.Locales.en_US);
  }
  Map<String, String> fa = {}, en = {};

  @override
  Map<String, Map<String, String>> get keys => {'fa': fa, 'en': en};
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (final context, final child) => TaavTheme(
        theme: CustomTaavTheme.defaultLightTheme,
        oldThemeData: CustomMaterialTheme(fontFamily: 'IRANSans').themeData,
        child: TaavToast(child: child),
      ),
      debugShowCheckedModeBanner: false,
      getPages: CourseManagementRoutes.routes,
      locale: const Locale('fa', 'IR'),
      translations: LocalizationService(),
      title: 'Modify test',
      home: const HomePage(),
    );
  }
}
