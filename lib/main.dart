import 'package:flutter/material.dart';
import 'package:insureme/core/router/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.base,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
