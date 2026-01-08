import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/responsive_layout.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class HeroSection extends StatefulWidget {
  final VoidCallback? onContactTap;

  const HeroSection({super.key, this.onContactTap});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // Separate animations for each element
  late Animation<double> _introFade;
  late Animation<Offset> _introSlide;

  late Animation<double> _nameFade;
  late Animation<Offset> _nameSlide;

  late Animation<double> _titleFade;
  late Animation<Offset> _titleSlide;

  late Animation<double> _bioFade;
  late Animation<Offset> _bioSlide;

  late Animation<double> _actionsFade;
  late Animation<Offset> _actionsSlide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    // 1. Intro "Hi, my name is" (0.0 - 0.3)
    _introFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
      ),
    );
    _introSlide = Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
          ),
        );

    // 2. Name "Ahmed Tamer Ahmed" (0.1 - 0.4)
    _nameFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.1, 0.4, curve: Curves.easeOut),
      ),
    );
    _nameSlide = Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.1, 0.4, curve: Curves.easeOut),
          ),
        );

    // 3. Title "Flutter Developer" (0.2 - 0.5)
    _titleFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.5, curve: Curves.easeOut),
      ),
    );
    _titleSlide = Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.2, 0.5, curve: Curves.easeOut),
          ),
        );

    // 4. Bio "Results-driven..." (0.3 - 0.6)
    _bioFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.6, curve: Curves.easeOut),
      ),
    );
    _bioSlide = Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.3, 0.6, curve: Curves.easeOut),
          ),
        );

    // 5. Actions & Socials (0.4 - 0.7)
    _actionsFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.7, curve: Curves.easeOut),
      ),
    );
    _actionsSlide = Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.4, 0.7, curve: Curves.easeOut),
          ),
        );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _launchURL(String url) {
    if (url.startsWith('mailto:') || url.startsWith('tel:')) {
      final html.AnchorElement anchor = html.AnchorElement(href: url);
      anchor.target = '_self';
      anchor.click();
    } else {
      html.window.open(url, '_blank');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: _buildMobileHero(),
      desktop: _buildDesktopHero(),
    );
  }

  Widget _buildDesktopHero() {
    return Container(
      constraints: const BoxConstraints(minHeight: 600),
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Intro
          SlideTransition(
            position: _introSlide,
            child: FadeTransition(
              opacity: _introFade,
              child: Text(
                'Hi, my name is',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: const Color(0xFF64ffda),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Name
          SlideTransition(
            position: _nameSlide,
            child: FadeTransition(
              opacity: _nameFade,
              child: Text(
                'Ahmed Tamer Ahmed',
                style: GoogleFonts.poppins(
                  fontSize: 72,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFccd6f6),
                  height: 1.1,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Title
          SlideTransition(
            position: _titleSlide,
            child: FadeTransition(
              opacity: _titleFade,
              child: Text(
                'Flutter Developer',
                style: GoogleFonts.poppins(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF8892b0),
                  height: 1.1,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          // Bio
          SlideTransition(
            position: _bioSlide,
            child: FadeTransition(
              opacity: _bioFade,
              child: Text(
                'Flutter Developer with 2 years of experience building scalable mobile applications using Clean Architecture and BLoC. Actively developing production-ready apps with strong expertise in API integration and UI/UX implementation.',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: const Color(0xFF8892b0),
                  height: 1.6,
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          // Actions
          SlideTransition(
            position: _actionsSlide,
            child: FadeTransition(
              opacity: _actionsFade,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _buildActionButton(
                        'View Resume',
                        () => _launchURL(
                          'https://drive.google.com/drive/folders/15tJJYPiZhWWubysCwx0PzOcmtfuxsOBY',
                        ),
                        isPrimary: true,
                      ),
                      const SizedBox(width: 20),
                      _buildActionButton('Contact Me', () {
                        if (widget.onContactTap != null) {
                          widget.onContactTap!();
                        } else {
                          _launchURL('mailto:a.tamer7112002@gmail.com');
                        }
                      }, isPrimary: false),
                    ],
                  ),
                  const SizedBox(height: 50),
                  _buildSocialLinks(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileHero() {
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 120, bottom: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Intro
          SlideTransition(
            position: _introSlide,
            child: FadeTransition(
              opacity: _introFade,
              child: Text(
                'Hi, my name is',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color(0xFF64ffda),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          // Name
          SlideTransition(
            position: _nameSlide,
            child: FadeTransition(
              opacity: _nameFade,
              child: Text(
                'Ahmed Tamer Ahmed',
                style: GoogleFonts.poppins(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFccd6f6),
                  height: 1.1,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Title
          SlideTransition(
            position: _titleSlide,
            child: FadeTransition(
              opacity: _titleFade,
              child: Text(
                'Flutter Developer',
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF8892b0),
                  height: 1.1,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Bio
          SlideTransition(
            position: _bioSlide,
            child: FadeTransition(
              opacity: _bioFade,
              child: Text(
                'Flutter Developer with 2 years of experience building scalable mobile applications using Clean Architecture and BLoC. Actively developing production-ready apps with strong expertise in API integration and UI/UX implementation.',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color(0xFF8892b0),
                  height: 1.6,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          // Actions
          SlideTransition(
            position: _actionsSlide,
            child: FadeTransition(
              opacity: _actionsFade,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildActionButton(
                        'View Resume',
                        () => _launchURL(
                          'https://drive.google.com/drive/folders/15tJJYPiZhWWubysCwx0PzOcmtfuxsOBY',
                        ),
                        isPrimary: true,
                      ),
                      const SizedBox(height: 15),
                      _buildActionButton('Contact Me', () {
                        if (widget.onContactTap != null) {
                          widget.onContactTap!();
                        } else {
                          _launchURL('mailto:a.tamer7112002@gmail.com');
                        }
                      }, isPrimary: false),
                    ],
                  ),
                  const SizedBox(height: 40),
                  _buildSocialLinks(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    String text,
    VoidCallback onPressed, {
    required bool isPrimary,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
          decoration: BoxDecoration(
            color: isPrimary ? Colors.transparent : Colors.transparent,
            border: Border.all(color: const Color(0xFF64ffda), width: 2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF64ffda),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLinks() {
    return Row(
      children: [
        _buildSocialIcon(
          FontAwesomeIcons.github,
          () => _launchURL('https://github.com/atamer7112002'),
        ),
        const SizedBox(width: 20),
        _buildSocialIcon(
          FontAwesomeIcons.linkedin,
          () => _launchURL('https://linkedin.com/in/a7medtamer7'),
        ),
        const SizedBox(width: 20),
        _buildSocialIcon(
          FontAwesomeIcons.envelope,
          () => _launchURL('mailto:a.tamer7112002@gmail.com'),
        ),
        const SizedBox(width: 20),
        _buildSocialIcon(
          FontAwesomeIcons.phone,
          () => _launchURL('tel:+201028684980'),
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, VoidCallback onTap) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFF64ffda).withOpacity(0.3),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: FaIcon(icon, color: const Color(0xFF64ffda), size: 20),
        ),
      ),
    );
  }
}
