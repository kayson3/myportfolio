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
      duration: const Duration(milliseconds: 800),
    );
    if (_isMenuOpen) {
      setState(() => _isMenuOpen = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final isDarkMode = widget.themeProvider.isDarkMode;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: isMobile ? 16 : 20,
              ),
              decoration: BoxDecoration(
                color: AppTheme.getSurfaceColor(isDarkMode).withOpacity(0.8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SI',
                    style: GoogleFonts.inter(
                      fontSize: isMobile ? 20 : 24,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..shader = AppTheme.primaryGradient(
                          isDarkMode,
                        ).createShader(const Rect.fromLTWH(0, 0, 100, 100)),
                    ),
                  ),
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
                            const SizedBox(width: 32),
                            _NavItem(
                              label: 'About',
                              onTap: () => _scrollToIndex(1),
                              isDarkMode: isDarkMode,
                            ),
                            const SizedBox(width: 32),
                            _NavItem(
                              label: 'Skills',
                              onTap: () => _scrollToIndex(2),
                              isDarkMode: isDarkMode,
                            ),
                            const SizedBox(width: 32),
                            _NavItem(
                              label: 'Experience',
                              onTap: () => _scrollToIndex(3),
                              isDarkMode: isDarkMode,
                            ),
                            const SizedBox(width: 32),
                            _NavItem(
                              label: 'Projects',
                              onTap: () => _scrollToIndex(4),
                              isDarkMode: isDarkMode,
                            ),
                            const SizedBox(width: 32),
                            _NavItem(
                              label: 'Contact',
                              onTap: () => _scrollToIndex(5),
                              isDarkMode: isDarkMode,
                            ),
                            const SizedBox(width: 20),
                          ],
                        ),
                      // Theme Toggle Button
                      IconButton(
                        icon: Icon(
                          isDarkMode ? Icons.light_mode : Icons.dark_mode,
                          color: AppTheme.getTextPrimary(isDarkMode),
                        ),
                        onPressed: () => widget.themeProvider.toggleTheme(),
                        tooltip: isDarkMode
                            ? 'Switch to Light Mode'
                            : 'Switch to Dark Mode',
                      ),
                      if (isMobile)
                        IconButton(
                          icon: Icon(
                            _isMenuOpen ? Icons.close : Icons.menu,
                            color: AppTheme.getTextPrimary(isDarkMode),
                          ),
                          onPressed: () =>
                              setState(() => _isMenuOpen = !_isMenuOpen),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        // Dropdown menu for mobile
        if (isMobile && _isMenuOpen)
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  color: AppTheme.getSurfaceColor(isDarkMode).withOpacity(0.98),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _MobileNavItem(
                      label: 'Home',
                      onTap: () => _scrollToIndex(0),
                      isDarkMode: widget.themeProvider.isDarkMode,
                    ),
                    _MobileNavItem(
                      label: 'About',
                      onTap: () => _scrollToIndex(1),
                      isDarkMode: widget.themeProvider.isDarkMode,
                    ),
                    _MobileNavItem(
                      label: 'Skills',
                      onTap: () => _scrollToIndex(2),
                      isDarkMode: widget.themeProvider.isDarkMode,
                    ),
                    _MobileNavItem(
                      label: 'Experience',
                      onTap: () => _scrollToIndex(3),
                      isDarkMode: widget.themeProvider.isDarkMode,
                    ),
                    _MobileNavItem(
                      label: 'Projects',
                      onTap: () => _scrollToIndex(4),
                      isDarkMode: widget.themeProvider.isDarkMode,
                    ),
                    _MobileNavItem(
                      label: 'Contact',
                      onTap: () => _scrollToIndex(5),
                      isDarkMode: widget.themeProvider.isDarkMode,
                    ),
                  ],
                ),
              ),
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
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: _isHovered
                ? AppTheme.primaryColor.withOpacity(0.1)
                : Colors.transparent,
          ),
          child: Text(
            widget.label,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: _isHovered
                  ? AppTheme.primaryColor
                  : AppTheme.getTextSecondary(widget.isDarkMode),
            ),
          ),
        ),
      ),
    );
  }
}

class _MobileNavItem extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final bool isDarkMode;

  const _MobileNavItem({
    required this.label,
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
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        color: _isPressed
            ? (widget.isDarkMode
                  ? AppTheme.primaryColor.withOpacity(0.2)
                  : AppTheme.lightPrimaryColor.withOpacity(0.1))
            : Colors.transparent,
        child: Text(
          widget.label,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppTheme.getTextPrimary(widget.isDarkMode),
          ),
        ),
      ),
    );
  }
}
