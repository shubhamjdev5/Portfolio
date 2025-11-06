import 'package:flutter/material.dart';
import 'package:insureme/core/widgets/app_header.dart';
import 'package:insureme/features/sections/contact_section.dart';
import 'package:insureme/features/sections/services_section.dart';
import 'package:insureme/features/sections/why_choose_me_section.dart';
import '../sections/home_section.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final ScrollController _scrollController = ScrollController();
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final serviceKey = GlobalKey();
  final whyChooseMeKey = GlobalKey();
  final contactKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return HeaderWidget(
      scrollController: _scrollController,
      onHomeTap: () => _scrollTo(homeKey),
      onAboutTap: () => _scrollTo(aboutKey),
      onServiceTap: () => _scrollTo(serviceKey),
      whyChooseMeTap: () => _scrollTo(whyChooseMeKey),

      screens: [
        HomeSection(key: homeKey),
        ServicesSection(key: serviceKey),
        WhyChooseMeSection(key: whyChooseMeKey),
        ContactSection(key: contactKey),
      ],
    );
  }
}
