import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_web/core/theme/media_colors.dart';
import 'package:flutter_web/core/theme/media_res.dart';
import 'package:flutter_web/core/theme/media_text.dart';

class ViewAsDesktop extends StatefulWidget {
  final Size size;

  const ViewAsDesktop({super.key, required this.size});

  @override
  // ignore: library_private_types_in_public_api
  _ViewAsDesktopState createState() => _ViewAsDesktopState();
}

class _ViewAsDesktopState extends State<ViewAsDesktop> {
  // States untuk mengontrol hover
  bool isAboutHovered = false;
  bool isExperienceHovered = false;
  bool isProjectHovered = false;
  bool isLinkedin = false;
  bool isGithub = false;
  bool isGoogle = false;
  String textOne = 'I’m a developer passionate about crafting accessible, pixel-perfect user interfaces that blend thoughtful design with robust engineering. My favorite work lies at the intersection of design and development, creating experiences that not only look great but are meticulously built for performance and usability.';

  @override
  Widget build(BuildContext context) {
    Size size = widget.size;
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: size.width * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.16),
                Text(
                  'Adi Maulana',
                  style: colorsTextstyle.copyWith(
                    fontSize: 45,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Mobile Developer',
                  style: colorsTextstyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: size.width * 0.25,
                  child: Text(
                    'I build accessible, pixel-perfect digital experiences for the web.',
                    style: transTextstyle.copyWith(
                      fontSize: 15,
                      fontWeight: reguler,
                      color: AppColors.bgTextTinColors,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.08),
                buildHoverRow(
                  isHovered: isAboutHovered,
                  text: 'ABOUT',
                  onHoverChange: (hovering) => setState(() {
                    isAboutHovered = hovering;
                  }),
                ),
                const SizedBox(height: 20),
                buildHoverRow(
                  isHovered: isExperienceHovered,
                  text: 'EXPERIENCE',
                  onHoverChange: (hovering) => setState(() {
                    isExperienceHovered = hovering;
                  }),
                ),
                const SizedBox(height: 20),
                buildHoverRow(
                  isHovered: isProjectHovered,
                  text: 'PROJECT',
                  onHoverChange: (hovering) => setState(() {
                    isProjectHovered = hovering;
                  }),
                ),
                SizedBox(height: size.height * 0.25),
                Row(
                  children: [
                    buildHoverIcons(
                      isHovered: isLinkedin,
                      icons: MediaRes.linkedin,
                      onHoverChange: (hovering) => setState(() {
                        isLinkedin = hovering;
                      }),
                    ),
                    const SizedBox(width: 15),
                    buildHoverIcons(
                      isHovered: isGithub,
                      icons: MediaRes.github,
                      onHoverChange: (hovering) => setState(() {
                        isGithub = hovering;
                      }),
                    ),
                    const SizedBox(width: 15),
                    buildHoverIcons(
                      isHovered: isGoogle,
                      icons: MediaRes.google,
                      onHoverChange: (hovering) => setState(() {
                        isGoogle = hovering;
                      }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.16),
              SizedBox(
                width: size.width * 0.4,
                child: Text(
                  textOne,
                  style: transTextstyle.copyWith(
                    fontSize: 14,
                    fontWeight: reguler,
                    color: AppColors.bgTextTinColors,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: size.width * 0.4,
                child: Text(
                  textOne,
                  style: transTextstyle.copyWith(
                    fontSize: 14,
                    fontWeight: reguler,
                    color: AppColors.bgTextTinColors,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: size.width * 0.4,
                child: Text(
                  textOne,
                  style: transTextstyle.copyWith(
                    fontSize: 14,
                    fontWeight: reguler,
                    color: AppColors.bgTextTinColors,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Fungsi untuk membuat baris dengan efek hover
  Widget buildHoverRow({
    required bool isHovered,
    required String text,
    required ValueChanged<bool> onHoverChange,
  }) {
    return MouseRegion(
      onEnter: (_) => onHoverChange(true),
      onExit: (_) => onHoverChange(false),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: isHovered ? 60 : 30, // Garis bertambah panjang saat hover
            height: isHovered ? 2 : 1, // Tinggi garis tetap
            color: isHovered ? AppColors.bgColor : AppColors.bgTextColors,
          ),
          const SizedBox(width: 15),
          Text(
            text,
            style: transTextstyle.copyWith(
              fontSize: 11, // Ukuran teks tetap
              fontWeight: semiBold,
              color: isHovered ? AppColors.bgColor : AppColors.bgTextColors,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHoverIcons({
    required bool isHovered,
    required String icons,
    required ValueChanged<bool> onHoverChange,
  }) {
    return MouseRegion(
      onEnter: (_) => onHoverChange(true),
      onExit: (_) => onHoverChange(false),
      child: SvgPicture.asset(
        icons,
        // ignore: deprecated_member_use
        color: isHovered ? AppColors.bgColor : AppColors.bgTextColors,
        fit: BoxFit.cover,
      ),
    );
  }
}
