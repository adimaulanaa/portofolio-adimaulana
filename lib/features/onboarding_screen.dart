import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web/core/theme/media_colors.dart';
import 'package:flutter_web/core/theme/media_res.dart';
import 'package:flutter_web/core/theme/media_text.dart';
import 'package:flutter_web/features/home_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.bgBlue,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              MediaRes.omboarding,
              width: size.width * 0.1,
              height: size.width * 0.1,
              fit: BoxFit.cover,
            ),
            SizedBox(height: size.height * 0.05),
            Text(
              'Loading...',
              style: blackTextstyle.copyWith(
                fontSize: 15,
                fontWeight: bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
