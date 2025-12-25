import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/responsive_layout.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  final List<Map<String, dynamic>> projects = const [
    {
      'title': 'Nexus Books App',
      'description':
          'Book discovery app with browsing and search features using Flutter, Dio, Google Books API, BLoC/Cubit, and GetIt.',
      'tech': ['Flutter', 'Dio', 'Google Books API', 'BLoC/Cubit', 'GetIt'],
      'github': 'https://github.com/atamer7112002/Nexus_book_app',
      'status': 'In Progress',
    },
    {
      'title': 'RASID Mobile App',
      'description':
          'Enterprise workforce management app built with Flutter using Clean Architecture, BLoC/Cubit, REST APIs, and Firebase.',
      'tech': [
        'Flutter',
        'Clean Architecture',
        'BLoC/Cubit',
        'REST APIs',
        'Firebase',
      ],
      'github': null,
      'status': 'Company Project',
    },
    {
      'title': 'Renting System App',
      'description':
          'Property renting app with search feature built using Flutter, REST APIs, and responsive UI.',
      'tech': ['Flutter', 'REST APIs', 'Responsive UI'],
      'github': 'https://github.com/atamer7112002/Renting_system_app',
      'status': 'Completed',
    },
    {
      'title': 'Tick Notes App',
      'description':
          'Offline-first note-taking app developed with Flutter, Hive, and BLoC/Cubit.',
      'tech': ['Flutter', 'Hive', 'BLoC/Cubit'],
      'github': 'https://github.com/atamer7112002/tick_notes_app',
      'status': 'Completed',
    },
    {
      'title': 'Pura Store App',
      'description':
          'E-commerce mobile app with product management built using Flutter, REST APIs, Dio, and state management.',
      'tech': ['Flutter', 'REST APIs', 'Dio', 'State Management'],
      'github': 'https://github.com/atamer7112002/pura_store_app',
      'status': 'Completed',
    },
    {
      'title': 'Nebula Chat App',
      'description':
          'Real-time messaging app implemented with Flutter, Firebase Authentication, Firestore, and Firebase Storage.',
      'tech': ['Flutter', 'Firebase Auth', 'Firestore', 'Firebase Storage'],
      'github': 'https://github.com/atamer7112002/nebula_chat_app',
      'status': 'Completed',
    },
  ];

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
          _buildSectionTitle('Featured Projects'),
          const SizedBox(height: 60),
          _buildProjectsGrid(context),
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

  Widget _buildProjectsGrid(BuildContext context) {
    final crossAxisCount = Responsive.getValue(context, mobile: 1, desktop: 2);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
        childAspectRatio: Responsive.getValue(
          context,
          mobile: 0.85,
          desktop: 1.2,
        ),
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return _buildProjectCard(projects[index]);
      },
    );
  }

  Widget _buildProjectCard(Map<String, dynamic> project) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        padding: const EdgeInsets.all(30),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.folder_open,
                  color: Color(0xFF64ffda),
                  size: 40,
                ),
                Row(
                  children: [
                    if (project['github'] != null)
                      IconButton(
                        icon: const FaIcon(
                          FontAwesomeIcons.github,
                          color: Color(0xFFccd6f6),
                          size: 20,
                        ),
                        onPressed: () =>
                            _launchURL(project['github'] as String),
                      ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: project['status'] == 'In Progress'
                            ? const Color(0xFF64ffda).withOpacity(0.2)
                            : const Color(0xFF8892b0).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        project['status'] as String,
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: project['status'] == 'In Progress'
                              ? const Color(0xFF64ffda)
                              : const Color(0xFF8892b0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              project['title'] as String,
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFccd6f6),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Text(
                project['description'] as String,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: const Color(0xFF8892b0),
                  height: 1.6,
                ),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: (project['tech'] as List<String>)
                  .map(
                    (tech) => Text(
                      tech,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: const Color(0xFF64ffda),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      debugPrint('Could not launch $url');
    }
  }
}
