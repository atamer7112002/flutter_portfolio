import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/responsive_layout.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.getValue(context, mobile: 30, desktop: 100),
        vertical: 80,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF112240).withOpacity(0.3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Education'),
          const SizedBox(height: 60),
          ResponsiveLayout(
            mobile: _buildMobileEducation(),
            desktop: _buildDesktopEducation(),
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

  Widget _buildDesktopEducation() {
    return Center(
      child: _buildEducationCard(
        title: 'Bachelor of Computer Science',
        organization: 'Suez Canal University',
        period: '2020 - 2024',
        location: 'Ismailia, Egypt',
        details: ['Faculty of Computers and Informatics', 'Graduated 2024'],
      ),
    );
  }

  Widget _buildMobileEducation() {
    return _buildEducationCard(
      title: 'Bachelor of Computer Science',
      organization: 'Suez Canal University',
      period: '2020 - 2024',
      location: 'Ismailia, Egypt',
      details: ['Faculty of Computers and Informatics', 'Graduated 2024'],
    );
  }

  Widget _buildEducationCard({
    required String title,
    required String organization,
    required String period,
    required String location,
    required List<String> details,
  }) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 800),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: const Color(0xFF112240),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFF64ffda).withOpacity(0.1),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF64ffda).withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.school, color: Color(0xFF64ffda), size: 40),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFccd6f6),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            organization,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF64ffda),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(
                Icons.calendar_today,
                color: Color(0xFF8892b0),
                size: 16,
              ),
              const SizedBox(width: 8),
              Text(
                period,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color(0xFF8892b0),
                ),
              ),
              const SizedBox(width: 20),
              const Icon(Icons.location_on, color: Color(0xFF8892b0), size: 16),
              const SizedBox(width: 8),
              Text(
                location,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color(0xFF8892b0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ...details.map(
            (detail) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '▹ ',
                    style: TextStyle(color: Color(0xFF64ffda), fontSize: 20),
                  ),
                  Expanded(
                    child: Text(
                      detail,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: const Color(0xFF8892b0),
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
