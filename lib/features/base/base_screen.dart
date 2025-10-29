import 'package:flutter/material.dart';
import 'package:insureme/core/widgets/app_header.dart';
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
  final projectsKey = GlobalKey();
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
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HomeSection(key: homeKey),
                // AboutSection(key: aboutKey),
                // ProjectsSection(key: projectsKey),
                // FooterSection(key: contactKey),
              ],
            ),
          ),
          HeaderWidget(
            scrollController: _scrollController,
            onHomeTap: () => _scrollTo(homeKey),
            onAboutTap: () => _scrollTo(aboutKey),
            onProjectsTap: () => _scrollTo(projectsKey),
            onContactTap: () => _scrollTo(contactKey),
          ),
        ],
      ),
    );
  }
}
