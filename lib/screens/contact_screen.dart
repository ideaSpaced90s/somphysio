import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    // Responsive aspect ratio and padding calculations
    double childAspectRatio = 1.3;
    double horizontalPadding = 24.0;
    double verticalPadding = 80.0;
    double maxGridWidth = 1100.0;
    int crossAxisCount = 3;

    if (width < 600) {
      childAspectRatio = 1.35;
      horizontalPadding = 16.0;
      verticalPadding = 48.0;
      crossAxisCount = 1;
    } else if (width < 900) {
      childAspectRatio = 1.4;
      horizontalPadding = 24.0;
      verticalPadding = 64.0;
      crossAxisCount = 2;
    } else {
      childAspectRatio = 1.25;
      horizontalPadding = 32.0;
      verticalPadding = 80.0;
      crossAxisCount = 3;
    }

    final List<Map<String, dynamic>> contactItems = [
      {
        'icon': Icons.location_on_outlined,
        'title': 'Base Location',
        'subtitle': 'Kolkata, West Bengal, India',
      },
      {
        'icon': Icons.business_outlined,
        'title': 'Institutional Address',
        'subtitle': 'Dept. of Physiotherapy, IGTAMSU, Arunachal Pradesh',
      },
      {
        'icon': Icons.email_outlined,
        'title': 'Email Address',
        'subtitle': 'somsankar.mukherjee@gmail.com',
        'actionLabel': 'Send Email',
        'onTap': () => _launchUrl('mailto:somsankar.mukherjee@gmail.com'),
      },
      {
        'icon': Icons.phone_outlined,
        'title': 'Phone & Direct Contact',
        'subtitle': '(+91) 7630059755',
        'actionLabel': 'Call Doctor',
        'onTap': () => _launchUrl('tel:+917630059755'),
      },
      {
        'icon': Icons.science_outlined,
        'title': 'Google Scholar',
        'subtitle': 'View 30+ Research Publications',
        'actionLabel': 'View Publications',
        'onTap': () => _launchUrl(
              'https://scholar.google.com/citations?user=D22r0K4AAAAJ&hl=en',
            ),
      },
      {
        'icon': Icons.schedule_outlined,
        'title': 'Consultation Hours',
        'subtitle': 'Mon – Fri: 09:00 AM – 04:00 PM',
      },
    ];

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: horizontalPadding),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxGridWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header Section
              Text(
                'Get in Touch',
                style: theme.textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 650),
                child: Text(
                  'Whether it is for a clinical consultation, academic collaboration, or speaking engagement, feel free to reach out directly.',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              if (width < 950) ...[
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () => _launchUrl(
                    'https://wa.me/917630059755?text=Hello%20Dr.%20Mukherjee,%20I%20would%20like%20to%20book%20an%20appointment.',
                  ),
                  icon: const Icon(Icons.calendar_month, size: 18),
                  label: const Text('Book Appointment'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 2,
                    textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
              ],
              const SizedBox(height: 48),

              // Contact Cards Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: childAspectRatio,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                ),
                itemCount: contactItems.length,
                itemBuilder: (context, index) {
                  final item = contactItems[index];
                  return _ContactCard(
                    icon: item['icon'] as IconData,
                    title: item['title'] as String,
                    subtitle: item['subtitle'] as String,
                    actionLabel: item['actionLabel'] as String?,
                    onTap: item['onTap'] as VoidCallback?,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String? actionLabel;
  final VoidCallback? onTap;

  const _ContactCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.actionLabel,
    this.onTap,
  });

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isClickable = widget.onTap != null;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: isClickable ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          transform: _isHovered
              ? Matrix4.translationValues(0.0, -6.0, 0.0)
              : Matrix4.identity(),
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isHovered
                  ? theme.colorScheme.primary.withValues(alpha: 0.3)
                  : Colors.grey[200]!,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? theme.colorScheme.primary.withValues(alpha: 0.08)
                    : Colors.black.withValues(alpha: 0.02),
                blurRadius: _isHovered ? 24 : 10,
                offset: _isHovered ? const Offset(0, 10) : const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon Container
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: _isHovered
                      ? theme.colorScheme.primary.withValues(alpha: 0.1)
                      : theme.colorScheme.primary.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  widget.icon,
                  color: theme.colorScheme.primary,
                  size: 28,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Text(
                  widget.subtitle,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (isClickable && widget.actionLabel != null) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      widget.actionLabel!,
                      style: TextStyle(
                        color: theme.colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: theme.colorScheme.secondary,
                      size: 14,
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
