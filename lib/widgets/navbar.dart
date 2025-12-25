import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../utils/responsive_layout.dart';

class NavBar extends StatefulWidget {
  final ItemScrollController itemScrollController;

  const NavBar({super.key, required this.itemScrollController});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool isScrolled = false;
  int selectedIndex = 0;

  final List<String> navItems = [
    'Home',
    'About',
    'Skills',
    'Experience',
    'Education',
    'Certifications',
    'Projects',
    'Contact',
  ];

  @override
  void initState() {
    super.initState();
    // Listen to scroll events to change navbar background
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Add scroll listener here if needed
    });
  }

  void _scrollToSection(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.itemScrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: _buildMobileNavBar(),
      desktop: _buildDesktopNavBar(),
    );
  }

  Widget _buildDesktopNavBar() {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
        color: const Color(0xFF0a192f).withOpacity(0.95),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo/Name
          Text(
            'Ahmed Tamer',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF64ffda),
            ),
          ),
          // Navigation Items
          Row(
            children: List.generate(
              navItems.length,
              (index) => _buildNavItem(navItems[index], index),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileNavBar() {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF0a192f).withOpacity(0.95),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'AT',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF64ffda),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Color(0xFF64ffda)),
            onPressed: () => _showMobileMenu(context),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String title, int index) {
    final isSelected = selectedIndex == index;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: () => _scrollToSection(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isSelected
                    ? const Color(0xFF64ffda)
                    : const Color(0xFFccd6f6),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              height: 2,
              width: isSelected ? 40 : 0,
              decoration: BoxDecoration(
                color: const Color(0xFF64ffda),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF0a192f),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            navItems.length,
            (index) => ListTile(
              title: Text(
                navItems[index],
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: selectedIndex == index
                      ? const Color(0xFF64ffda)
                      : const Color(0xFFccd6f6),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
