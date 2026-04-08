import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../utils/constants.dart';
import '../utils/responsive_layout.dart';

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({super.key});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _hasAnimated = false;

  final List<Map<String, dynamic>> _experiences = [
    {
      'title': 'Mobile Software Engineer',
      'company': 'Runsoft',
      'period': 'Feb 2026 – Present',
      'location': 'Cairo, Egypt',
      'description':
          'Contributing to the development of large-scale production mobile systems and scalable feature planning.',
      'achievements': [
        'Implementing structured networking layers with robust error handling and type-safe environment configurations using Envied',
        'Working within a monorepo architecture supporting multiple applications across shared and feature-specific modules',
        'Contributing to CI/CD workflows and automated release pipelines to streamline production delivery',
        'Performing performance optimization and runtime improvements to enhance stability at scale',
        'Participating in code reviews and modular refactoring to uphold code quality',
      ],
    },
    {
      'title': 'Freelance Mobile Developer',
      'company': 'Forsova',
      'period': 'Jan 2026 – Present',
      'location': 'Remote / UAE',
      'description':
          'Developing Flutter mobile applications using Clean Architecture and BLoC/Cubit.',
      'achievements': [
        'Collaborated with clients to gather requirements and deliver scalable solutions',
        'Built responsive UI and integrated REST APIs with focus on maintainability',
        'Managed end-to-end delivery including testing, feedback integration, and deployment',
      ],
    },
    {
      'title': 'Flutter Developer Intern',
      'company': 'راصد – RASID',
      'period': 'May 2024 – Sep 2024',
      'location': 'Giza, Egypt',
      'description':
          'Contributed to an enterprise workforce management mobile application used in production.',
      'achievements': [
        'Implemented scalable features using Flutter, BLoC/Cubit, and RESTful APIs',
        'Integrated Firebase services including Authentication and Firestore',
        'Collaborated with backend developers and UI/UX designers in an Agile environment',
      ],
    },
    {
      'title': 'Flutter Developer',
      'company': 'Google Developer Student Clubs (GDSC)',
      'period': 'Mar 2023 – Sep 2023',
      'location': 'Suez Canal University',
      'description':
          'Completed intensive Flutter development training covering Clean Architecture and best practices.',
      'achievements': [
        'Completed intensive Flutter training covering Clean Architecture and state management',
        'Built multiple mobile applications through hands-on project-based learning',
        'Collaborated with peers on team-based development projects',
      ],
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction > 0.15 && !_hasAnimated) {
      _hasAnimated = true;
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('experience-section'),
      onVisibilityChanged: _onVisibilityChanged,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.getValue(
            context,
            mobile: AppSpacing.sectionHorizontalMobile,
            desktop: AppSpacing.sectionHorizontalDesktop,
          ),
          vertical: AppSpacing.sectionVertical,
        ),
        color: AppColors.surfaceDark,
        child: Column(
          children: [
            _buildSectionHeader(),
            const SizedBox(height: 60),
            ..._experiences.asMap().entries.map((entry) {
              return _buildTimelineItem(entry.key, entry.value);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Column(
      children: [
        Text(
          'EXPERIENCE',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 3,
            color: AppColors.badgeGreen,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'My Journey',
          style: GoogleFonts.poppins(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: 60,
          height: 4,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }

  Widget _buildTimelineItem(int index, Map<String, dynamic> exp) {
    final isDesktop = Responsive.isDesktop(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: isDesktop
          ? _buildDesktopTimelineItem(index, exp)
          : _buildMobileTimelineItem(index, exp),
    );
  }

  Widget _buildDesktopTimelineItem(int index, Map<String, dynamic> exp) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline dot
        Padding(
          padding: const EdgeInsets.only(top: 28),
          child: Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: index == 0 ? AppColors.secondary : AppColors.primary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: (index == 0 ? AppColors.secondary : AppColors.primary)
                      .withValues(alpha: 0.4),
                  blurRadius: 8,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 24),
        // Card with left border as timeline line
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 30),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: AppColors.border, width: 2),
              ),
            ),
            padding: const EdgeInsets.only(left: 20),
            child: _buildExperienceCard(exp),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileTimelineItem(int index, Map<String, dynamic> exp) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline dot
        Padding(
          padding: const EdgeInsets.only(top: 28),
          child: Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: index == 0 ? AppColors.secondary : AppColors.primary,
              shape: BoxShape.circle,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: AppColors.border, width: 2),
              ),
            ),
            padding: const EdgeInsets.only(left: 16),
            child: _buildExperienceCard(exp),
          ),
        ),
      ],
    );
  }

  Widget _buildExperienceCard(Map<String, dynamic> exp) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Period badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.3),
              ),
            ),
            child: Text(
              exp['period'] as String,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Title
          Text(
            exp['title'] as String,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          // Company
          Text(
            exp['company'] as String,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.secondary,
            ),
          ),
          const SizedBox(height: 16),
          // Description
          Text(
            exp['description'] as String,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 16),
          // Achievements
          ...(exp['achievements'] as List<String>).map((achievement) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    margin: const EdgeInsets.only(top: 8, right: 12),
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      achievement,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
