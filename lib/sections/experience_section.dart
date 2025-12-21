import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/portfolio_data.dart';
import '../theme/app_theme.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

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
                'Experience & Education',
                style: AppTheme.sectionTitleStyle(
                  isDarkMode,
                ).copyWith(fontSize: isMobile ? 28 : 36),
                textAlign: TextAlign.center,
              ).animate().fadeIn(duration: 500.ms).slideY(begin: -0.2, end: 0),
              SizedBox(height: isMobile ? 12 : 16),
              Text(
                'My professional journey',
                style: AppTheme.bodyStyle(
                  isDarkMode,
                ).copyWith(fontSize: isMobile ? 16 : 18),
                textAlign: TextAlign.center,
              ).animate().fadeIn(duration: 500.ms, delay: 150.ms),
              SizedBox(height: isMobile ? 40 : 60),
              ...PortfolioData.experiences.asMap().entries.map(
                (entry) =>
                    _ExperienceCard(
                          experience: entry.value,
                          index: entry.key,
                          isDarkMode: isDarkMode,
                        )
                        .animate()
                        .fadeIn(
                          duration: 600.ms,
                          delay: (300 + entry.key * 200).ms,
                        )
                        .slideX(begin: -0.3, end: 0),
              ),
              const SizedBox(height: 40),
              ...PortfolioData.education.asMap().entries.map(
                (entry) =>
                    _EducationCard(
                          education: entry.value,
                          index: entry.key,
                          isDarkMode: isDarkMode,
                        )
                        .animate()
                        .fadeIn(
                          duration: 600.ms,
                          delay: (500 + entry.key * 200).ms,
                        )
                        .slideX(begin: 0.3, end: 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExperienceCard extends StatefulWidget {
  final Experience experience;
  final int index;
  final bool isDarkMode;

  const _ExperienceCard({
    required this.experience,
    required this.index,
    required this.isDarkMode,
  });

  @override
  State<_ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<_ExperienceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final accent = widget.isDarkMode
        ? AppTheme.primaryColor
        : AppTheme.lightPrimaryColor;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Card(
        elevation: _isHovered ? 18 : 6,
        color: AppTheme.getSurfaceColor(widget.isDarkMode),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: EdgeInsets.all(isMobile ? 18 : 26),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: isMobile ? 50 : 64,
                height: isMobile ? 50 : 64,
                decoration: BoxDecoration(
                  gradient: AppTheme.primaryGradient(widget.isDarkMode),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.work,
                  color: Colors.white,
                  size: isMobile ? 22 : 28,
                ),
              ),
              SizedBox(width: isMobile ? 14 : 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.experience.title,
                      style: GoogleFonts.poppins(
                        fontSize: isMobile ? 18 : 20,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.getTextPrimary(widget.isDarkMode),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          widget.experience.company,
                          style: GoogleFonts.inter(
                            fontSize: isMobile ? 14 : 16,
                            fontWeight: FontWeight.w600,
                            color: accent,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '•',
                          style: TextStyle(
                            color: AppTheme.getTextSecondary(widget.isDarkMode),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          widget.experience.duration,
                          style: GoogleFonts.inter(
                            fontSize: isMobile ? 12 : 14,
                            color: AppTheme.getTextSecondary(widget.isDarkMode),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.experience.description,
                      style: AppTheme.bodyStyle(
                        widget.isDarkMode,
                      ).copyWith(fontSize: isMobile ? 14 : 15),
                    ),
                    const SizedBox(height: 12),
                    Column(
                      children: widget.experience.achievements
                          .map(
                            (a) => Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                      top: 6,
                                      right: 12,
                                    ),
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      gradient: AppTheme.primaryGradient(
                                        widget.isDarkMode,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      a,
                                      style: AppTheme.bodyStyle(
                                        widget.isDarkMode,
                                      ).copyWith(fontSize: isMobile ? 14 : 15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EducationCard extends StatefulWidget {
  final Education education;
  final int index;
  final bool isDarkMode;

  const _EducationCard({
    required this.education,
    required this.index,
    required this.isDarkMode,
  });

  @override
  State<_EducationCard> createState() => _EducationCardState();
}

class _EducationCardState extends State<_EducationCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final accent = widget.isDarkMode
        ? AppTheme.secondaryColor
        : AppTheme.lightSecondaryColor;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Card(
        elevation: _isHovered ? 16 : 6,
        color: AppTheme.getSurfaceColor(widget.isDarkMode),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  gradient: AppTheme.accentGradient(widget.isDarkMode),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.school, color: Colors.white, size: 26),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.education.degree,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.getTextPrimary(widget.isDarkMode),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          widget.education.institution,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: accent,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '•',
                          style: TextStyle(
                            color: AppTheme.getTextSecondary(widget.isDarkMode),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          widget.education.duration,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: AppTheme.getTextSecondary(widget.isDarkMode),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.education.description,
                      style: AppTheme.bodyStyle(widget.isDarkMode),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
