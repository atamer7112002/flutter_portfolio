import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/responsive_layout.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.getValue(context, mobile: 30, desktop: 100),
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('About Me'),
          const SizedBox(height: 60),
          ResponsiveLayout(
            mobile: _buildMobileAbout(),
            desktop: _buildDesktopAbout(),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFccd6f6),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Container(
            height: 1,
            color: const Color(0xFF8892b0).withOpacity(0.3),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopAbout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello! I\'m Ahmed Tamer, a passionate Flutter Developer with expertise in building high-performance cross-platform mobile applications.',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: const Color(0xFF8892b0),
                  height: 1.8,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'I specialize in Clean Architecture, state management solutions (BLoC, Cubit), and creating pixel-perfect UI/UX designs. Proven track record of optimizing app performance, delivering scalable solutions, and implementing pixel-perfect UI/UX designs.',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: const Color(0xFF8892b0),
                  height: 1.8,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'With a solid background in UI/UX design and a Bachelor\'s degree in Computer Science from Suez Canal University, I bring both technical expertise and design sensibility to every project. Strong background in Agile development, RESTful APIs, and Firebase integration.',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: const Color(0xFF8892b0),
                  height: 1.8,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 60),
        Expanded(flex: 2, child: _buildProfileImage()),
      ],
    );
  }

  Widget _buildMobileAbout() {
    return Column(
      children: [
        _buildProfileImage(),
        const SizedBox(height: 40),
        Text(
          'Hello! I\'m Ahmed Tamer, a passionate Flutter Developer with expertise in building high-performance cross-platform mobile applications.',
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: const Color(0xFF8892b0),
            height: 1.8,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          'I specialize in Clean Architecture, state management solutions (BLoC, Cubit), and creating pixel-perfect UI/UX designs. Proven track record of optimizing app performance, delivering scalable solutions, and implementing pixel-perfect UI/UX designs.',
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: const Color(0xFF8892b0),
            height: 1.8,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          'With a solid background in UI/UX design and a Bachelor\'s degree in Computer Science from Suez Canal University, I bring both technical expertise and design sensibility to every project.',
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: const Color(0xFF8892b0),
            height: 1.8,
          ),
        ),
      ],
    );
  }

  Widget _buildProfileImage() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF64ffda), width: 3),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF64ffda).withOpacity(0.3),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset('assets/images/profile.jpg', fit: BoxFit.cover),
      ),
    );
  }
}
