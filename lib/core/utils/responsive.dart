import 'package:flutter/material.dart';

/// A simple utility class to check the device type responsively.
class Responsive {
  /// Mobile = width < 600px
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  /// Tablet = 600px <= width < 1100px
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 600 && width < 1100;
  }

  /// Desktop = width >= 1100px
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;
}


/*
 if (!Responsive.isMobile(context))
            const Expanded(flex: 2, child: Sidebar()),
*/
