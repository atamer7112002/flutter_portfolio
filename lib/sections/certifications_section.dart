import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/responsive_layout.dart';

class CertificationsSection extends StatelessWidget {
  const CertificationsSection({super.key});

  final List<Map<String, String>> certifications = const [
    {
      'title': 'CS50x: Introduction to Computer Science',
      'issuer': 'Harvard University',
      'year': '2022',
    },
    {
      'title': 'Flutter Certification',
      'issuer': 'Google Developer Student Clubs (GDSC)',
      'year': '2023',
    },
    {'title': 'Flutter Development Guide', 'issuer': 'Udemy', 'year': '2023'},
    {
      'title': 'Mobile Development (iOS)',
      'issuer': 'Information Technology Institute (ITI)',
      'year': '2022',
    },
  ];

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
          _buildSectionTitle('Certifications'),
          const SizedBox(height: 60),
          _buildCertificationsGrid(context),
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

  Widget _buildCertificationsGrid(BuildContext context) {
    final crossAxisCount = Responsive.getValue(context, mobile: 1, desktop: 2);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
        childAspectRatio: Responsive.getValue(
          context,
          mobile: 1.8,
          desktop: 3.0,
        ),
      ),
      itemCount: certifications.length,
      itemBuilder: (context, index) {
        return _buildCertificationCard(certifications[index]);
      },
    );
  }

  Widget _buildCertificationCard(Map<String, String> cert) {
    return Container(
      padding: const EdgeInsets.all(25),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const Icon(Icons.verified, color: Color(0xFF64ffda), size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  cert['title']!,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFccd6f6),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            cert['issuer']!,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF64ffda),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.calendar_today,
                color: Color(0xFF8892b0),
                size: 14,
              ),
              const SizedBox(width: 6),
              Text(
                cert['year']!,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: const Color(0xFF8892b0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
