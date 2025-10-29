import 'package:flutter/material.dart';
import '../../core/utils/responsive.dart';

class HeaderWidget extends StatefulWidget {
  final ScrollController scrollController;
  final VoidCallback onHomeTap;
  final VoidCallback onAboutTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  const HeaderWidget({
    Key? key,
    required this.scrollController,
    required this.onHomeTap,
    required this.onAboutTap,
    required this.onProjectsTap,
    required this.onContactTap,
  }) : super(key: key);

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
          body: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 16.0,
            ),
            color: Colors.white.withOpacity(0.95),
            child: Row(
              mainAxisAlignment: isMobile
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.end,
              children: [
                // Logo or Name
                Text(
                  "Shubham",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile ? 18 : 22,
                    color: Colors.black87,
                  ),
                ),

                if (isMobile)
                  IconButton(
                    icon: const Icon(Icons.menu_rounded, size: 26),
                    onPressed: _openDrawer,
                  )
                else
                  Row(
                    children: [
                      _buildNavItem("Home", widget.onHomeTap),
                      _buildNavItem("About", widget.onAboutTap),
                      _buildNavItem("Projects", widget.onProjectsTap),
                      _buildNavItem("Contact", widget.onContactTap),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        children: [
          _drawerItem("Home", widget.onHomeTap),
          _drawerItem("About", widget.onAboutTap),
          _drawerItem("Projects", widget.onProjectsTap),
          _drawerItem("Contact", widget.onContactTap),
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
