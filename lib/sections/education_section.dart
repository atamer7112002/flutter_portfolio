import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../utils/constants.dart';
import '../utils/responsive_layout.dart';

class EducationSection extends StatefulWidget {
  const EducationSection({super.key});

  @override
  State<EducationSection> createState() => _EducationSectionState();
}

class _EducationSectionState extends State<EducationSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction > 0.2 && !_hasAnimated) {
      _hasAnimated = true;
      if (MediaQuery.disableAnimationsOf(context)) {
        _controller.value = 1;
      } else {
        _controller.forward();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('education-section'),
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
        child: Column(
          children: [
            _buildSectionHeader(),
            const SizedBox(height: 50),
            _buildEducationCard(
              title: 'Bachelor of Computer Science',
              institution:
                  'Faculty of Computers and Informatics — Suez Canal University',
              location: 'Ismailia, Egypt',
              period: 'Sep 2019 – 2024',
              icon: Icons.school,
            ),
            const SizedBox(height: 24),
            _buildEducationCard(
              title: 'Mobile Development (Cross-Platform & iOS)',
              institution: 'Information Technology Institute (ITI)',
              location: 'Ismailia, Egypt',
              period: '2022 – 2024',
              icon: Icons.developer_mode,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader() {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
      child: Column(
        children: [
          Text(
            'EDUCATION',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 3,
              color: AppColors.badgeGreen,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Academic Background',
            style: TextStyle(
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
      ),
    );
  }

  Widget _buildEducationCard({
    required String title,
    required String institution,
    required String location,
    required String period,
    required IconData icon,
  }) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.9, curve: Curves.easeOut),
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
            border: Border.all(color: AppColors.border),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.05),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            children: [
              // Icon
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.secondary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  icon,
                  color: AppColors.secondary,
                  size: 30,
                ),
              ),
              const SizedBox(width: 24),
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      institution,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      location,
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              // Date badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  period,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
