import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    final primaryColor = isDarkMode
        ? AppTheme.primaryColor
        : AppTheme.lightPrimaryColor;

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
            AppTheme.getSurfaceColor(isDarkMode).withAlpha((0.5 * 255).round()),
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
                style: AppTheme.sectionTitleStyle(
                  isDarkMode,
                ).copyWith(fontSize: isMobile ? 28 : 36),
                textAlign: TextAlign.center,
              ).animate().fadeIn(duration: 500.ms).slideY(begin: -0.2, end: 0),
              SizedBox(height: isMobile ? 12 : 16),
              Text(
                'Let\'s work together on your next project',
                style: AppTheme.bodyStyle(
                  isDarkMode,
                ).copyWith(fontSize: isMobile ? 16 : 18),
                textAlign: TextAlign.center,
              ).animate().fadeIn(duration: 500.ms, delay: 150.ms),
              SizedBox(height: isMobile ? 40 : 60),
              Container(
                padding: EdgeInsets.all(isMobile ? 24 : 40),
                decoration: BoxDecoration(
                  color: AppTheme.getSurfaceColor(isDarkMode),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: primaryColor.withAlpha((0.3 * 255).round()),
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    _ContactInfo(
                          icon: Icons.email,
                          label: 'Email',
                          value: PortfolioData.email,
                          onTap: () =>
                              _launchURL('mailto:${PortfolioData.email}'),
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
                                    label: 'GitHub',
                                    url: PortfolioData.github,
                                    assetPath: 'assets/images/icons/github.svg',
                                    isDarkMode: isDarkMode,
                                  )
                                  .animate()
                                  .fadeIn(duration: 400.ms, delay: 500.ms)
                                  .scale(),
                              const SizedBox(height: 16),
                              _SocialButton(
                                    label: 'LinkedIn',
                                    url: PortfolioData.linkedin,
                                    assetPath:
                                        'assets/images/icons/linkedin.svg',
                                    isDarkMode: isDarkMode,
                                  )
                                  .animate()
                                  .fadeIn(duration: 400.ms, delay: 600.ms)
                                  .scale(),
                              if (PortfolioData.twitter.isNotEmpty) ...[
                                const SizedBox(height: 16),
                                _SocialButton(
                                      label: 'Twitter',
                                      url: PortfolioData.twitter,
                                      assetPath: 'assets/images/icons/mail.svg',
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
                                    label: 'GitHub',
                                    url: PortfolioData.github,
                                    assetPath: 'assets/images/icons/github.svg',
                                    isDarkMode: isDarkMode,
                                  )
                                  .animate()
                                  .fadeIn(duration: 400.ms, delay: 500.ms)
                                  .scale(),
                              const SizedBox(width: 20),
                              _SocialButton(
                                    label: 'LinkedIn',
                                    url: PortfolioData.linkedin,
                                    assetPath:
                                        'assets/images/icons/linkedin.svg',
                                    isDarkMode: isDarkMode,
                                  )
                                  .animate()
                                  .fadeIn(duration: 400.ms, delay: 600.ms)
                                  .scale(),
                              if (PortfolioData.twitter.isNotEmpty) ...[
                                const SizedBox(width: 20),
                                _SocialButton(
                                      label: 'Twitter',
                                      url: PortfolioData.twitter,
                                      assetPath: 'assets/images/icons/mail.svg',
                                      isDarkMode: isDarkMode,
                                    )
                                    .animate()
                                    .fadeIn(duration: 400.ms, delay: 700.ms)
                                    .scale(),
                              ],
                            ],
                          ),
                    const SizedBox(height: 24),
                    Center(
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: AppTheme.primaryGradient(isDarkMode),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () => _launchURL(
                            'mailto:${PortfolioData.email}?subject=Hello%20Samson',
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 28,
                              vertical: 12,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.send,
                                  size: 18,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'Send a Message',
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Builder(
                builder: (context) {
                  final isDarkMode =
                      Theme.of(context).brightness == Brightness.dark;
                  return Text(
                    '© ${DateTime.now().year} ${PortfolioData.name}. All rights reserved.',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: AppTheme.getTextSecondary(isDarkMode),
                    ),
                  );
                },
              ).animate().fadeIn(duration: 600.ms, delay: 800.ms),
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
    final primaryColor = isDarkMode
        ? AppTheme.primaryColor
        : AppTheme.lightPrimaryColor;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(isMobile ? 16 : 20),
        decoration: BoxDecoration(
          color: AppTheme.getBackgroundColor(isDarkMode),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: primaryColor.withAlpha((0.3 * 255).round()),
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
              child: Icon(icon, color: Colors.white, size: isMobile ? 20 : 24),
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
  final String label;
  final String url;
  final bool isDarkMode;
  final String? assetPath;

  const _SocialButton({
    required this.label,
    required this.url,
    this.assetPath,
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
    final primaryColor = widget.isDarkMode
        ? AppTheme.primaryColor
        : AppTheme.lightPrimaryColor;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: _launchURL,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            gradient: _isHovered
                ? AppTheme.accentGradient(widget.isDarkMode)
                : AppTheme.primaryGradient(widget.isDarkMode),
            borderRadius: BorderRadius.circular(12),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: primaryColor.withAlpha((0.4 * 255).round()),
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.assetPath != null)
                SvgPicture.asset(widget.assetPath!, width: 20, height: 20)
              else
                Icon(Icons.link, color: Colors.white, size: 20),
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
