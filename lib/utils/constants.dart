import 'package:flutter/material.dart';

/// App color palette — matching the dark space-tech design
class AppColors {
  // Backgrounds
  static const Color background = Color(0xFF0a0a0f);
  static const Color cardBackground = Color(0xFF111827);
  static const Color cardBackgroundLight = Color(0xFF1a1a2e);
  static const Color surfaceDark = Color(0xFF0f172a);

  // Primary accent (cyan / sky blue)
  static const Color primary = Color(0xFF00d4ff);
  static const Color primaryDark = Color(0xFF0891b2);

  // Secondary accent (emerald / green)
  static const Color secondary = Color(0xFF10b981);
  static const Color secondaryLight = Color(0xFF34d399);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF00d4ff), Color(0xFF10b981)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient nameGradient = LinearGradient(
    colors: [
      Color(0xFF00d4ff),
      Color(0xFF8b5cf6),
      Color(0xFFec4899),
      Color(0xFFffffff),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  // Text
  static const Color textPrimary = Color(0xFFffffff);
  static const Color textSecondary = Color(0xFF9ca3af);
  static const Color textMuted = Color(0xFF6b7280);

  // Borders
  static const Color border = Color(0xFF1e293b);
  static const Color borderLight = Color(0xFF374151);

  // Status / badges
  static const Color badgePurple = Color(0xFF8b5cf6);
  static const Color badgePink = Color(0xFFec4899);
  static const Color badgeGreen = Color(0xFF10b981);
  static const Color badgeCyan = Color(0xFF00d4ff);

  // Particles
  static const Color particleCyan = Color(0xFF00d4ff);
  static const Color particlePink = Color(0xFFec4899);
  static const Color particlePurple = Color(0xFF8b5cf6);
}

/// App spacing constants
class AppSpacing {
  static const double sectionVertical = 100.0;
  static const double sectionHorizontalDesktop = 120.0;
  static const double sectionHorizontalTablet = 60.0;
  static const double sectionHorizontalMobile = 24.0;

  static const double cardPadding = 30.0;
  static const double cardRadius = 16.0;
  static const double cardRadiusSmall = 12.0;

  static const double navHeight = 70.0;
}

/// App text styles — reusable typography
class AppTextStyles {
  static const TextStyle sectionLabel = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 3.0,
    color: AppColors.primary,
  );

  static const TextStyle sectionHeading = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    color: AppColors.textSecondary,
    height: 1.7,
  );
}
