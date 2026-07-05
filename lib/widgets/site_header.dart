import 'package:flutter/material.dart';

class SiteHeader extends StatelessWidget implements PreferredSizeWidget {
  final int currentIndex;
  final Function(int) onDestinationSelected;

  const SiteHeader({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final isNarrow = width < 1100;
    final isVeryNarrow = width < 950;
    final outerPadding = isVeryNarrow ? 16.0 : 24.0;
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: outerPadding, vertical: 12),
              child: Row(
                children: [
                  // Logo/Name
                  GestureDetector(
                    onTap: () => onDestinationSelected(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'DR. SOMSANKAR MUKHERJEE',
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: isVeryNarrow ? 16 : (isNarrow ? 18 : 22),
                            letterSpacing: isVeryNarrow ? 0.8 : 1.2,
                          ),
                        ),
                        Text(
                          'PROFESSOR | AUTHOR | PHYSIOTHERAPIST',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.secondary,
                            fontSize: isVeryNarrow ? 8 : (isNarrow ? 9 : 11),
                            letterSpacing: isVeryNarrow ? 1.0 : 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  // Navigation Links
                  _HeaderLink(
                    label: 'Home',
                    isSelected: currentIndex == 0,
                    onTap: () => onDestinationSelected(0),
                  ),
                  _HeaderLink(
                    label: 'Journey',
                    isSelected: currentIndex == 1,
                    onTap: () => onDestinationSelected(1),
                  ),
                  _HeaderLink(
                    label: 'Books',
                    isSelected: currentIndex == 2,
                    onTap: () => onDestinationSelected(2),
                  ),
                  _HeaderLink(
                    label: 'Research',
                    isSelected: currentIndex == 3,
                    onTap: () => onDestinationSelected(3),
                  ),
                  _HeaderLink(
                    label: 'Contact',
                    isSelected: currentIndex == 4,
                    onTap: () => onDestinationSelected(4),
                  ),
                  if (!isVeryNarrow) ...[
                    const SizedBox(width: 24),
                    // CTA Button
                    ElevatedButton(
                      onPressed: () => onDestinationSelected(4),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryColor,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: isNarrow ? 16 : 24,
                          vertical: isNarrow ? 12 : 18,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Book Appointment'),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class _HeaderLink extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _HeaderLink({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final double horizontalPadding = width < 950 ? 8.0 : (width < 1100 ? 12.0 : 16.0);
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: InkWell(
        onTap: onTap,
        onHover: (hovering) {
          // Add hover effect if desired
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: isSelected ? theme.primaryColor : theme.textTheme.bodyLarge?.color,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 2,
              width: isSelected ? 20 : 0,
              color: theme.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
