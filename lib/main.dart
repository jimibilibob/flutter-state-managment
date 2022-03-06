import 'package:flutter/material.dart';

import 'package:get/get_navigation/get_navigation.dart';

import 'package:states/screens/page1_screen.dart';
import 'package:states/screens/page2_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'page1',
      // routes: {
      //   'page1': (_) => const Page1Screen(),
      //   'page2': (_) => const Page2Screen()
      // },
      getPages: [
        GetPage(name: '/page1', page: () => const Page1Screen()),
        GetPage(name: '/page2', page: () => const Page2Screen()),
      ],
    );
  }
}
