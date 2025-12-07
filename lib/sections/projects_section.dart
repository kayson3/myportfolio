import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/portfolio_data.dart';
import '../theme/app_theme.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});
  
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
                'Featured Projects',
                style: AppTheme.sectionTitleStyle(isDarkMode).copyWith(
                  fontSize: isMobile ? 28 : 36,
                ),
                textAlign: TextAlign.center,
              )
                  .animate()
                  .fadeIn(duration: 600.ms)
                  .slideY(begin: -0.2, end: 0),
              SizedBox(height: isMobile ? 12 : 16),
              Text(
                'Some of my recent work',
                style: AppTheme.bodyStyle(isDarkMode).copyWith(
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
                  PortfolioData.projects.length,
                  (index) => _ProjectCard(
                    project: PortfolioData.projects[index],
                    isMobile: isMobile,
                    isDarkMode: isDarkMode,
                  )
                      .animate()
                      .fadeIn(
                        duration: 600.ms,
                        delay: (300 + index * 150).ms,
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

class _ProjectCard extends StatefulWidget {
  final Project project;
  final bool isMobile;
  final bool isDarkMode;
  
  const _ProjectCard({
    required this.project,
    required this.isMobile,
    required this.isDarkMode,
  });
  
  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;
  
  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final primaryColor = widget.isDarkMode ? AppTheme.primaryColor : AppTheme.lightPrimaryColor;
    
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: widget.isMobile ? double.infinity : 380,
        decoration: BoxDecoration(
          color: AppTheme.getBackgroundColor(widget.isDarkMode),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isHovered
                ? primaryColor
                : AppTheme.getSurfaceColor(widget.isDarkMode),
            width: 2,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.3),
                    blurRadius: 30,
                    spreadRadius: 5,
                  ),
                ]
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: widget.isMobile ? 150 : 200,
              decoration: BoxDecoration(
                gradient: _isHovered
                    ? AppTheme.accentGradient(widget.isDarkMode)
                    : AppTheme.primaryGradient(widget.isDarkMode),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.code,
                  size: widget.isMobile ? 60 : 80,
                  color: Colors.white.withOpacity(0.3),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(widget.isMobile ? 20 : 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.project.name,
                    style: GoogleFonts.inter(
                      fontSize: widget.isMobile ? 20 : 24,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.getTextPrimary(widget.isDarkMode),
                    ),
                  ),
                  SizedBox(height: widget.isMobile ? 10 : 12),
                  Text(
                    widget.project.description,
                    style: AppTheme.bodyStyle(widget.isDarkMode).copyWith(
                      fontSize: widget.isMobile ? 14 : 16,
                    ),
                    maxLines: widget.isMobile ? 4 : 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: widget.isMobile ? 16 : 20),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.project.technologies
                        .map((tech) => Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: widget.isMobile ? 10 : 12,
                                vertical: widget.isMobile ? 5 : 6,
                              ),
                              decoration: BoxDecoration(
                                color: primaryColor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: primaryColor.withOpacity(0.5),
                                ),
                              ),
                              child: Text(
                                tech,
                                style: GoogleFonts.inter(
                                  fontSize: widget.isMobile ? 11 : 12,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                  SizedBox(height: widget.isMobile ? 16 : 20),
                  widget.isMobile
                      ? Column(
                          children: [
                            _ProjectButton(
                              label: 'GitHub',
                              icon: Icons.code,
                              onPressed: () => _launchURL(widget.project.githubUrl),
                              isDarkMode: widget.isDarkMode,
                            ),
                            const SizedBox(height: 12),
                            _ProjectButton(
                              label: 'Demo',
                              icon: Icons.open_in_new,
                              isOutlined: true,
                              onPressed: () => _launchURL(widget.project.demoUrl),
                              isDarkMode: widget.isDarkMode,
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(
                              child: _ProjectButton(
                                label: 'GitHub',
                                icon: Icons.code,
                                onPressed: () => _launchURL(widget.project.githubUrl),
                                isDarkMode: widget.isDarkMode,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _ProjectButton(
                                label: 'Demo',
                                icon: Icons.open_in_new,
                                isOutlined: true,
                                onPressed: () => _launchURL(widget.project.demoUrl),
                                isDarkMode: widget.isDarkMode,
                              ),
                            ),
                          ],
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

class _ProjectButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool isOutlined;
  final VoidCallback onPressed;
  final bool isDarkMode;
  
  const _ProjectButton({
    required this.label,
    required this.icon,
    this.isOutlined = false,
    required this.onPressed,
    required this.isDarkMode,
  });
  
  @override
  State<_ProjectButton> createState() => _ProjectButtonState();
}

class _ProjectButtonState extends State<_ProjectButton> {
  bool _isHovered = false;
  
  @override
  Widget build(BuildContext context) {
    final primaryColor = widget.isDarkMode ? AppTheme.primaryColor : AppTheme.lightPrimaryColor;
    
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            gradient: widget.isOutlined
                ? null
                : (_isHovered ? AppTheme.accentGradient(widget.isDarkMode) : AppTheme.primaryGradient(widget.isDarkMode)),
            border: widget.isOutlined
                ? Border.all(color: primaryColor, width: 2)
                : null,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                size: 18,
                color: widget.isOutlined ? primaryColor : Colors.white,
              ),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: widget.isOutlined ? primaryColor : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

