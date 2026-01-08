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
          title: 'Freelance Flutter Developer',
          organization: 'Forsova',
          period: 'January 2026 - Present',
          location: 'United Arab Emirates',
          achievements: [
            'Develop Flutter mobile applications for client projects, implementing responsive UI, Clean Architecture.',
            'Collaborate with clients to gather requirements, plan features, and ensure scalable, maintainable code.',
          ],
          isLeft: true,
        ),
        _buildTimelineItem(
          title: 'Flutter Developer',
          organization: 'UneeQ Interns',
          period: 'December 2025 - Present',
          location: 'Cairo, Egypt',
          achievements: [
            'Develop and maintain Flutter features using Clean Architecture and Cubit-based state management.',
            'Collaborate with cross-functional remote teams in an Agile workflow using Git and GitHub.',
            'Participate in code reviews to improve code quality, consistency, and maintainability.',
            'Implement REST API integrations following best practices for scalability and performance.',
          ],
          isLeft: false,
        ),
        _buildTimelineItem(
          title: 'Flutter developer',
          organization: 'راصد - RASID',
          period: 'May 2024 - September 2024',
          location: 'Giza, Egypt',
          achievements: [
            'Contributed to an enterprise workforce management mobile application used in production.',
            'Implemented scalable features using Flutter, BLoC/Cubit, and RESTful APIs.',
            'Integrated Firebase services including Authentication and Firestore.',
            'Collaborated with backend developers and UI/UX designers in an Agile environment.',
          ],
          isLeft: true,
        ),
        _buildTimelineItem(
          title: 'Flutter Developer',
          organization: 'Google Developer Student Clubs (GDSC)',
          period: 'March 2023 - September 2023',
          location: 'Suez Canal University, Ismailia, Egypt',
          achievements: [
            'Completed an intensive Flutter development training program covering Clean Architecture and industry best practices.',
            'Built multiple mobile applications through hands-on, project-based learning.',
            'Collaborated with peers on team-based development tasks and structured state management.',
          ],
          isLeft: false,
        ),
        _buildTimelineItem(
          title: 'Freelance UI/UX & Digital Designer',
          organization: 'Mostaql',
          period: 'March 2022 - May 2024',
          location: 'Freelance',
          achievements: [
            'Delivered design projects including presentations, CVs, motion graphics, and promotional videos with high client satisfaction.',
            'Currently negotiating Flutter projects with clients, gaining experience in project planning and technical discussions.',
            'Developed transferable skills in UI/UX, client collaboration, and design-to-development planning.',
          ],
          isLeft: true,
        ),
      ],
    );
  }

  Widget _buildMobileTimeline() {
    return Column(
      children: [
        _buildMobileTimelineItem(
          title: 'Freelance Flutter Developer',
          organization: 'Forsova',
          period: 'January 2026 - Present',
          location: 'United Arab Emirates',
          achievements: [
            'Develop Flutter mobile applications for client projects, implementing responsive UI, Clean Architecture.',
            'Collaborate with clients to gather requirements, plan features, and ensure scalable, maintainable code.',
          ],
        ),
        _buildMobileTimelineItem(
          title: 'Flutter Developer',
          organization: 'UneeQ Interns',
          period: 'December 2025 - Present',
          location: 'Cairo, Egypt',
          achievements: [
            'Develop and maintain Flutter features using Clean Architecture and Cubit-based state management.',
            'Collaborate with cross-functional remote teams in an Agile workflow using Git and GitHub.',
            'Participate in code reviews to improve code quality, consistency, and maintainability.',
            'Implement REST API integrations following best practices for scalability and performance.',
          ],
        ),
        _buildMobileTimelineItem(
          title: 'Flutter developer',
          organization: 'راصد - RASID',
          period: 'May 2024 - September 2024',
          location: 'Giza, Egypt',
          achievements: [
            'Contributed to an enterprise workforce management mobile application used in production.',
            'Implemented scalable features using Flutter, BLoC/Cubit, and RESTful APIs.',
            'Integrated Firebase services including Authentication and Firestore.',
            'Collaborated with backend developers and UI/UX designers in an Agile environment.',
          ],
        ),
        _buildMobileTimelineItem(
          title: 'Flutter Developer',
          organization: 'Google Developer Student Clubs (GDSC)',
          period: 'March 2023 - September 2023',
          location: 'Suez Canal University, Ismailia, Egypt',
          achievements: [
            'Completed an intensive Flutter development training program covering Clean Architecture and industry best practices.',
            'Built multiple mobile applications through hands-on, project-based learning.',
            'Collaborated with peers on team-based development tasks and structured state management.',
          ],
        ),
        _buildMobileTimelineItem(
          title: 'Freelance UI/UX & Digital Designer',
          organization: 'Mostaql',
          period: 'March 2022 - May 2024',
          location: 'Freelance',
          achievements: [
            'Delivered design projects including presentations, CVs, motion graphics, and promotional videos with high client satisfaction.',
            'Currently negotiating Flutter projects with clients, gaining experience in project planning and technical discussions.',
            'Developed transferable skills in UI/UX, client collaboration, and design-to-development planning.',
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
