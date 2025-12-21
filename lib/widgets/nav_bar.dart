import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../providers/theme_provider.dart';
import '../theme/app_theme.dart';

class NavBar extends StatefulWidget {
  final AutoScrollController scrollController;
  final ThemeProvider themeProvider;

  const NavBar({
    super.key,
    required this.scrollController,
    required this.themeProvider,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool _isMenuOpen = false;

  Future<void> _scrollToIndex(int index) async {
    await widget.scrollController.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.begin,
      duration: const Duration(milliseconds: 700),
    );
    if (_isMenuOpen) setState(() => _isMenuOpen = false);
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final isDarkMode = widget.themeProvider.isDarkMode;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Frosted bar
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: isMobile ? 12 : 18,
              ),
              decoration: BoxDecoration(
                color: AppTheme.getSurfaceColor(
                  isDarkMode,
                ).withAlpha((0.65 * 255).round()),
                border: Border(
                  bottom: BorderSide(
                    color: AppTheme.getBorderColor(isDarkMode),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo
                  Text(
                    'Samson',
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 18 : 22,
                      fontWeight: FontWeight.w700,
                      foreground: Paint()
                        ..shader = AppTheme.primaryGradient(
                          isDarkMode,
                        ).createShader(const Rect.fromLTWH(0, 0, 200, 60)),
                    ),
                  ),

                  // Desktop nav
                  Row(
                    children: [
                      if (!isMobile)
                        Row(
                          children: [
                            _NavItem(
                              label: 'Home',
                              onTap: () => _scrollToIndex(0),
                              isDarkMode: isDarkMode,
                            ),
                            const SizedBox(width: 24),
                            _NavItem(
                              label: 'About',
                              onTap: () => _scrollToIndex(1),
                              isDarkMode: isDarkMode,
                            ),
                            const SizedBox(width: 24),
                            _NavItem(
                              label: 'Skills',
                              onTap: () => _scrollToIndex(2),
                              isDarkMode: isDarkMode,
                            ),
                            const SizedBox(width: 24),
                            _NavItem(
                              label: 'Experience',
                              onTap: () => _scrollToIndex(3),
                              isDarkMode: isDarkMode,
                            ),
                            const SizedBox(width: 24),
                            _NavItem(
                              label: 'Projects',
                              onTap: () => _scrollToIndex(4),
                              isDarkMode: isDarkMode,
                            ),
                            const SizedBox(width: 24),
                            _NavItem(
                              label: 'Contact',
                              onTap: () => _scrollToIndex(5),
                              isDarkMode: isDarkMode,
                            ),
                          ],
                        ),

                      // Theme toggle
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: IconButton(
                          icon: Icon(
                            isDarkMode ? Icons.light_mode : Icons.dark_mode,
                            color: AppTheme.getTextPrimary(isDarkMode),
                          ),
                          onPressed: () => widget.themeProvider.toggleTheme(),
                          tooltip: isDarkMode
                              ? 'Switch to Light'
                              : 'Switch to Dark',
                        ),
                      ),

                      // Mobile menu button
                      if (isMobile)
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () =>
                                setState(() => _isMenuOpen = !_isMenuOpen),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppTheme.getSurfaceColor(
                                  isDarkMode,
                                ).withAlpha((0.15 * 255).round()),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                _isMenuOpen ? Icons.close : Icons.menu,
                                color: AppTheme.getTextPrimary(isDarkMode),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        // Mobile dropdown
        if (isMobile && _isMenuOpen)
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            width: double.infinity,
            color: AppTheme.getSurfaceColor(
              widget.themeProvider.isDarkMode,
            ).withAlpha((0.98 * 255).round()),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _MobileNavItem(
                  label: 'Home',
                  icon: Icons.home,
                  onTap: () => _scrollToIndex(0),
                  isDarkMode: widget.themeProvider.isDarkMode,
                ),
                _MobileNavItem(
                  label: 'About',
                  icon: Icons.person,
                  onTap: () => _scrollToIndex(1),
                  isDarkMode: widget.themeProvider.isDarkMode,
                ),
                _MobileNavItem(
                  label: 'Skills',
                  icon: Icons.code,
                  onTap: () => _scrollToIndex(2),
                  isDarkMode: widget.themeProvider.isDarkMode,
                ),
                _MobileNavItem(
                  label: 'Experience',
                  icon: Icons.work,
                  onTap: () => _scrollToIndex(3),
                  isDarkMode: widget.themeProvider.isDarkMode,
                ),
                _MobileNavItem(
                  label: 'Projects',
                  icon: Icons.folder_open,
                  onTap: () => _scrollToIndex(4),
                  isDarkMode: widget.themeProvider.isDarkMode,
                ),
                _MobileNavItem(
                  label: 'Contact',
                  icon: Icons.email,
                  onTap: () => _scrollToIndex(5),
                  isDarkMode: widget.themeProvider.isDarkMode,
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _NavItem extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final bool isDarkMode;

  const _NavItem({
    required this.label,
    required this.onTap,
    required this.isDarkMode,
  });

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final primary = AppTheme.primaryColor;
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          duration: const Duration(milliseconds: 180),
          scale: _isHovered ? 1.02 : 1.0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: _isHovered
                  ? primary.withAlpha((0.08 * 255).round())
                  : Colors.transparent,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.label,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: _isHovered ? FontWeight.w700 : FontWeight.w600,
                    color: _isHovered
                        ? primary
                        : AppTheme.getTextSecondary(widget.isDarkMode),
                  ),
                ),
                if (_isHovered) const SizedBox(width: 6),
                if (_isHovered)
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: AppTheme.primaryGradient(widget.isDarkMode),
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

class _MobileNavItem extends StatefulWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final bool isDarkMode;

  const _MobileNavItem({
    required this.label,
    required this.icon,
    required this.onTap,
    required this.isDarkMode,
  });

  @override
  State<_MobileNavItem> createState() => _MobileNavItemState();
}

class _MobileNavItemState extends State<_MobileNavItem> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: widget.onTap,
        onHighlightChanged: (v) => setState(() => _isPressed = v),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: _isPressed
                ? AppTheme.primaryColor.withAlpha((0.12 * 255).round())
                : Colors.transparent,
            border: Border(
              bottom: BorderSide(
                color: AppTheme.getBorderColor(widget.isDarkMode),
              ),
            ),
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                size: 20,
                color: AppTheme.getTextPrimary(widget.isDarkMode),
              ),
              const SizedBox(width: 16),
              Text(
                widget.label,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.getTextPrimary(widget.isDarkMode),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
