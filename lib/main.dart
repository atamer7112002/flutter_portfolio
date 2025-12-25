import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'widgets/navbar.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/skills_section.dart';
import 'sections/experience_section.dart';
import 'sections/education_section.dart';
import 'sections/certifications_section.dart';
import 'sections/projects_section.dart';
import 'sections/contact_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ahmed Tamer - Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF64ffda),
        scaffoldBackgroundColor: const Color(0xFF0a192f),
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.apply(
            bodyColor: const Color(0xFFccd6f6),
            displayColor: const Color(0xFFccd6f6),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF64ffda),
          brightness: Brightness.dark,
        ).copyWith(surface: const Color(0xFF0a192f)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main scrollable content
          ScrollablePositionedList.builder(
            itemCount:
                8, // Home, About, Skills, Experience, Education, Certifications, Projects, Contact
            itemBuilder: (context, index) {
              return _buildSection(index);
            },
            itemScrollController: itemScrollController,
            itemPositionsListener: itemPositionsListener,
          ),
          // Sticky navbar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavBar(itemScrollController: itemScrollController),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(int index) {
    switch (index) {
      case 0:
        // Home / Hero Section
        return HeroSection(
          onContactTap: () {
            itemScrollController.scrollTo(
              index: 7, // Scroll to Contact Section
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeInOut,
            );
          },
        );
      case 1:
        // About Section
        return const AboutSection();
      case 2:
        // Skills Section
        return const SkillsSection();
      case 3:
        // Experience Section
        return const ExperienceSection();
      case 4:
        // Education Section
        return const EducationSection();
      case 5:
        // Certifications Section
        return const CertificationsSection();
      case 6:
        // Projects Section
        return const ProjectsSection();
      case 7:
        // Contact Section
        return const ContactSection();
      default:
        return const SizedBox.shrink();
    }
  }
}
