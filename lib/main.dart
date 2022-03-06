import 'package:flutter/material.dart';
import 'package:states/screens/page1_screen.dart';
import 'package:states/screens/page2_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'page1',
      routes: {
        'page1': (_) => const Page1Screen(),
        'page2': (_) => const Page2Screen()
      },
    );
  }
}
