import 'package:flutter/material.dart';
import '../../core/utils/responsive.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = Responsive.isMobile(context);

    return Container(
      height: size.height, // full screen height
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      color: Colors.white,
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
                  Text(
                    "LET’S EXPLORE TOGETHER",
                    textAlign: isMobile ? TextAlign.center : TextAlign.start,
                    style: TextStyle(
                      fontSize: isMobile ? 14 : 18,
                      letterSpacing: 3,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "THE FUTURE",
                    textAlign: isMobile ? TextAlign.center : TextAlign.start,
                    style: TextStyle(
                      fontSize: isMobile ? 38 : 68,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Your future deserves clarity. We help you make confident "
                    "decisions — Insurance, Loans, and Investments made simple.",
                    textAlign: isMobile ? TextAlign.center : TextAlign.start,
                    style: TextStyle(
                      fontSize: isMobile ? 14 : 18,
                      color: Colors.grey[700],
                      height: 1.5,
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
                child: Image.network(
                  "https://www.meazurelearning.com/wp-content/uploads/2022/02/Hero-Images-Final_Markets-.png",
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
