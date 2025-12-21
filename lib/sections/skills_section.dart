import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/portfolio_data.dart';
import '../theme/app_theme.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

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
      color: AppTheme.getSurfaceColor(isDarkMode),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Text(
                'Skills & Technologies',
                style: AppTheme.sectionTitleStyle(
                  isDarkMode,
                ).copyWith(fontSize: isMobile ? 28 : 36),
                textAlign: TextAlign.center,
              ).animate().fadeIn(duration: 500.ms).slideY(begin: -0.2, end: 0),
              SizedBox(height: isMobile ? 12 : 16),
              Text(
                'Technologies I work with',
                style: AppTheme.bodyStyle(
                  isDarkMode,
                ).copyWith(fontSize: isMobile ? 16 : 18),
                textAlign: TextAlign.center,
              ).animate().fadeIn(duration: 500.ms, delay: 150.ms),
              SizedBox(height: isMobile ? 40 : 60),
              Wrap(
                spacing: isMobile ? 16 : 24,
                runSpacing: isMobile ? 16 : 24,
                alignment: WrapAlignment.center,
                children: List.generate(
                  PortfolioData.skills.length,
                  (index) =>
                      _SkillCard(
                            skill: PortfolioData.skills[index],
                            isMobile: isMobile,
                            isDarkMode: isDarkMode,
                          )
                          .animate()
                          .fadeIn(
                            duration: 500.ms,
                            delay: (300 + index * 100).ms,
                          )
                          .scale(
                            begin: const Offset(0.92, 0.92),
                            end: const Offset(1, 1),
                          ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillCard extends StatefulWidget {
  final Skill skill;
  final bool isMobile;
  final bool isDarkMode;

  const _SkillCard({
    required this.skill,
    required this.isMobile,
    required this.isDarkMode,
  });

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Card(
        color: AppTheme.getSurfaceColor(widget.isDarkMode),
        elevation: _isHovered ? 16 : 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Container(
          width: widget.isMobile ? double.infinity : 280,
          padding: EdgeInsets.all(widget.isMobile ? 16 : 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: _isHovered
                          ? AppTheme.primaryGradient(widget.isDarkMode)
                          : null,
                      color: _isHovered
                          ? null
                          : AppTheme.getBackgroundColor(widget.isDarkMode),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      widget.skill.icon,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.skill.name,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.getTextPrimary(widget.isDarkMode),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 10,
                      decoration: BoxDecoration(
                        color: AppTheme.getBackgroundColor(widget.isDarkMode),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: FractionallySizedBox(
                          widthFactor: widget.skill.level / 100,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: AppTheme.primaryGradient(
                                widget.isDarkMode,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    '${widget.skill.level}%',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      color: AppTheme.getTextSecondary(widget.isDarkMode),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
