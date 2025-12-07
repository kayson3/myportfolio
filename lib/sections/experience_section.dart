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
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: isMobile ? 60 : 100,
      ),
      color: AppTheme.backgroundColor,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Text(
                'Experience & Education',
                style: AppTheme.sectionTitleStyle.copyWith(
                  fontSize: isMobile ? 28 : 36,
                ),
                textAlign: TextAlign.center,
              )
                  .animate()
                  .fadeIn(duration: 600.ms)
                  .slideY(begin: -0.2, end: 0),
              SizedBox(height: isMobile ? 12 : 16),
              Text(
                'My professional journey',
                style: AppTheme.bodyStyle.copyWith(
                  fontSize: isMobile ? 16 : 18,
                ),
                textAlign: TextAlign.center,
              )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 200.ms),
              SizedBox(height: isMobile ? 40 : 60),
              ...PortfolioData.experiences
                  .asMap()
                  .entries
                  .map((entry) => _ExperienceCard(
                        experience: entry.value,
                        index: entry.key,
                      )
                          .animate()
                          .fadeIn(
                            duration: 600.ms,
                            delay: (300 + entry.key * 200).ms,
                          )
                          .slideX(begin: -0.3, end: 0)),
              const SizedBox(height: 40),
              ...PortfolioData.education
                  .asMap()
                  .entries
                  .map((entry) => _EducationCard(
                        education: entry.value,
                        index: entry.key,
                      )
                          .animate()
                          .fadeIn(
                            duration: 600.ms,
                            delay: (500 + entry.key * 200).ms,
                          )
                          .slideX(begin: 0.3, end: 0)),
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
  
  const _ExperienceCard({
    required this.experience,
    required this.index,
  });
  
  @override
  State<_ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<_ExperienceCard> {
  bool _isHovered = false;
  
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Builder(
        builder: (context) {
          final isMobile = MediaQuery.of(context).size.width < 768;
          return Container(
            margin: const EdgeInsets.only(bottom: 24),
            padding: EdgeInsets.all(isMobile ? 20 : 32),
            decoration: BoxDecoration(
              color: _isHovered
                  ? AppTheme.primaryColor.withOpacity(0.1)
                  : AppTheme.surfaceColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: _isHovered
                    ? AppTheme.primaryColor
                    : AppTheme.surfaceColor,
                width: 2,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: isMobile ? 50 : 60,
                  height: isMobile ? 50 : 60,
                  decoration: BoxDecoration(
                    gradient: AppTheme.primaryGradient,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.work,
                    color: Colors.white,
                    size: isMobile ? 24 : 28,
                  ),
                ),
                SizedBox(width: isMobile ? 16 : 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.experience.title,
                        style: GoogleFonts.inter(
                          fontSize: isMobile ? 20 : 24,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.experience.company,
                        style: GoogleFonts.inter(
                          fontSize: isMobile ? 16 : 18,
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.experience.duration,
                        style: GoogleFonts.inter(
                          fontSize: isMobile ? 12 : 14,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        widget.experience.description,
                        style: AppTheme.bodyStyle.copyWith(
                          fontSize: isMobile ? 14 : 16,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ...widget.experience.achievements.map((achievement) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    top: isMobile ? 6 : 8,
                                    right: isMobile ? 8 : 12,
                                  ),
                                  width: 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: AppTheme.primaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    achievement,
                                    style: AppTheme.bodyStyle.copyWith(
                                      fontSize: isMobile ? 14 : 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _EducationCard extends StatefulWidget {
  final Education education;
  final int index;
  
  const _EducationCard({
    required this.education,
    required this.index,
  });
  
  @override
  State<_EducationCard> createState() => _EducationCardState();
}

class _EducationCardState extends State<_EducationCard> {
  bool _isHovered = false;
  
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: _isHovered
              ? AppTheme.secondaryColor.withOpacity(0.1)
              : AppTheme.surfaceColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered
                ? AppTheme.secondaryColor
                : AppTheme.surfaceColor,
            width: 2,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                gradient: AppTheme.accentGradient,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.school,
                color: Colors.white,
                size: 28,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.education.degree,
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.education.institution,
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      color: AppTheme.secondaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.education.duration,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.education.description,
                    style: AppTheme.bodyStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

