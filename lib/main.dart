import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'providers/theme_provider.dart';
import 'sections/contact_section.dart';
import 'sections/experience_section.dart';
import 'sections/hero_section.dart';
import 'sections/projects_section.dart';
import 'sections/skills_section.dart';
import 'theme/app_theme.dart';
import 'widgets/loading_screen.dart';
import 'widgets/nav_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final ThemeProvider _themeProvider = ThemeProvider();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate loading time for assets and initialization
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _themeProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _themeProvider,
      builder: (context, _) {
        return MaterialApp(
          title: 'Samson Ibikunle - Portfolio',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getTheme(_themeProvider.isDarkMode),
          home: _isLoading
              ? const LoadingScreen()
              : PortfolioHome(
                  scrollController: AutoScrollController(),
                  themeProvider: _themeProvider,
                ),
        );
      },
    );
  }
}

class PortfolioHome extends StatefulWidget {
  final AutoScrollController scrollController;
  final ThemeProvider themeProvider;

  const PortfolioHome({
    super.key,
    required this.scrollController,
    required this.themeProvider,
  });

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  @override
  void dispose() {
    widget.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: widget.scrollController,
            child: Column(
              children: [
                // Hero Section
                AutoScrollTag(
                  key: const ValueKey(0),
                  controller: widget.scrollController,
                  index: 0,
                  child: const HeroSection(),
                ),
                // About Section (using Hero for now)
                AutoScrollTag(
                  key: const ValueKey(1),
                  controller: widget.scrollController,
                  index: 1,
                  child: Builder(
                    builder: (context) {
                      final isMobile = MediaQuery.of(context).size.width < 768;
                      final isDarkMode = widget.themeProvider.isDarkMode;
                      return Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 20 : 40,
                          vertical: isMobile ? 60 : 100,
                        ),
                        color: AppTheme.getBackgroundColor(isDarkMode),
                        child: Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 1200),
                            child: Column(
                              children: [
                                Text(
                                  'About Me',
                                  style: AppTheme.sectionTitleStyle(
                                    isDarkMode,
                                  ).copyWith(fontSize: isMobile ? 28 : 36),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: isMobile ? 24 : 40),
                                Text(
                                  'I am a passionate software developer with a strong focus on creating beautiful, functional, and user-friendly applications. With expertise in Flutter, web development, and modern software engineering practices, I bring ideas to life through code.',
                                  style: AppTheme.bodyStyle(
                                    isDarkMode,
                                  ).copyWith(fontSize: isMobile ? 16 : 18),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Skills Section
                AutoScrollTag(
                  key: const ValueKey(2),
                  controller: widget.scrollController,
                  index: 2,
                  child: const SkillsSection(),
                ),
                // Experience Section
                AutoScrollTag(
                  key: const ValueKey(3),
                  controller: widget.scrollController,
                  index: 3,
                  child: const ExperienceSection(),
                ),
                // Projects Section
                AutoScrollTag(
                  key: const ValueKey(4),
                  controller: widget.scrollController,
                  index: 4,
                  child: const ProjectsSection(),
                ),
                // Contact Section
                AutoScrollTag(
                  key: const ValueKey(5),
                  controller: widget.scrollController,
                  index: 5,
                  child: const ContactSection(),
                ),
              ],
            ),
          ),
          // Navigation Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavBar(
              scrollController: widget.scrollController,
              themeProvider: widget.themeProvider,
            ),
          ),
        ],
      ),
    );
  }
}
