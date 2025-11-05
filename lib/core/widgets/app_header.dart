import 'package:flutter/material.dart';
import 'package:insureme/core/constants/app_textstyles.dart';
import '../../core/utils/responsive.dart';

class HeaderWidget extends StatefulWidget {
  final ScrollController scrollController;
  final VoidCallback onHomeTap;
  final VoidCallback onAboutTap;
  final VoidCallback onServiceTap;
  final VoidCallback whyChooseMeTap;

  final List<Widget> screens;

  const HeaderWidget({
    super.key,
    required this.scrollController,
    required this.onHomeTap,
    required this.onAboutTap,
    required this.onServiceTap,
    required this.whyChooseMeTap,

    required this.screens,
  });

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  double lastOffset = 0;
  bool isVisible = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final offset = widget.scrollController.offset;
    if (offset > lastOffset && isVisible) {
      setState(() => isVisible = false);
    } else if (offset < lastOffset && !isVisible) {
      setState(() => isVisible = true);
    }
    lastOffset = offset;
  }

  void _openDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = Responsive.isMobile(context);

    return AnimatedSlide(
      duration: const Duration(milliseconds: 300),
      offset: isVisible ? Offset.zero : const Offset(0, -1),
      child: AnimatedOpacity(
        opacity: isVisible ? 1 : 0,
        duration: const Duration(milliseconds: 300),
        child: Scaffold(
          key: _scaffoldKey,
          endDrawer: isMobile ? _buildDrawer(context) : null,
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: false, // Hides when scrolling down
                floating: true, // Appears when scrolling up
                snap: false, // Smooth reveal without snapping
                expandedHeight: 50,
                backgroundColor: Colors.transparent,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff070311),
                        Color(0xff0E0726),
                        Color(0xff0A0519),
                      ],
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.05,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Logo or Name
                          Text("Bali Shah", style: AppTextstyles.white_16_600),

                          if (isMobile)
                            IconButton(
                              icon: const Icon(Icons.menu_rounded, size: 26),
                              onPressed: _openDrawer,
                            )
                          else
                            Row(
                              spacing: 30,
                              children: [
                                _buildNavItem("Home", widget.onHomeTap),
                                _buildNavItem("Services", widget.onServiceTap),
                                _buildNavItem("About", widget.onAboutTap),
                                _buildNavItem(
                                  "Why to choose?",
                                  widget.whyChooseMeTap,
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(delegate: SliverChildListDelegate(widget.screens)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Text(title, style: AppTextstyles.white_16_600),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        children: [
          _drawerItem("Home", widget.onHomeTap),
          _drawerItem("Services", widget.onAboutTap),
          _drawerItem("About", widget.whyChooseMeTap),
          _drawerItem("Why to choose?", widget.whyChooseMeTap),
        ],
      ),
    );
  }

  Widget _drawerItem(String title, VoidCallback onTap) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      onTap: () {
        Navigator.of(context).pop(); // close drawer
        onTap();
      },
    );
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }
}
