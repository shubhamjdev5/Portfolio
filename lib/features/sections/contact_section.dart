import 'package:flutter/material.dart';
import 'package:insureme/core/constants/app_colors.dart';
import 'package:insureme/core/constants/app_textstyles.dart';
import 'package:insureme/core/utils/responsive.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = Responsive.isMobile(context);

    return Container(
      decoration: BoxDecoration(color: AppColors.primaryBackground),
      height: size.height, // full screen height
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTextSection(size),
                const SizedBox(height: 40),
                // _buildGridSection(serviceItems, isMobile),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Expanded(
                //   flex: 1,
                //   child: _buildGridSection(serviceItems, isMobile),
                // ),
                const SizedBox(width: 80),
                Expanded(flex: 1, child: _buildTextSection(size)),
              ],
            ),
    );
  }
}

Widget _buildTextSection(Size size) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      FittedBox(
        child: Text(
          "TALK TO EXPERT",
          style: AppTextstyles.white_24_500_24, // use your custom style
        ),
      ),

      FittedBox(
        child: Text(
          "CONTACT",
          style: AppTextstyles.white_140_900_20.copyWith(
            fontSize: 110,
            letterSpacing: 10,
          ),
        ),
      ),

      FittedBox(
        child: Text(
          "Secure your future with smart investment and insurance solutions."
          "Reach out\ntoday — let’s build a plan that protects and grows your wealth.",

          style: AppTextstyles.white_16_600,
        ),
      ),
    ],
  );
}
