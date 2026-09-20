import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../utils/constants.dart';
import '../utils/responsive_layout.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection>
    with SingleTickerProviderStateMixin {
  String _selectedFilter = 'All Projects';
  late AnimationController _controller;
  bool _hasAnimated = false;

  final List<Map<String, dynamic>> _projects = [
    {
      'title': 'BayToStay — Travel & Booking',
      'description':
          'Production booking platform managing 500+ tourism units. Owned maps, payments and wallet, deep links, push notifications, performance profiling, and production hot-fixes.',
      'tech': ['Flutter', 'MVVM', 'FCM', 'CI/CD', 'Shorebird'],
      'category': 'Flutter',
      'badge': 'Production',
      'badgeColor': AppColors.badgePurple,
      'icon': Icons.travel_explore,
      'iconColor': AppColors.badgePurple,
      'github': null,
      'android':
          'https://play.google.com/store/apps/details?id=com.runsoft.bay_to_stay',
      'ios': 'https://apps.apple.com/eg/app/bay-to-stay/id6743452055',
    },
    {
      'title': 'Masane3 Online — B2B Marketplace',
      'description':
          'Large-scale B2B marketplace built in a monorepo, with scalable networking, robust error handling, BLoC-driven supplier and catalog flows, and automated environment switching.',
      'tech': ['Flutter', 'BLoC', 'Monorepo', 'Envied'],
      'category': 'Flutter',
      'badge': 'Production',
      'badgeColor': AppColors.badgeCyan,
      'icon': Icons.shopping_bag,
      'iconColor': AppColors.badgeCyan,
      'github': null,
      'android':
          'https://play.google.com/store/apps/details?id=com.ValuxApps.Masane3Online',
      'ios':
          'https://apps.apple.com/eg/app/%D9%85%D8%B5%D8%A7%D9%86%D8%B9-%D8%A7%D9%88%D9%86%D9%84%D8%A7%D9%8A%D9%86/id1453506308',
    },
    {
      'title': 'FinTrackr | Secure Financial SMS Sync',
      'description':
          'Personal finance app that reads and categorizes financial SMS via native Android Method Channels, handles background detection, and protects financial data with biometric authentication.',
      'tech': ['Flutter', 'BLoC', 'Method Channels', 'Biometric Auth'],
      'category': 'Flutter',
      'badge': 'Security',
      'badgeColor': AppColors.badgePurple,
      'icon': Icons.account_balance_wallet,
      'iconColor': AppColors.badgePurple,
      'github': null,
    },
    {
      'title': 'Wahag Al-Elm App',
      'description':
          'Educational mobile application with reusable UI components and responsive layouts. Integrated REST APIs with a focus on performance, stability, and consistent theming.',
      'tech': ['Flutter', 'REST APIs', 'Responsive UI', 'Theming'],
      'category': 'Flutter',
      'badge': 'Education',
      'badgeColor': AppColors.badgeCyan,
      'icon': Icons.school,
      'iconColor': AppColors.badgeCyan,
      'github': 'https://github.com/atamer7112002/wahag_elelm',
    },
    {
      'title': 'RASID Mobile App',
      'description':
          'Enterprise workforce management application using Clean Architecture, BLoC/Cubit, REST APIs, and Firebase services for authentication and real-time updates.',
      'tech': ['Flutter', 'BLoC', 'Firebase', 'REST APIs'],
      'category': 'Flutter',
      'badge': 'Enterprise',
      'badgeColor': AppColors.badgePurple,
      'icon': Icons.business,
      'iconColor': AppColors.badgePurple,
      'github': null,
    },
    {
      'title': 'Renting System App',
      'description':
          'Property renting application with responsive UI, structured navigation, RESTful APIs for real-time property data, and Shared Preferences for local settings.',
      'tech': ['Flutter', 'REST APIs', 'Shared Preferences'],
      'category': 'Flutter',
      'badge': 'Utility',
      'badgeColor': AppColors.badgeCyan,
      'icon': Icons.home_work,
      'iconColor': AppColors.badgeCyan,
      'github': 'https://github.com/atamer7112002/Renting_system_app',
    },
  ];

  final List<String> _filters = ['All Projects', 'Flutter'];

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
    if (info.visibleFraction > 0.15 && !_hasAnimated) {
      _hasAnimated = true;
      if (MediaQuery.disableAnimationsOf(context)) {
        _controller.value = 1;
      } else {
        _controller.forward();
      }
    }
  }

  List<Map<String, dynamic>> get _filteredProjects {
    if (_selectedFilter == 'All Projects') return _projects;
    return _projects.where((p) => p['category'] == _selectedFilter).toList();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('projects-section'),
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
            const SizedBox(height: 40),
            _buildFilterTabs(),
            const SizedBox(height: 40),
            _buildProjectsGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Column(
      children: [
        Text(
          'FEATURED PROJECTS',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 3,
            color: AppColors.badgePink,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Selected works from my journey',
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
    );
  }

  Widget _buildFilterTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _filters.map((filter) {
        final isSelected = _selectedFilter == filter;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: _FilterChip(
            label: filter,
            isSelected: isSelected,
            onTap: () => setState(() => _selectedFilter = filter),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildProjectsGrid() {
    final projects = _filteredProjects;
    final crossAxisCount = Responsive.getValue(
      context,
      mobile: 1,
      tablet: 2,
      desktop: 3,
    );

    return GridView.builder(
      key: ValueKey(_selectedFilter),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        mainAxisExtent: Responsive.getValue(
          context,
          mobile: 500,
          tablet: 520,
          desktop: 510,
        ),
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return _ProjectCard(project: projects[index]);
      },
    );
  }
}

class _FilterChip extends StatefulWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_FilterChip> createState() => _FilterChipState();
}

class _FilterChipState extends State<_FilterChip> {
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
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
          decoration: BoxDecoration(
            gradient: widget.isSelected ? AppColors.primaryGradient : null,
            color: widget.isSelected
                ? null
                : (_isHovered
                      ? AppColors.primary.withValues(alpha: 0.1)
                      : Colors.transparent),
            borderRadius: BorderRadius.circular(30),
            border: widget.isSelected
                ? null
                : Border.all(color: AppColors.border),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                _getFilterIcon(widget.label),
                size: 16,
                color: widget.isSelected
                    ? AppColors.background
                    : AppColors.textSecondary,
              ),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: TextStyle(
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

  IconData _getFilterIcon(String label) {
    switch (label) {
      case 'All Projects':
        return Icons.grid_view;
      case 'Flutter':
        return Icons.flutter_dash;
      case 'Full Stack':
        return Icons.layers;
      default:
        return Icons.code;
    }
  }
}

class _ProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;

  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final project = widget.project;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: _isHovered
            ? Matrix4.translationValues(0, -8, 0)
            : Matrix4.identity(),
        padding: const EdgeInsets.all(28),
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
                    color: AppColors.primary.withValues(alpha: 0.1),
                    blurRadius: 30,
                    offset: const Offset(0, 15),
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon + Badge row
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: (project['iconColor'] as Color).withValues(
                      alpha: 0.15,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    project['icon'] as IconData,
                    color: project['iconColor'] as Color,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: (project['badgeColor'] as Color).withValues(
                      alpha: 0.2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    project['badge'] as String,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: project['badgeColor'] as Color,
                    ),
                  ),
                ),
                const Spacer(),
                if (project['github'] != null)
                  IconButton(
                    icon: const FaIcon(
                      FontAwesomeIcons.github,
                      color: AppColors.textSecondary,
                      size: 20,
                    ),
                    onPressed: () async {
                      final uri = Uri.parse(project['github'] as String);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(
                          uri,
                          mode: LaunchMode.externalApplication,
                        );
                      }
                    },
                  ),
              ],
            ),
            const SizedBox(height: 20),
            // Title
            Text(
              project['title'] as String,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            // Description
            Flexible(
              child: Text(
                project['description'] as String,
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                  height: 1.6,
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 16),
            // Tech tags
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: (project['tech'] as List<String>).map((tech) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceDark,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Text(
                    tech,
                    style: TextStyle(
                      fontSize: 11,
                      color: AppColors.textMuted,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
            ),
            if (project['android'] != null || project['ios'] != null) ...[
              const SizedBox(height: 18),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  if (project['android'] != null)
                    _StoreButton(
                      label: 'Google Play',
                      icon: Icons.android,
                      url: project['android'] as String,
                    ),
                  if (project['ios'] != null)
                    _StoreButton(
                      label: 'App Store',
                      icon: Icons.apple,
                      url: project['ios'] as String,
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _StoreButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final String url;

  const _StoreButton({
    required this.label,
    required this.icon,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      },
      icon: Icon(icon, size: 17),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.textPrimary,
        side: const BorderSide(color: AppColors.borderLight),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      ),
    );
  }
}
