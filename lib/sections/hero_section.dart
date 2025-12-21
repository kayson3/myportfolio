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
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

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
            AppTheme.getBackgroundColor(isDarkMode),
            AppTheme.getSurfaceColor(isDarkMode).withAlpha((0.5 * 255).round()),
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
                                color:
                                    (isDarkMode
                                            ? AppTheme.primaryColor
                                            : AppTheme.lightPrimaryColor)
                                        .withAlpha((0.3 * 255).round()),
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
                                    gradient: AppTheme.primaryGradient(
                                      isDarkMode,
                                    ),
                                  ),
                                ),
                                _ProfileImage(),
                              ],
                            ),
                          ),
                        )
                        .animate()
                        .fadeIn(duration: 600.ms, delay: 150.ms)
                        .scale(
                          begin: const Offset(0.92, 0.92),
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
                                color: AppTheme.getTextSecondary(isDarkMode),
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
                              style: AppTheme.headingStyle(isDarkMode).copyWith(
                                fontSize: 36,
                                foreground: Paint()
                                  ..shader =
                                      AppTheme.primaryGradient(
                                        isDarkMode,
                                      ).createShader(
                                        const Rect.fromLTWH(0, 0, 400, 100),
                                      ),
                              ),
                            )
                            .animate()
                            .fadeIn(duration: 500.ms, delay: 150.ms)
                            .slideY(begin: -0.2, end: 0),
                        const SizedBox(height: 12),
                        Text(
                              PortfolioData.title,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 20,
                                color: AppTheme.getTextPrimary(isDarkMode),
                                fontWeight: FontWeight.w600,
                              ),
                            )
                            .animate()
                            .fadeIn(duration: 500.ms, delay: 250.ms)
                            .slideY(begin: -0.2, end: 0),
                        const SizedBox(height: 20),
                        Text(
                              PortfolioData.bio,
                              textAlign: TextAlign.center,
                              style: AppTheme.bodyStyle(
                                isDarkMode,
                              ).copyWith(fontSize: 16),
                            )
                            .animate()
                            .fadeIn(duration: 500.ms, delay: 350.ms)
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
                                .fadeIn(duration: 500.ms, delay: 450.ms)
                                .scale(
                                  begin: const Offset(0.92, 0.92),
                                  end: const Offset(1, 1),
                                ),
                            _ActionButton(
                                  label: 'View Resume',
                                  icon: Icons.description,
                                  isOutlined: true,
                                  onPressed: () =>
                                      _launchURL(PortfolioData.resumeUrl),
                                )
                                .animate()
                                .fadeIn(duration: 500.ms, delay: 550.ms)
                                .scale(
                                  begin: const Offset(0.92, 0.92),
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
                                .fadeIn(duration: 350.ms, delay: 650.ms)
                                .scale(),
                            _SocialIcon(
                                  icon: Icons.business_center,
                                  url: PortfolioData.linkedin,
                                )
                                .animate()
                                .fadeIn(duration: 350.ms, delay: 750.ms)
                                .scale(),
                            if (PortfolioData.twitter.isNotEmpty)
                              _SocialIcon(
                                    icon: Icons.alternate_email,
                                    url: PortfolioData.twitter,
                                  )
                                  .animate()
                                  .fadeIn(duration: 350.ms, delay: 850.ms)
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
                                  color: AppTheme.getTextSecondary(isDarkMode),
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                              .animate()
                              .fadeIn(duration: 500.ms)
                              .slideY(begin: -0.2, end: 0),
                          const SizedBox(height: 16),
                          Text(
                                PortfolioData.name,
                                style: AppTheme.headingStyle(isDarkMode)
                                    .copyWith(
                                      fontSize: isTablet ? 48 : 64,
                                      foreground: Paint()
                                        ..shader =
                                            AppTheme.primaryGradient(
                                              isDarkMode,
                                            ).createShader(
                                              const Rect.fromLTWH(
                                                0,
                                                0,
                                                400,
                                                100,
                                              ),
                                            ),
                                    ),
                              )
                              .animate()
                              .fadeIn(duration: 500.ms, delay: 150.ms)
                              .slideY(begin: -0.2, end: 0),
                          const SizedBox(height: 16),
                          Text(
                                PortfolioData.title,
                                style: GoogleFonts.inter(
                                  fontSize: isTablet ? 28 : 32,
                                  color: AppTheme.getTextPrimary(isDarkMode),
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                              .animate()
                              .fadeIn(duration: 500.ms, delay: 250.ms)
                              .slideY(begin: -0.2, end: 0),
                          const SizedBox(height: 24),
                          ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: isTablet ? 500 : 600,
                                ),
                                child: Text(
                                  PortfolioData.bio,
                                  style: AppTheme.bodyStyle(
                                    isDarkMode,
                                  ).copyWith(fontSize: isTablet ? 16 : 18),
                                ),
                              )
                              .animate()
                              .fadeIn(duration: 500.ms, delay: 350.ms)
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
                                  .fadeIn(duration: 500.ms, delay: 450.ms)
                                  .scale(
                                    begin: const Offset(0.92, 0.92),
                                    end: const Offset(1, 1),
                                  ),
                              _ActionButton(
                                    label: 'View Resume',
                                    icon: Icons.description,
                                    isOutlined: true,
                                    onPressed: () =>
                                        _launchURL(PortfolioData.resumeUrl),
                                  )
                                  .animate()
                                  .fadeIn(duration: 500.ms, delay: 550.ms)
                                  .scale(
                                    begin: const Offset(0.92, 0.92),
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
                                      color:
                                          (isDarkMode
                                                  ? AppTheme.primaryColor
                                                  : AppTheme.lightPrimaryColor)
                                              .withAlpha((0.3 * 255).round()),
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
                                          gradient: AppTheme.primaryGradient(
                                            isDarkMode,
                                          ),
                                        ),
                                      ),
                                      _ProfileImage(),
                                    ],
                                  ),
                                ),
                              )
                              .animate()
                              .fadeIn(duration: 600.ms, delay: 250.ms)
                              .scale(
                                begin: const Offset(0.92, 0.92),
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
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primary = AppTheme.primaryColor;

    if (widget.isOutlined) {
      return MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
            side: BorderSide(color: primary, width: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: widget.onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, color: primary, size: 18),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  color: primary,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        margin: EdgeInsets.only(top: _isHovered ? -3 : 0),
        child: ElevatedButton(
          style:
              ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: _isHovered ? 14 : 8,
                backgroundColor: Colors.transparent,
                shadowColor: primary.withAlpha((0.35 * 255).round()),
              ).copyWith(
                backgroundColor: WidgetStateProperty.resolveWith(
                  (states) => null,
                ),
              ),
          onPressed: widget.onPressed,
          child: Ink(
            decoration: BoxDecoration(
              gradient: _isHovered
                  ? AppTheme.accentGradient(isDarkMode)
                  : AppTheme.primaryGradient(isDarkMode),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(widget.icon, color: Colors.white, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    widget.label,
                    style: GoogleFonts.inter(
                      fontSize: 16,
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
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: _launchURL,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            gradient: _isHovered ? AppTheme.primaryGradient(isDarkMode) : null,
            color: _isHovered ? null : AppTheme.getSurfaceColor(isDarkMode),
            borderRadius: BorderRadius.circular(14),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: AppTheme.primaryColor.withAlpha(
                        (0.24 * 255).round(),
                      ),
                      blurRadius: 18,
                      spreadRadius: 2,
                    ),
                  ]
                : null,
            border: Border.all(
              color: _isHovered
                  ? Colors.transparent
                  : AppTheme.getBorderColor(isDarkMode),
              width: 1,
            ),
          ),
          child: Icon(
            widget.icon,
            size: 22,
            color: _isHovered
                ? Colors.white
                : AppTheme.getTextSecondary(isDarkMode),
          ),
        ),
      ),
    );
  }
}

class _ProfileImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SizedBox.expand(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              PortfolioData.profileImagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  decoration: BoxDecoration(
                    gradient: AppTheme.primaryGradient(isDarkMode),
                  ),
                );
              },
            ),
            // subtle overlay vignette
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withAlpha((0.08 * 255).round()),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//AmSN8p5id7hZYx9BtXBZXeEZ
//AmSN8p5id7hZYx9BtXBZXeEZ
