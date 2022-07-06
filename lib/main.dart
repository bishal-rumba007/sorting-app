import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sorting_app/utils/theme_manager.dart';
import 'package:sorting_app/views/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(420, 924),
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: getApplicationTheme(),
          debugShowCheckedModeBanner: false,
          home: const SplashPage(),
        );
      },
    );
  }
}

