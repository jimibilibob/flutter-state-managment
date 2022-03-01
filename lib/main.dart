import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states/screens/page1_screen.dart';
import 'package:states/screens/page2_screen.dart';
import 'package:states/services/user_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // lazy en false crea la instancia tan pronto como entre a este widget
        ChangeNotifierProvider(
          create: (context) => UserService(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'page1',
        routes: {
          'page1': (_) => const Page1Screen(),
          'page2': (_) => const Page2Screen()
        },
      ),
    );
  }
}
