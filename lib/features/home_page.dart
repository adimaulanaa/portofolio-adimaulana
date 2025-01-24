
import 'package:flutter/material.dart';
import 'package:flutter_web/core/theme/media_colors.dart';
import 'package:flutter_web/features/home/view_as_desktop.dart';
import 'package:flutter_web/features/home/view_as_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.bgDarkBlue,
        body: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            // Menentukan layout berdasarkan ukuran layar
            if (sizingInformation.isMobile) {
              // Layout untuk perangkat mobile
              return viewAsMobile();
            } else if (sizingInformation.isTablet) {
              // Layout untuk perangkat tablet
              return viewAsTablet();
            } else {
              // Layout untuk perangkat desktop
              return ViewAsDesktop(size: size);
            }
          },
        ));
  }

  Widget viewAsTablet() {
    return const Row(
      children: [
        Expanded(child: Text('Tampilan Tablet')),
        // Tambahkan widget lain untuk tampilan tablet
      ],
    );
  }
}
