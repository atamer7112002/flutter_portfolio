import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/responsive_layout.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  final List<Map<String, dynamic>> skills = const [
    {'name': 'Flutter', 'icon': Icons.flutter_dash},
    {'name': 'Dart', 'icon': Icons.code},
    {'name': 'Clean Architecture', 'icon': Icons.architecture},
    {'name': 'MVVM Pattern', 'icon': Icons.view_module},
    {'name': 'Repository Pattern', 'icon': Icons.layers},
    {'name': 'BLoC/Cubit', 'icon': Icons.settings_input_component},
    {'name': 'GetX', 'icon': Icons.terminal},
    {'name': 'Firebase', 'icon': Icons.local_fire_department},
    {'name': 'Cloud Firestore', 'icon': Icons.cloud},
    {'name': 'Firebase Auth', 'icon': Icons.security},
    {'name': 'Firebase Storage', 'icon': Icons.storage},
    {'name': 'RESTful APIs', 'icon': Icons.api},
    {'name': 'JSON Parsing', 'icon': Icons.data_object},
    {'name': 'Hive', 'icon': Icons.storage},
    {'name': 'Shared Preferences', 'icon': Icons.save},
    {'name': 'Git & GitHub', 'icon': Icons.code},
    {'name': 'Postman', 'icon': Icons.send},
    {'name': 'Android Studio', 'icon': Icons.android},
    {'name': 'VS Code', 'icon': Icons.code_off},
    {'name': 'Responsive UI', 'icon': Icons.devices},
    {'name': 'Material Design', 'icon': Icons.palette},
    {'name': 'Custom Animations', 'icon': Icons.animation},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.getValue(context, mobile: 30, desktop: 100),
        vertical: 80,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF112240).withOpacity(0.3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Skills & Technologies'),
          const SizedBox(height: 60),
          _buildSkillsGrid(context),
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

  Widget _buildSkillsGrid(BuildContext context) {
    final crossAxisCount = Responsive.getValue(context, mobile: 2, desktop: 4);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 2.5,
      ),
      itemCount: skills.length,
      itemBuilder: (context, index) {
        return _buildSkillCard(skills[index]);
      },
    );
  }

  Widget _buildSkillCard(Map<String, dynamic> skill) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: const Color(0xFF112240),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF64ffda).withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF64ffda).withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            skill['icon'] as IconData,
            color: const Color(0xFF64ffda),
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              skill['name'] as String,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color(0xFFccd6f6),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
