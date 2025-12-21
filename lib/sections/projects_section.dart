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
                style: AppTheme.sectionTitleStyle(
                  isDarkMode,
                ).copyWith(fontSize: isMobile ? 28 : 36),
                textAlign: TextAlign.center,
              ).animate().fadeIn(duration: 500.ms).slideY(begin: -0.2, end: 0),
              SizedBox(height: isMobile ? 12 : 16),
              Text(
                'Some of my recent work',
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
                  PortfolioData.projects.length,
                  (index) =>
                      _ProjectCard(
                            project: PortfolioData.projects[index],
                            isMobile: isMobile,
                            isDarkMode: isDarkMode,
                          )
                          .animate()
                          .fadeIn(
                            duration: 500.ms,
                            delay: (300 + index * 150).ms,
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
    final primaryColor = widget.isDarkMode
        ? AppTheme.primaryColor
        : AppTheme.lightPrimaryColor;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: _isHovered ? 1.02 : 1.0,
        child: Card(
          clipBehavior: Clip.hardEdge,
          color: AppTheme.getSurfaceColor(widget.isDarkMode),
          elevation: _isHovered ? 18 : 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: SizedBox(
            width: widget.isMobile ? double.infinity : 380,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: widget.isMobile ? 140 : 180,
                  decoration: BoxDecoration(
                    gradient: _isHovered
                        ? AppTheme.accentGradient(widget.isDarkMode)
                        : AppTheme.primaryGradient(widget.isDarkMode),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.code,
                      size: widget.isMobile ? 56 : 72,
                      color: Colors.white.withAlpha((0.28 * 255).round()),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(widget.isMobile ? 16 : 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.project.name,
                        style: GoogleFonts.poppins(
                          fontSize: widget.isMobile ? 18 : 20,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.getTextPrimary(widget.isDarkMode),
                        ),
                      ),
                      SizedBox(height: widget.isMobile ? 8 : 10),
                      Text(
                        widget.project.description,
                        style: AppTheme.bodyStyle(
                          widget.isDarkMode,
                        ).copyWith(fontSize: widget.isMobile ? 14 : 15),
                        maxLines: widget.isMobile ? 4 : 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: widget.isMobile ? 12 : 14),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: widget.project.technologies.map((tech) {
                          return Chip(
                            backgroundColor: primaryColor.withAlpha(
                              (0.12 * 255).round(),
                            ),
                            side: BorderSide(
                              color: primaryColor.withAlpha(
                                (0.22 * 255).round(),
                              ),
                            ),
                            label: Text(
                              tech,
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: primaryColor,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: widget.isMobile ? 12 : 16),
                      widget.isMobile
                          ? Column(
                              children: [
                                _ProjectButton(
                                  label: 'GitHub',
                                  icon: Icons.code,
                                  onPressed: () =>
                                      _launchURL(widget.project.githubUrl),
                                  isDarkMode: widget.isDarkMode,
                                ),
                                const SizedBox(height: 10),
                                _ProjectButton(
                                  label: 'Demo',
                                  icon: Icons.open_in_new,
                                  isOutlined: true,
                                  onPressed: () =>
                                      _launchURL(widget.project.demoUrl),
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
                                    onPressed: () =>
                                        _launchURL(widget.project.githubUrl),
                                    isDarkMode: widget.isDarkMode,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: _ProjectButton(
                                    label: 'Demo',
                                    icon: Icons.open_in_new,
                                    isOutlined: true,
                                    onPressed: () =>
                                        _launchURL(widget.project.demoUrl),
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
  final bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final primary = widget.isDarkMode
        ? AppTheme.primaryColor
        : AppTheme.lightPrimaryColor;

    if (widget.isOutlined) {
      return OutlinedButton.icon(
        onPressed: widget.onPressed,
        icon: Icon(widget.icon, size: 18, color: primary),
        label: Text(
          widget.label,
          style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: primary),
        ),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: BorderSide(color: primary, width: 2),
        ),
      );
    }

    return ElevatedButton.icon(
      onPressed: widget.onPressed,
      icon: Icon(widget.icon, size: 18, color: Colors.white),
      label: Text(
        widget.label,
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      style:
          ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: _isHovered ? 14 : 8,
            shadowColor: primary.withAlpha((0.35 * 255).round()),
            backgroundColor: null,
          ).copyWith(
            backgroundColor: WidgetStateProperty.resolveWith((states) => null),
          ),
    ).wrapWithInk(
      decoration: BoxDecoration(
        gradient: AppTheme.primaryGradient(widget.isDarkMode),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

extension _InkExt on Widget {
  Widget wrapWithInk({required BoxDecoration decoration}) {
    return Ink(
      decoration: decoration,
      child: Container(child: this),
    );
  }
}
