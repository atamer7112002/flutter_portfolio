import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../utils/constants.dart';
import '../utils/responsive_layout.dart';

class CertificationsSection extends StatefulWidget {
  const CertificationsSection({super.key});

  @override
  State<CertificationsSection> createState() => _CertificationsSectionState();
}

class _CertificationsSectionState extends State<CertificationsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _hasAnimated = false;

  final List<Map<String, String>> _certifications = const [
    {
      'title': 'CS50x: Introduction to Computer Science',
      'issuer': 'Harvard University',
      'year': '2022',
      'icon': '🎓',
    },
    {
      'title': 'Flutter Certification',
      'issuer': 'Google Developer Student Clubs (GDSC)',
      'year': '2023',
      'icon': '🏆',
    },
    {
      'title': 'Flutter Development Bootcamp',
      'issuer': 'Udemy',
      'year': '2023',
      'icon': '📱',
    },
  ];

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
      key: const Key('certifications-section'),
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
            const SizedBox(height: 50),
            _buildCertGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader() {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
      ),
      child: Column(
        children: [
          Text(
            'CERTIFICATIONS',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 3,
              color: AppColors.badgePurple,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Professional Credentials',
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

  Widget _buildCertGrid() {
    final crossAxisCount = Responsive.getValue(
      context,
      mobile: 1,
      tablet: 2,
      desktop: 2,
    );

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: Responsive.getValue(
          context,
          mobile: 2.5,
          desktop: 3.5,
        ),
      ),
      itemCount: _certifications.length,
      itemBuilder: (context, index) {
        return _CertCard(cert: _certifications[index]);
      },
    );
  }
}

class _CertCard extends StatefulWidget {
  final Map<String, String> cert;

  const _CertCard({required this.cert});

  @override
  State<_CertCard> createState() => _CertCardState();
}

class _CertCardState extends State<_CertCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          border: Border.all(
            color: _isHovered
                ? AppColors.primary.withValues(alpha: 0.3)
                : AppColors.border,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ]
              : [],
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  widget.cert['icon']!,
                  style: const TextStyle(fontSize: 22),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.cert['title']!,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.cert['issuer']!,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                widget.cert['year']!,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
