import 'package:ait_training/injection.dart';
import 'package:ait_training/routes.dart';
import 'package:flutter/material.dart';

void main() {
  setupAllInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Boring App',
      theme: ThemeData(
        fontFamily: 'Kanit',
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      routerConfig: router,
      // home: Scaffold(
      //   appBar: AppBar(
      //     backgroundColor: const Color(0xFF245953),
      //     toolbarHeight: 0.0,
      //   ),
      //   body: const StaggeredHome(),
      // ),
    );
  }
}
