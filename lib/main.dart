import 'package:flutter/material.dart';
import 'utils/constants.dart';
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
      title: 'Ahmed Tamer — Mobile Software Engineer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'Arial',
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: AppColors.textPrimary,
          displayColor: AppColors.textPrimary,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.dark,
          surface: AppColors.background,
        ),
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
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = List.generate(8, (_) => GlobalKey());
  final ValueNotifier<int> _currentSection = ValueNotifier(0);
  bool _scrollCheckScheduled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _currentSection.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollCheckScheduled) return;
    _scrollCheckScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollCheckScheduled = false;
      if (!mounted) return;
      for (int i = _sectionKeys.length - 1; i >= 0; i--) {
        final renderObject = _sectionKeys[i].currentContext?.findRenderObject();
        if (renderObject is RenderBox &&
            renderObject.localToGlobal(Offset.zero).dy <= 150) {
          if (_currentSection.value != i) {
            _currentSection.value = i;
          }
          break;
        }
      }
    });
  }

  void _scrollToSection(int index) {
    final key = _sectionKeys[index];
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                _buildKeyedSection(
                  0,
                  HeroSection(
                    onViewWork: () => _scrollToSection(3),
                    onContact: () => _scrollToSection(7),
                  ),
                ),
                _buildKeyedSection(1, const AboutSection()),
                _buildKeyedSection(2, const SkillsSection()),
                _buildKeyedSection(3, const ProjectsSection()),
                _buildKeyedSection(4, const ExperienceSection()),
                _buildKeyedSection(5, const EducationSection()),
                _buildKeyedSection(6, const CertificationsSection()),
                _buildKeyedSection(7, const ContactSection()),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ValueListenableBuilder<int>(
              valueListenable: _currentSection,
              builder: (context, currentSection, _) => NavBar(
                onNavTap: _scrollToSection,
                currentIndex: currentSection,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeyedSection(int index, Widget child) {
    return Container(key: _sectionKeys[index], child: child);
  }
}
