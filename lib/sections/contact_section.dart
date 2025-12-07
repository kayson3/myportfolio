import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/portfolio_data.dart';
import '../theme/app_theme.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});
  
  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = isDarkMode ? AppTheme.primaryColor : AppTheme.lightPrimaryColor;
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: isMobile ? 60 : 100,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.getBackgroundColor(isDarkMode),
            AppTheme.getSurfaceColor(isDarkMode).withOpacity(0.5),
          ],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Text(
                'Get In Touch',
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
                'Let\'s work together on your next project',
                style: AppTheme.bodyStyle(isDarkMode).copyWith(
                  fontSize: isMobile ? 16 : 18,
                ),
                textAlign: TextAlign.center,
              )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 200.ms),
              SizedBox(height: isMobile ? 40 : 60),
              Container(
                padding: EdgeInsets.all(isMobile ? 24 : 40),
                decoration: BoxDecoration(
                  color: AppTheme.getSurfaceColor(isDarkMode),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: primaryColor.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    _ContactInfo(
                      icon: Icons.email,
                      label: 'Email',
                      value: PortfolioData.email,
                      onTap: () => _launchURL('mailto:${PortfolioData.email}'),
                      isMobile: isMobile,
                      isDarkMode: isDarkMode,
                    )
                        .animate()
                        .fadeIn(duration: 600.ms, delay: 300.ms)
                        .slideX(begin: -0.2, end: 0),
                    SizedBox(height: isMobile ? 20 : 24),
                    _ContactInfo(
                      icon: Icons.location_on,
                      label: 'Location',
                      value: PortfolioData.location,
                      onTap: null,
                      isMobile: isMobile,
                      isDarkMode: isDarkMode,
                    )
                        .animate()
                        .fadeIn(duration: 600.ms, delay: 400.ms)
                        .slideX(begin: -0.2, end: 0),
                    SizedBox(height: isMobile ? 30 : 40),
                    isMobile
                        ? Column(
                            children: [
                              _SocialButton(
                                icon: Icons.code,
                                label: 'GitHub',
                                url: PortfolioData.github,
                                isDarkMode: isDarkMode,
                              )
                                  .animate()
                                  .fadeIn(duration: 400.ms, delay: 500.ms)
                                  .scale(),
                              const SizedBox(height: 16),
                              _SocialButton(
                                icon: Icons.business_center,
                                label: 'LinkedIn',
                                url: PortfolioData.linkedin,
                                isDarkMode: isDarkMode,
                              )
                                  .animate()
                                  .fadeIn(duration: 400.ms, delay: 600.ms)
                                  .scale(),
                              if (PortfolioData.twitter.isNotEmpty) ...[
                                const SizedBox(height: 16),
                                _SocialButton(
                                  icon: Icons.alternate_email,
                                  label: 'Twitter',
                                  url: PortfolioData.twitter,
                                  isDarkMode: isDarkMode,
                                )
                                    .animate()
                                    .fadeIn(duration: 400.ms, delay: 700.ms)
                                    .scale(),
                              ],
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _SocialButton(
                                icon: Icons.code,
                                label: 'GitHub',
                                url: PortfolioData.github,
                                isDarkMode: isDarkMode,
                              )
                                  .animate()
                                  .fadeIn(duration: 400.ms, delay: 500.ms)
                                  .scale(),
                              const SizedBox(width: 20),
                              _SocialButton(
                                icon: Icons.business_center,
                                label: 'LinkedIn',
                                url: PortfolioData.linkedin,
                                isDarkMode: isDarkMode,
                              )
                                  .animate()
                                  .fadeIn(duration: 400.ms, delay: 600.ms)
                                  .scale(),
                              if (PortfolioData.twitter.isNotEmpty) ...[
                                const SizedBox(width: 20),
                                _SocialButton(
                                  icon: Icons.alternate_email,
                                  label: 'Twitter',
                                  url: PortfolioData.twitter,
                                  isDarkMode: isDarkMode,
                                )
                                    .animate()
                                    .fadeIn(duration: 400.ms, delay: 700.ms)
                                    .scale(),
                              ],
                            ],
                          ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Builder(
                builder: (context) {
                  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
                  return Text(
                    '© ${DateTime.now().year} ${PortfolioData.name}. All rights reserved.',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: AppTheme.getTextSecondary(isDarkMode),
                    ),
                  );
                },
              )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 800.ms),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactInfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onTap;
  final bool isMobile;
  final bool isDarkMode;
  
  const _ContactInfo({
    required this.icon,
    required this.label,
    required this.value,
    this.onTap,
    required this.isMobile,
    required this.isDarkMode,
  });
  
  @override
  Widget build(BuildContext context) {
    final primaryColor = isDarkMode ? AppTheme.primaryColor : AppTheme.lightPrimaryColor;
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(isMobile ? 16 : 20),
        decoration: BoxDecoration(
          color: AppTheme.getBackgroundColor(isDarkMode),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: primaryColor.withOpacity(0.3),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: isMobile ? 45 : 50,
              height: isMobile ? 45 : 50,
              decoration: BoxDecoration(
                gradient: AppTheme.primaryGradient(isDarkMode),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: isMobile ? 20 : 24,
              ),
            ),
            SizedBox(width: isMobile ? 16 : 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: GoogleFonts.inter(
                      fontSize: isMobile ? 12 : 14,
                      color: AppTheme.getTextSecondary(isDarkMode),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: GoogleFonts.inter(
                      fontSize: isMobile ? 16 : 18,
                      color: AppTheme.getTextPrimary(isDarkMode),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            if (onTap != null)
              Icon(
                Icons.arrow_forward_ios,
                size: isMobile ? 14 : 16,
                color: primaryColor,
              ),
          ],
        ),
      ),
    );
  }
}

class _SocialButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final String url;
  final bool isDarkMode;
  
  const _SocialButton({
    required this.icon,
    required this.label,
    required this.url,
    required this.isDarkMode,
  });
  
  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _isHovered = false;
  
  Future<void> _launchURL() async {
    final uri = Uri.parse(widget.url);
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
      child: GestureDetector(
        onTap: _launchURL,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            gradient: _isHovered ? AppTheme.accentGradient(widget.isDarkMode) : AppTheme.primaryGradient(widget.isDarkMode),
            borderRadius: BorderRadius.circular(12),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.4),
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

