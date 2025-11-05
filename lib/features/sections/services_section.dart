import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_textstyles.dart';
import '../../core/utils/responsive.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = Responsive.isMobile(context);

    final serviceItems = [
      "Health Insurance",
      "Life Insurance",
      "Car Insurance",
      "Investment Plans",
    ];

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
                _buildGridSection(serviceItems, isMobile),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: _buildGridSection(serviceItems, isMobile),
                ),
                const SizedBox(width: 80),
                Expanded(flex: 1, child: _buildTextSection(size)),
              ],
            ),
    );
  }

  Widget _buildTextSection(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FittedBox(
          child: Text(
            "LET'S DISCUSS OUR",
            style: AppTextstyles.white_24_500_24, // use your custom style
          ),
        ),

        FittedBox(
          child: Text(
            "SERVICES",
            style: AppTextstyles.white_140_900_20.copyWith(
              fontSize: 120,
              letterSpacing: 18,
            ),
          ),
        ),

        FittedBox(
          child: Text(
            "Empower your financial journey with tailored insurance and investment plans. "
            "From health, life,\nand vehicle protection to mutual funds and SIPs — we help "
            "you build stability, security, and long-\nterm growth with confidence.",

            style: AppTextstyles.white_16_600,
          ),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6A44CB),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            "View All Services",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildGridSection(List<String> items, bool isMobile) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 2 : 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 1.5,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white24),
          ),
          alignment: Alignment.center,
          child: Text(items[index], style: AppTextstyles.white_16_600),
        );
      },
    );
  }
}
