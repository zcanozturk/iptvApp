import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/home/view/home_view.dart';


main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const GetTemplateApp());
}

class GetTemplateApp extends StatelessWidget {
  const GetTemplateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale('tr', 'Tr'),
      fallbackLocale: Get.deviceLocale,
      enableLog: true,
      navigatorKey: Get.key,
      navigatorObservers: [GetObserver()],
      theme: ThemeData(
        scrollbarTheme: ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(Colors.blue[500]),
        ),
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}
