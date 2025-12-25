import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/responsive_layout.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

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
          _buildSectionTitle('Work Experience'),
          const SizedBox(height: 60),
          ResponsiveLayout(
            mobile: _buildMobileTimeline(),
            desktop: _buildDesktopTimeline(),
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

  Widget _buildDesktopTimeline() {
    return Column(
      children: [
        _buildTimelineItem(
          title: 'Military Service',
          organization: 'Egyptian Armed Forces',
          period: 'October 2024 - December 2025',
          location: 'Egypt',
          achievements: [
            'Completed mandatory military service with Excellent Conduct.',
          ],
          isLeft: true,
        ),
        _buildTimelineItem(
          title: 'Flutter Developer',
          organization: 'RASID - راصد',
          period: 'May 2024 - September 2024',
          location: 'Giza, Egypt',
          achievements: [
            'Developed and maintained mobile application features using Flutter and Dart.',
            'Worked with Clean Architecture and BLoC/Cubit for scalable codebases.',
            'Integrated REST APIs and Firebase services.',
            'Collaborated with designers and backend teams in an Agile environment.',
          ],
          isLeft: false,
        ),
        _buildTimelineItem(
          title: 'Flutter Development Trainee',
          organization: 'Google Developer Student Clubs (GDSC)',
          period: 'March 2023 - September 2023',
          location: 'Ismailia, Egypt',
          achievements: [
            'Completed intensive Flutter development training program.',
            'Built multiple mobile applications as part of hands-on projects.',
            'Learned Clean Architecture, state management, and best practices.',
            'Collaborated with peers on team-based development tasks.',
          ],
          isLeft: true,
        ),
        _buildTimelineItem(
          title: 'Freelance Flutter Developer & UI Designer',
          organization: 'Mostaql.com',
          period: 'March 2022 - September 2023',
          location: 'Remote',
          achievements: [
            'Completed 25+ projects with 4.9/5 client rating across various industries.',
            'Designed and implemented mobile UI screens using Flutter and Dart.',
            'Delivered responsive, pixel-perfect interfaces for iOS and Android apps.',
            'Recognized for quality work, timely delivery, and excellent client communication.',
          ],
          isLeft: false,
        ),
      ],
    );
  }

  Widget _buildMobileTimeline() {
    return Column(
      children: [
        _buildMobileTimelineItem(
          title: 'Military Service',
          organization: 'Egyptian Armed Forces',
          period: 'October 2024 - December 2025',
          location: 'Egypt',
          achievements: [
            'Completed mandatory military service with Excellent Conduct.',
          ],
        ),
        _buildMobileTimelineItem(
          title: 'Flutter Developer',
          organization: 'RASID - راصد',
          period: 'May 2024 - September 2024',
          location: 'Giza, Egypt',
          achievements: [
            'Developed and maintained mobile application features using Flutter and Dart.',
            'Worked with Clean Architecture and BLoC/Cubit for scalable codebases.',
            'Integrated REST APIs and Firebase services.',
            'Collaborated with designers and backend teams in an Agile environment.',
          ],
        ),
        _buildMobileTimelineItem(
          title: 'Flutter Development Trainee',
          organization: 'Google Developer Student Clubs (GDSC)',
          period: 'March 2023 - September 2023',
          location: 'Ismailia, Egypt',
          achievements: [
            'Completed intensive Flutter development training program.',
            'Built multiple mobile applications as part of hands-on projects.',
            'Learned Clean Architecture, state management, and best practices.',
            'Collaborated with peers on team-based development tasks.',
          ],
        ),
        _buildMobileTimelineItem(
          title: 'Freelance Flutter Developer & UI Designer',
          organization: 'Mostaql.com',
          period: 'March 2022 - September 2023',
          location: 'Remote',
          achievements: [
            'Completed 25+ projects with 4.9/5 client rating across various industries.',
            'Designed and implemented mobile UI screens using Flutter and Dart.',
            'Delivered responsive, pixel-perfect interfaces for iOS and Android apps.',
            'Recognized for quality work, timely delivery, and excellent client communication.',
          ],
        ),
      ],
    );
  }

  Widget _buildTimelineItem({
    required String title,
    required String organization,
    required String period,
    required String location,
    required List<String> achievements,
    required bool isLeft,
    bool isEducation = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isLeft) const Expanded(child: SizedBox()),
          if (!isLeft)
            Expanded(
              child: _buildTimelineCard(
                title: title,
                organization: organization,
                period: period,
                location: location,
                achievements: achievements,
                isEducation: isEducation,
              ),
            ),
          const SizedBox(width: 30),
          _buildTimelineConnector(),
          const SizedBox(width: 30),
          if (isLeft)
            Expanded(
              child: _buildTimelineCard(
                title: title,
                organization: organization,
                period: period,
                location: location,
                achievements: achievements,
                isEducation: isEducation,
              ),
            ),
          if (isLeft) const Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  Widget _buildMobileTimelineItem({
    required String title,
    required String organization,
    required String period,
    required String location,
    required List<String> achievements,
    bool isEducation = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTimelineConnector(),
          const SizedBox(width: 20),
          Expanded(
            child: _buildTimelineCard(
              title: title,
              organization: organization,
              period: period,
              location: location,
              achievements: achievements,
              isEducation: isEducation,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineConnector() {
    return Column(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: const Color(0xFF64ffda),
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFF0a192f), width: 3),
          ),
        ),
        Container(
          width: 2,
          height: 100,
          color: const Color(0xFF64ffda).withOpacity(0.3),
        ),
      ],
    );
  }

  Widget _buildTimelineCard({
    required String title,
    required String organization,
    required String period,
    required String location,
    required List<String> achievements,
    bool isEducation = false,
  }) {
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
        children: [
          Row(
            children: [
              Icon(
                isEducation ? Icons.school : Icons.work,
                color: const Color(0xFF64ffda),
                size: 24,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFccd6f6),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            organization,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
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
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  period,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: const Color(0xFF8892b0),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 15),
              const Icon(Icons.location_on, color: Color(0xFF8892b0), size: 14),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  location,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: const Color(0xFF8892b0),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ...achievements.map(
            (achievement) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '▹ ',
                    style: TextStyle(color: Color(0xFF64ffda), fontSize: 18),
                  ),
                  Expanded(
                    child: Text(
                      achievement,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
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
