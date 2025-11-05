import 'package:flutter/material.dart';
import 'package:insureme/core/constants/app_images.dart';
import 'package:insureme/core/constants/app_textstyles.dart';
import '../../core/utils/responsive.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = Responsive.isMobile(context);

    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          radius: 1,
          center: AlignmentGeometry.topRight,
          colors: [Color(0xff190C42), Color(0xff070311)],
        ),
      ),
      height: size.height, // full screen height
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),

      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: isMobile
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          // LEFT: TEXT CONTENT
          Expanded(
            flex: isMobile ? 0 : 1,
            child: Padding(
              padding: EdgeInsets.only(
                right: isMobile ? 0 : 50,
                top: isMobile ? 20 : 0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: isMobile
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Text(
                      "LET’S SECURE THE ",
                      textAlign: isMobile ? TextAlign.center : TextAlign.start,
                      style: AppTextstyles.white_24_500_24,
                    ),
                  ),

                  FittedBox(
                    child: Text(
                      "FUTURE",
                      textAlign: isMobile ? TextAlign.center : TextAlign.start,
                      style: AppTextstyles.white_140_900_20,
                    ),
                  ),

                  FittedBox(
                    child: Text(
                      "Your future deserves clarity and confidence. Bali Shah is here to guide\nyou with expert advice in"
                      "Insurance, Loans, and Investments — helping\n you make smart, secure, and stress-free financial decisions.",
                      textAlign: isMobile ? TextAlign.center : TextAlign.start,
                      style: AppTextstyles.white_20_500,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6A44CB),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Get Started",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // RIGHT: IMAGE
          Expanded(
            flex: isMobile ? 0 : 1,
            child: Padding(
              padding: EdgeInsets.only(top: isMobile ? 30 : 0),
              child: Center(
                child: Image.asset(
                  AppImages.homeImage,
                  height: isMobile ? size.height * 0.3 : size.height * 0.6,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
