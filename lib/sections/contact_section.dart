import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/responsive_layout.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.getValue(context, mobile: 30, desktop: 100),
        vertical: 100,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF112240).withOpacity(0.3),
      ),
      child: Column(
        children: [
          Text(
            'Get In Touch',
            style: GoogleFonts.poppins(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFccd6f6),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: 600,
            child: Text(
              'I\'m currently looking for new opportunities and my inbox is always open. Whether you have a question or just want to say hi, I\'ll try my best to get back to you!',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: const Color(0xFF8892b0),
                height: 1.8,
              ),
            ),
          ),
          const SizedBox(height: 50),
          _buildContactButton(),
          const SizedBox(height: 60),
          _buildSocialLinks(),
          const SizedBox(height: 40),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildContactButton() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launchURL('mailto:a.tamer7112002@gmail.com'),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF64ffda), width: 2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            'Say Hello',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF64ffda),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialIcon(
          FontAwesomeIcons.github,
          () => html.window.open('https://github.com/atamer7112002', '_blank'),
        ),
        const SizedBox(width: 30),
        _buildSocialIcon(
          FontAwesomeIcons.linkedin,
          () =>
              html.window.open('https://linkedin.com/in/a7medtamer7', '_blank'),
        ),
        const SizedBox(width: 30),
        _buildSocialIcon(
          FontAwesomeIcons.envelope,
          () => _launchURL('mailto:a.tamer7112002@gmail.com'),
        ),
        const SizedBox(width: 30),
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
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFF64ffda).withOpacity(0.3),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: FaIcon(icon, color: const Color(0xFF64ffda), size: 24),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        const Divider(color: Color(0xFF8892b0), thickness: 0.5),
        const SizedBox(height: 20),
        Text(
          'Built with Flutter Web by Ahmed Tamer',
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: const Color(0xFF8892b0),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '© 2026 All rights reserved',
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: const Color(0xFF8892b0),
          ),
        ),
      ],
    );
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
}
