import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';
import '../utils/responsive_layout.dart';

class NavBar extends StatefulWidget {
  final Function(int) onNavTap;
  final int currentIndex;

  const NavBar({super.key, required this.onNavTap, required this.currentIndex});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final List<String> _navItems = [
    'Home',
    'About',
    'Skills',
    'Projects',
    'Experience',
    'Education',
    'Certifications',
    'Contact',
  ];

  int? _hoveredIndex;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: _buildMobileNavBar(),
      desktop: _buildDesktopNavBar(),
    );
  }

  Widget _buildDesktopNavBar() {
    return Container(
      height: AppSpacing.navHeight,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.92),
        border: const Border(
          bottom: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLogo(),
          Row(
            children: [
              // Only show key nav items on desktop
              ..._buildDesktopNavItems(),
              const SizedBox(width: 20),
              _buildThemeToggle(),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildDesktopNavItems() {
    // Show: About(1), Skills(2), Projects(3), Experience(4), Contact(7)
    const displayItems = [
      {'label': 'About', 'index': 1},
      {'label': 'Skills', 'index': 2},
      {'label': 'Projects', 'index': 3},
      {'label': 'Experience', 'index': 4},
      {'label': 'Contact', 'index': 7},
    ];
    return displayItems.map((item) {
      final index = item['index'] as int;
      final label = item['label'] as String;
      final isActive = widget.currentIndex == index;
      final isHovered = _hoveredIndex == index;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => setState(() => _hoveredIndex = index),
          onExit: (_) => setState(() => _hoveredIndex = null),
          child: GestureDetector(
            onTap: () => widget.onNavTap(index),
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: isActive || isHovered
                    ? AppColors.textPrimary
                    : AppColors.textSecondary,
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  Widget _buildLogo() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => widget.onNavTap(0),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'A',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.background,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              'Ahmed.',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeToggle() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(
        Icons.wb_sunny_outlined,
        color: AppColors.textSecondary,
        size: 20,
      ),
    );
  }

  Widget _buildMobileNavBar() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.95),
        border: const Border(
          bottom: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLogo(),
          IconButton(
            icon: const Icon(Icons.menu, color: AppColors.primary, size: 28),
            onPressed: () => _showMobileMenu(context),
          ),
        ],
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.cardBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: AppColors.textMuted,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            ...List.generate(
              _navItems.length,
              (index) => ListTile(
                title: Text(
                  _navItems[index],
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: widget.currentIndex == index
                        ? AppColors.primary
                        : AppColors.textSecondary,
                  ),
                ),
                leading: Icon(
                  _getNavIcon(index),
                  color: widget.currentIndex == index
                      ? AppColors.primary
                      : AppColors.textMuted,
                  size: 22,
                ),
                onTap: () {
                  Navigator.pop(context);
                  widget.onNavTap(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getNavIcon(int index) {
    switch (index) {
      case 0:
        return Icons.home_outlined;
      case 1:
        return Icons.person_outline;
      case 2:
        return Icons.code;
      case 3:
        return Icons.work_outline;
      case 4:
        return Icons.timeline;
      case 5:
        return Icons.school_outlined;
      case 6:
        return Icons.verified_outlined;
      case 7:
        return Icons.mail_outline;
      default:
        return Icons.circle;
    }
  }
}
