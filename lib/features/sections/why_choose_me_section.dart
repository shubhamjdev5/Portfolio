import 'package:flutter/material.dart';
import 'package:insureme/core/constants/app_colors.dart';
import 'package:insureme/core/constants/app_images.dart';
import '../../core/utils/responsive.dart';
import '../../core/constants/app_textstyles.dart';

class WhyChooseMeSection extends StatelessWidget {
  const WhyChooseMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height, // full screen height
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.primaryBackground),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 0 : 40,
        vertical: 20,
      ),
      child: isMobile
          ? _buildMobileLayout(context)
          : _buildDesktopLayout(context, size),
    );
  }

  // ---------------------- DESKTOP & TABLET VIEW ---------------------- //
  Widget _buildDesktopLayout(BuildContext context, Size size) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Center Image
        Positioned.fill(
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                AppImages.homeImage, // same image
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        // Top Left Container (Title)
        Positioned(
          top: 80,
          left: 100,

          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF7C3AED),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: RichText(
                    text: TextSpan(
                      text: 'WHY\n',
                      style: AppTextstyles.white_50_500,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'CHOOSE\n',
                          style: AppTextstyles.white_50_500.copyWith(
                            fontWeight: FontWeight.w900,
                            fontSize: 60,
                          ),
                        ),
                        TextSpan(
                          text: 'ME?',
                          style: AppTextstyles.white_50_500,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                FittedBox(
                  child: Text(
                    "Because your story deserves a shield,\nnot just a plan.",
                    style: AppTextstyles.white_16_600,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Left Bottom
        Positioned(
          bottom: 80,
          left: 100,
          child: _buildPoint(
            title: "Beyond Insurance",
            description:
                "I help you secure health, wealth, and peace of mind — all in one place.",
          ),
        ),

        // Right Top
        Positioned(
          top: 100,
          right: 100,
          child: _buildPoint(
            title: "Secure Future",
            description:
                "Helping you plan today for the peace of mind you deserve tomorrow.",
          ),
        ),

        // Right Center
        Positioned(
          right: 100,

          top: size.height / 2 - 100,
          child: _buildPoint(
            title: "True Protection",
            description:
                "Not just coverage — a commitment to secure what matters most.",
          ),
        ),

        // Right Bottom
        Positioned(
          bottom: 80,
          right: 100,
          child: _buildPoint(
            title: "Reliable Partner",
            description:
                "Standing with you at every step of your financial journey.",
          ),
        ),
      ],
    );
  }

  // ---------------------- MOBILE VIEW ---------------------- //
  Widget _buildMobileLayout(BuildContext context) {
    return Stack(
      children: [
        // Background image with overlay
        Positioned.fill(
          child: Opacity(
            opacity: 0.4,
            child: Image.asset(
              AppImages.homeImage, // same image
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Dark overlay
        Positioned.fill(child: Container(color: Colors.black.withOpacity(0.5))),

        // Content over image
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF7C3AED),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: FittedBox(
                  child: RichText(
                    text: TextSpan(
                      text: 'WHY\n',
                      style: AppTextstyles.white_20_500,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'CHOOSE\n',
                          style: AppTextstyles.white_50_500.copyWith(
                            fontWeight: FontWeight.w900,
                            fontSize: 25,
                          ),
                        ),
                        TextSpan(
                          text: 'ME?',
                          style: AppTextstyles.white_20_500,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildPoint(
                title: "Secure Future",
                description:
                    "Helping you plan today for peace of mind tomorrow.",
              ),
              const SizedBox(height: 15),
              _buildPoint(
                title: "True Protection",
                description:
                    "Not just coverage — a commitment to secure what matters most.",
              ),
              const SizedBox(height: 15),
              _buildPoint(
                title: "Beyond Insurance",
                description:
                    "I help you protect health, wealth, and peace of mind.",
              ),
              const SizedBox(height: 15),
              _buildPoint(
                title: "Reliable Partner",
                description:
                    "Standing with you in every step of your financial journey.",
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ---------------------- REUSABLE POINT WIDGET ---------------------- //
  Widget _buildPoint({required String title, required String description}) {
    return SizedBox(
      width: 350,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Text(
                    '◈ $title',
                    style: AppTextstyles.white_20_500.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: AppTextstyles.white_16_600.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
