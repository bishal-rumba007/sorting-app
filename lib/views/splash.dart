
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:sorting_app/utils/colors.dart';
import 'home_page.dart';



class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;

  _startDelay(){
    _timer = Timer(const Duration(seconds: 7), _goToNextPage);
  }

  _goToNextPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage(),));
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreenishColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset(
              'animations/welcome.json',
              height: 300.h,
              reverse: true,
              repeat: false,
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
    );
  }
}
