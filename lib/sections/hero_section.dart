import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/constants.dart';
import '../utils/responsive_layout.dart';
import '../widgets/particle_background.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback? onViewWork;
  final VoidCallback? onContact;

  const HeroSection({super.key, this.onViewWork, this.onContact});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _scrollIndicatorController;
  late Animation<double> _badgeFade;
  late Animation<double> _nameFade;
  late Animation<double> _titleFade;
  late Animation<double> _bioFade;
  late Animation<double> _buttonsFade;
  late Animation<double> _imageFade;
  late Animation<double> _scrollBounce;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _badgeFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
      ),
    );
    _nameFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: const Interval(0.1, 0.4, curve: Curves.easeOut),
      ),
    );
    _titleFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: const Interval(0.2, 0.5, curve: Curves.easeOut),
      ),
    );
    _bioFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: const Interval(0.3, 0.6, curve: Curves.easeOut),
      ),
    );
    _buttonsFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: const Interval(0.4, 0.7, curve: Curves.easeOut),
      ),
    );
    _imageFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: const Interval(0.2, 0.6, curve: Curves.easeOut),
      ),
    );

    _scrollIndicatorController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _scrollBounce = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(
        parent: _scrollIndicatorController,
        curve: Curves.easeInOut,
      ),
    );

    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scrollIndicatorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ParticleBackground(
      child: ResponsiveLayout(
        mobile: _buildMobileHero(),
        desktop: _buildDesktopHero(),
      ),
    );
  }

  Widget _buildDesktopHero() {
    return Container(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.getValue(context, mobile: 24, desktop: 120),
        vertical: 80,
      ),
      child: Column(
        children: [
          const SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildWelcomeBadge(),
                      const SizedBox(height: 30),
                      _buildName(),
                      const SizedBox(height: 16),
                      _buildTitle(),
                      const SizedBox(height: 16),
                      _buildBio(),
                      const SizedBox(height: 40),
                      _buildActionButtons(),
                    ],
                  ),
                ),
                const SizedBox(width: 60),
                Expanded(flex: 2, child: _buildProfileImage()),
              ],
            ),
          ),
          const SizedBox(height: 60),
          _buildScrollIndicator(),
        ],
      ),
    );
  }

  Widget _buildMobileHero() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 80),
          Center(child: _buildProfileImage(size: 180)),
          const SizedBox(height: 30),
          _buildWelcomeBadge(),
          const SizedBox(height: 20),
          _buildName(fontSize: 36),
          const SizedBox(height: 10),
          _buildTitle(fontSize: 22),
          const SizedBox(height: 12),
          _buildBio(),
          const SizedBox(height: 30),
          _buildActionButtons(isMobile: true),
          const SizedBox(height: 40),
          Center(child: _buildScrollIndicator()),
        ],
      ),
    );
  }

  Widget _buildWelcomeBadge() {
    return FadeTransition(
      opacity: _badgeFade,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.4)),
          borderRadius: BorderRadius.circular(30),
          color: AppColors.primary.withValues(alpha: 0.08),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('👋', style: TextStyle(fontSize: 16)),
            const SizedBox(width: 8),
            Text(
              'Welcome to my portfolio',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildName({double fontSize = 72}) {
    return FadeTransition(
      opacity: _nameFade,
      child: ShaderMask(
        shaderCallback: (bounds) => AppColors.nameGradient.createShader(bounds),
        child: Text(
          'AHMED TAMER\nAHMED',
          style: GoogleFonts.poppins(
            fontSize: fontSize,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            height: 1.05,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }

  Widget _buildTitle({double fontSize = 28}) {
    return FadeTransition(
      opacity: _titleFade,
      child: Text(
        'Mobile Software Engineer',
        style: GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),
    );
  }

  Widget _buildBio() {
    return FadeTransition(
      opacity: _bioFade,
      child: Text(
        'Mobile Software Engineer specialized in building production-grade Flutter applications with Clean Architecture, modular systems, and CI/CD workflows across Android and iOS.',
        style: GoogleFonts.poppins(
          fontSize: 16,
          color: AppColors.textSecondary,
          height: 1.6,
        ),
      ),
    );
  }

  Widget _buildActionButtons({bool isMobile = false}) {
    return FadeTransition(
      opacity: _buttonsFade,
      child: Wrap(
        spacing: 16,
        runSpacing: 12,
        children: [
          _HeroButton(
            label: 'View My Work',
            icon: Icons.arrow_downward,
            isPrimary: true,
            onTap: widget.onViewWork,
          ),
          _HeroButton(
            label: 'Get In Touch',
            icon: Icons.mail_outline,
            isPrimary: false,
            onTap: widget.onContact,
          ),
          _HeroButton(
            label: 'Download CV',
            icon: Icons.download,
            isPrimary: false,
            onTap: () => _launchURL(
              'https://drive.google.com/drive/folders/15tJJYPiZhWWubysCwx0PzOcmtfuxsOBY',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage({double size = 300}) {
    return FadeTransition(
      opacity: _imageFade,
      child: Center(
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.3),
                blurRadius: 60,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Outer glow ring
              Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: SweepGradient(
                    colors: [
                      AppColors.primary,
                      AppColors.primary.withValues(alpha: 0.2),
                      AppColors.primary.withValues(alpha: 0),
                      AppColors.primary.withValues(alpha: 0.2),
                      AppColors.primary,
                    ],
                  ),
                ),
              ),
              // Dark inner circle
              Container(
                width: size - 12,
                height: size - 12,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.background,
                ),
              ),
              // Profile image
              ClipOval(
                child: SizedBox(
                  width: size - 24,
                  height: size - 24,
                  child: Image.asset(
                    'assets/images/profile.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: AppColors.cardBackground,
                      child: Icon(
                        Icons.person,
                        size: size * 0.4,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScrollIndicator() {
    return AnimatedBuilder(
      animation: _scrollBounce,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _scrollBounce.value),
          child: Column(
            children: [
              Text(
                'Scroll to explore',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: AppColors.textMuted,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: 24,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.textMuted, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(
                      Icons.circle,
                      size: 6,
                      color: AppColors.textMuted,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}

class _HeroButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool isPrimary;
  final VoidCallback? onTap;

  const _HeroButton({
    required this.label,
    required this.icon,
    required this.isPrimary,
    this.onTap,
  });

  @override
  State<_HeroButton> createState() => _HeroButtonState();
}

class _HeroButtonState extends State<_HeroButton> {
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
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            color: widget.isPrimary
                ? (_isHovered
                      ? AppColors.primary.withValues(alpha: 0.9)
                      : AppColors.primary)
                : (_isHovered
                      ? AppColors.primary.withValues(alpha: 0.1)
                      : Colors.transparent),
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.5),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: widget.isPrimary
                      ? AppColors.background
                      : AppColors.textPrimary,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                widget.icon,
                size: 18,
                color: widget.isPrimary
                    ? AppColors.background
                    : AppColors.textPrimary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
