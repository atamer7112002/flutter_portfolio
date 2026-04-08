import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../utils/constants.dart';
import '../utils/responsive_layout.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection>
    with SingleTickerProviderStateMixin {
  int _selectedCategory = 0;
  late AnimationController _progressController;
  bool _hasAnimated = false;

  final List<Map<String, dynamic>> _categories = [
    {
      'label': 'Flutter & Mobile',
      'icon': Icons.phone_android,
      'skills': [
        {'name': 'Flutter / Dart', 'percent': 92},
        {'name': 'BLoC / Cubit', 'percent': 90},
        {'name': 'Clean Architecture', 'percent': 90},
        {'name': 'Responsive UI', 'percent': 92},
        {'name': 'MVVM', 'percent': 85},
        {'name': 'Method Channels', 'percent': 82},
        {'name': 'Modular Design', 'percent': 88},
        {'name': 'Monorepo Architecture', 'percent': 85},
      ],
    },
    {
      'label': 'Deployment & CI/CD',
      'icon': Icons.rocket_launch,
      'skills': [
        {'name': 'CI/CD Pipelines', 'percent': 85},
        {'name': 'Flavor Config', 'percent': 88},
        {'name': 'Envied (Safe Env)', 'percent': 90},
        {'name': 'Shorebird (OTA)', 'percent': 82},
        {'name': 'App Store Connect', 'percent': 85},
        {'name': 'Google Play Console', 'percent': 88},
      ],
    },
    {
      'label': 'Architecture & Testing',
      'icon': Icons.architecture,
      'skills': [
        {'name': 'Clean Architecture', 'percent': 90},
        {'name': 'SOLID Principles', 'percent': 88},
        {'name': 'Unit Testing', 'percent': 82},
        {'name': 'Performance Opt', 'percent': 85},
        {'name': 'Memory Profiling', 'percent': 80},
        {'name': 'Repository Pattern', 'percent': 90},
      ],
    },
    {
      'label': 'Tools & Integration',
      'icon': Icons.build,
      'skills': [
        {'name': 'Git & GitHub', 'percent': 90},
        {'name': 'REST APIs / Dio', 'percent': 92},
        {'name': 'Firebase Suite', 'percent': 88},
        {'name': 'Postman', 'percent': 85},
        {'name': 'Android Studio', 'percent': 90},
        {'name': 'Retrofit', 'percent': 85},
      ],
    },
  ];

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction > 0.2 && !_hasAnimated) {
      _hasAnimated = true;
      _progressController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('skills-section'),
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
            _buildCategoryTabs(),
            const SizedBox(height: 50),
            _buildSkillsGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Column(
      children: [
        Text(
          'Technical Expertise',
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

  Widget _buildCategoryTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(_categories.length, (index) {
          final category = _categories[index];
          final isSelected = _selectedCategory == index;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: _CategoryTab(
              label: category['label'] as String,
              icon: category['icon'] as IconData,
              isSelected: isSelected,
              onTap: () {
                setState(() => _selectedCategory = index);
                _progressController.reset();
                _progressController.forward();
              },
            ),
          );
        }),
      ),
    );
  }

  Widget _buildSkillsGrid() {
    final skills =
        _categories[_selectedCategory]['skills'] as List<Map<String, dynamic>>;
    final crossAxisCount = Responsive.getValue(
      context,
      mobile: 2,
      tablet: 3,
      desktop: 5,
    );

    return GridView.builder(
      key: ValueKey(_selectedCategory),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.85,
      ),
      itemCount: skills.length,
      itemBuilder: (context, index) {
        return _buildSkillCard(skills[index]);
      },
    );
  }

  Widget _buildSkillCard(Map<String, dynamic> skill) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _CircularProgress(
            percent: (skill['percent'] as int) / 100.0,
            animation: _progressController,
          ),
          const SizedBox(height: 16),
          Text(
            skill['name'] as String,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _CategoryTab extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryTab({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<_CategoryTab> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: widget.isSelected
                ? AppColors.primary
                : (_isHovered
                      ? AppColors.primary.withValues(alpha: 0.1)
                      : Colors.transparent),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: widget.isSelected ? AppColors.primary : AppColors.border,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                size: 18,
                color: widget.isSelected
                    ? AppColors.background
                    : AppColors.textSecondary,
              ),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: widget.isSelected
                      ? AppColors.background
                      : AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CircularProgress extends StatelessWidget {
  final double percent;
  final AnimationController animation;

  const _CircularProgress({required this.percent, required this.animation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final animatedPercent = percent * animation.value;
        return SizedBox(
          width: 70,
          height: 70,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: const Size(70, 70),
                painter: _CircularProgressPainter(
                  progress: animatedPercent,
                  backgroundColor: AppColors.border,
                  progressColor: AppColors.primary,
                  strokeWidth: 4,
                ),
              ),
              Text(
                '${(animatedPercent * 100).toInt()}%',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  final double progress;
  final Color backgroundColor;
  final Color progressColor;
  final double strokeWidth;

  _CircularProgressPainter({
    required this.progress,
    required this.backgroundColor,
    required this.progressColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // Background circle
    final bgPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, radius, bgPaint);

    // Progress arc
    final progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _CircularProgressPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
