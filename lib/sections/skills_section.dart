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
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: isMobile ? 60 : 100,
      ),
      color: AppTheme.surfaceColor,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Text(
                'Skills & Technologies',
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
                'Technologies I work with',
                style: AppTheme.bodyStyle.copyWith(
                  fontSize: isMobile ? 16 : 18,
                ),
                textAlign: TextAlign.center,
              )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 200.ms),
              SizedBox(height: isMobile ? 40 : 60),
              Wrap(
                spacing: isMobile ? 16 : 24,
                runSpacing: isMobile ? 16 : 24,
                alignment: WrapAlignment.center,
                children: List.generate(
                  PortfolioData.skills.length,
                  (index) => _SkillCard(
                    skill: PortfolioData.skills[index],
                    isMobile: isMobile,
                  )
                      .animate()
                      .fadeIn(
                        duration: 600.ms,
                        delay: (300 + index * 100).ms,
                      )
                      .scale(begin: const Offset(0.8, 0.8), end: const Offset(1, 1)),
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
  
  const _SkillCard({
    required this.skill,
    required this.isMobile,
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: widget.isMobile ? double.infinity : 280,
        padding: EdgeInsets.all(widget.isMobile ? 20 : 24),
        decoration: BoxDecoration(
          color: _isHovered
              ? AppTheme.primaryColor.withOpacity(0.1)
              : AppTheme.backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered
                ? AppTheme.primaryColor
                : AppTheme.surfaceColor,
            width: 2,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppTheme.primaryColor.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ]
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  widget.skill.icon,
                  style: const TextStyle(fontSize: 32),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.skill.name,
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: widget.skill.level / 100,
                      minHeight: 8,
                      backgroundColor: AppTheme.surfaceColor,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        _isHovered ? AppTheme.primaryColor : AppTheme.accentColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '${widget.skill.level}%',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

