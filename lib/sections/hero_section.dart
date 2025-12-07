import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/portfolio_data.dart';
import '../theme/app_theme.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final isTablet =
        MediaQuery.of(context).size.width < 1024 &&
        MediaQuery.of(context).size.width >= 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : (isTablet ? 30 : 40),
        vertical: isMobile ? 80 : 120,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.backgroundColor,
            AppTheme.surfaceColor.withOpacity(0.5),
          ],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isMobile
              ? Column(
                  children: [
                    // Profile Image First on Mobile
                    Container(
                          width: 280,
                          height: 350,
                          margin: const EdgeInsets.only(bottom: 40),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: AppTheme.primaryColor.withOpacity(0.3),
                                blurRadius: 40,
                                spreadRadius: 10,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: AppTheme.primaryGradient,
                                  ),
                                ),
                                _ProfileImage(),
                              ],
                            ),
                          ),
                        )
                        .animate()
                        .fadeIn(duration: 800.ms, delay: 200.ms)
                        .scale(
                          begin: const Offset(0.8, 0.8),
                          end: const Offset(1, 1),
                        ),
                    // Content
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                              'Hi, I\'m',
                              style: GoogleFonts.inter(
                                fontSize: 18,
                                color: AppTheme.textSecondary,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                            .animate()
                            .fadeIn(duration: 500.ms)
                            .slideY(begin: -0.2, end: 0),
                        const SizedBox(height: 12),
                        Text(
                              PortfolioData.name,
                              textAlign: TextAlign.center,
                              style: AppTheme.headingStyle.copyWith(
                                fontSize: 36,
                                foreground: Paint()
                                  ..shader = AppTheme.primaryGradient
                                      .createShader(
                                        const Rect.fromLTWH(0, 0, 400, 100),
                                      ),
                              ),
                            )
                            .animate()
                            .fadeIn(duration: 600.ms, delay: 200.ms)
                            .slideY(begin: -0.2, end: 0),
                        const SizedBox(height: 12),
                        Text(
                              PortfolioData.title,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 20,
                                color: AppTheme.textPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                            .animate()
                            .fadeIn(duration: 600.ms, delay: 400.ms)
                            .slideY(begin: -0.2, end: 0),
                        const SizedBox(height: 20),
                        Text(
                              PortfolioData.bio,
                              textAlign: TextAlign.center,
                              style: AppTheme.bodyStyle.copyWith(fontSize: 16),
                            )
                            .animate()
                            .fadeIn(duration: 600.ms, delay: 600.ms)
                            .slideY(begin: -0.2, end: 0),
                        const SizedBox(height: 30),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          alignment: WrapAlignment.center,
                          children: [
                            _ActionButton(
                                  label: 'Get in Touch',
                                  icon: Icons.email,
                                  onPressed: () => _launchURL(
                                    'mailto:${PortfolioData.email}',
                                  ),
                                )
                                .animate()
                                .fadeIn(duration: 600.ms, delay: 800.ms)
                                .scale(
                                  begin: const Offset(0.8, 0.8),
                                  end: const Offset(1, 1),
                                ),
                            _ActionButton(
                                  label: 'View Resume',
                                  icon: Icons.description,
                                  isOutlined: true,
                                  onPressed: () {},
                                )
                                .animate()
                                .fadeIn(duration: 600.ms, delay: 900.ms)
                                .scale(
                                  begin: const Offset(0.8, 0.8),
                                  end: const Offset(1, 1),
                                ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        Wrap(
                          spacing: 16,
                          alignment: WrapAlignment.center,
                          children: [
                            _SocialIcon(
                                  icon: Icons.code,
                                  url: PortfolioData.github,
                                )
                                .animate()
                                .fadeIn(duration: 400.ms, delay: 1000.ms)
                                .scale(),
                            _SocialIcon(
                                  icon: Icons.business_center,
                                  url: PortfolioData.linkedin,
                                )
                                .animate()
                                .fadeIn(duration: 400.ms, delay: 1100.ms)
                                .scale(),
                            if (PortfolioData.twitter.isNotEmpty)
                              _SocialIcon(
                                    icon: Icons.alternate_email,
                                    url: PortfolioData.twitter,
                                  )
                                  .animate()
                                  .fadeIn(duration: 400.ms, delay: 1200.ms)
                                  .scale(),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                                'Hi, I\'m',
                                style: GoogleFonts.inter(
                                  fontSize: isTablet ? 20 : 24,
                                  color: AppTheme.textSecondary,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                              .animate()
                              .fadeIn(duration: 500.ms)
                              .slideY(begin: -0.2, end: 0),
                          const SizedBox(height: 16),
                          Text(
                                PortfolioData.name,
                                style: AppTheme.headingStyle.copyWith(
                                  fontSize: isTablet ? 48 : 64,
                                  foreground: Paint()
                                    ..shader = AppTheme.primaryGradient
                                        .createShader(
                                          const Rect.fromLTWH(0, 0, 400, 100),
                                        ),
                                ),
                              )
                              .animate()
                              .fadeIn(duration: 600.ms, delay: 200.ms)
                              .slideY(begin: -0.2, end: 0),
                          const SizedBox(height: 16),
                          Text(
                                PortfolioData.title,
                                style: GoogleFonts.inter(
                                  fontSize: isTablet ? 28 : 32,
                                  color: AppTheme.textPrimary,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                              .animate()
                              .fadeIn(duration: 600.ms, delay: 400.ms)
                              .slideY(begin: -0.2, end: 0),
                          const SizedBox(height: 24),
                          ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: isTablet ? 500 : 600,
                                ),
                                child: Text(
                                  PortfolioData.bio,
                                  style: AppTheme.bodyStyle.copyWith(
                                    fontSize: isTablet ? 16 : 18,
                                  ),
                                ),
                              )
                              .animate()
                              .fadeIn(duration: 600.ms, delay: 600.ms)
                              .slideY(begin: -0.2, end: 0),
                          const SizedBox(height: 40),
                          Wrap(
                            spacing: 20,
                            runSpacing: 12,
                            children: [
                              _ActionButton(
                                    label: 'Get in Touch',
                                    icon: Icons.email,
                                    onPressed: () => _launchURL(
                                      'mailto:${PortfolioData.email}',
                                    ),
                                  )
                                  .animate()
                                  .fadeIn(duration: 600.ms, delay: 800.ms)
                                  .scale(
                                    begin: const Offset(0.8, 0.8),
                                    end: const Offset(1, 1),
                                  ),
                              _ActionButton(
                                    label: 'View Resume',
                                    icon: Icons.description,
                                    isOutlined: true,
                                    onPressed: () {},
                                  )
                                  .animate()
                                  .fadeIn(duration: 600.ms, delay: 900.ms)
                                  .scale(
                                    begin: const Offset(0.8, 0.8),
                                    end: const Offset(1, 1),
                                  ),
                            ],
                          ),
                          const SizedBox(height: 60),
                          Wrap(
                            spacing: 20,
                            children: [
                              _SocialIcon(
                                    icon: Icons.code,
                                    url: PortfolioData.github,
                                  )
                                  .animate()
                                  .fadeIn(duration: 400.ms, delay: 1000.ms)
                                  .scale(),
                              _SocialIcon(
                                    icon: Icons.business_center,
                                    url: PortfolioData.linkedin,
                                  )
                                  .animate()
                                  .fadeIn(duration: 400.ms, delay: 1100.ms)
                                  .scale(),
                              if (PortfolioData.twitter.isNotEmpty)
                                _SocialIcon(
                                      icon: Icons.alternate_email,
                                      url: PortfolioData.twitter,
                                    )
                                    .animate()
                                    .fadeIn(duration: 400.ms, delay: 1200.ms)
                                    .scale(),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: isTablet ? 30 : 60),
                    Expanded(
                      child:
                          Container(
                                height: isTablet ? 400 : 500,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppTheme.primaryColor.withOpacity(
                                        0.3,
                                      ),
                                      blurRadius: 40,
                                      spreadRadius: 10,
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(24),
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          gradient: AppTheme.primaryGradient,
                                        ),
                                      ),
                                      _ProfileImage(),
                                    ],
                                  ),
                                ),
                              )
                              .animate()
                              .fadeIn(duration: 800.ms, delay: 400.ms)
                              .scale(
                                begin: const Offset(0.8, 0.8),
                                end: const Offset(1, 1),
                              ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool isOutlined;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.label,
    required this.icon,
    this.isOutlined = false,
    required this.onPressed,
  });

  @override
  State<_ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<_ActionButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          decoration: BoxDecoration(
            gradient: widget.isOutlined
                ? null
                : (_isHovered
                      ? AppTheme.accentGradient
                      : AppTheme.primaryGradient),
            border: widget.isOutlined
                ? Border.all(color: AppTheme.primaryColor, width: 2)
                : null,
            borderRadius: BorderRadius.circular(12),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: AppTheme.primaryColor.withOpacity(0.4),
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
                color: widget.isOutlined ? AppTheme.primaryColor : Colors.white,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: widget.isOutlined
                      ? AppTheme.primaryColor
                      : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  final String url;

  const _SocialIcon({required this.icon, required this.url});

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _isHovered = false;

  Future<void> _launchURL() async {
    final uri = Uri.parse(widget.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: _launchURL,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: _isHovered
                ? AppTheme.primaryColor.withOpacity(0.2)
                : AppTheme.surfaceColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isHovered ? AppTheme.primaryColor : Colors.transparent,
              width: 2,
            ),
          ),
          child: Icon(
            widget.icon,
            color: _isHovered ? AppTheme.primaryColor : AppTheme.textSecondary,
            size: 24,
          ),
        ),
      ),
    );
  }
}

class _ProfileImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.asset(
          PortfolioData.profileImagePath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            // Fallback to gradient with icon if image not found
            return Container(
              decoration: BoxDecoration(gradient: AppTheme.primaryGradient),
              child: Center(
                child: Icon(
                  Icons.person,
                  size: 200,
                  color: Colors.white.withOpacity(0.3),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
