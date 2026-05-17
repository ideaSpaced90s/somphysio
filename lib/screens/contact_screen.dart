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

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Wrap(
            spacing: 80,
            runSpacing: 64,
            alignment: WrapAlignment.center,
            children: [
              // Contact Information
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Get in Touch', style: theme.textTheme.displaySmall),
                    const SizedBox(height: 24),
                    Text(
                      'Whether it is for a clinical consultation, academic collaboration, or speaking engagement, feel free to reach out.',
                      style: theme.textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 48),
                    _ContactDetail(
                      icon: Icons.location_on,
                      title: 'Base Location',
                      subtitle: 'Kolkata, West Bengal, India',
                    ),
                    const SizedBox(height: 24),
                    _ContactDetail(
                      icon: Icons.account_balance,
                      title: 'Institutional Address',
                      subtitle: 'Dept. of Physiotherapy, IGTAMSU, Arunachal Pradesh',
                    ),
                    const SizedBox(height: 24),
                    _ContactDetail(
                      icon: Icons.email,
                      title: 'Email Address',
                      subtitle: 'somsankar.mukherjee@gmail.com',
                      onTap: () => _launchUrl('mailto:somsankar.mukherjee@gmail.com'),
                    ),
                    const SizedBox(height: 24),
                    _ContactDetail(
                      icon: Icons.phone,
                      title: 'Phone / WhatsApp',
                      subtitle: '(+91) 7630059755',
                      onTap: () => _launchUrl('tel:+917630059755'),
                    ),
                    const SizedBox(height: 24),
                    _ContactDetail(
                      icon: Icons.science,
                      title: 'Google Scholar',
                      subtitle: 'View 30+ Research Publications',
                      onTap: () => _launchUrl(
                        'https://scholar.google.com/citations?user=D22r0K4AAAAJ&hl=en',
                      ),
                    ),
                    const SizedBox(height: 24),
                    _ContactDetail(
                      icon: Icons.access_time,
                      title: 'Consultation Hours',
                      subtitle: 'Mon – Fri: 09:00 AM – 04:00 PM',
                    ),
                  ],
                ),
              ),
              
              // Contact Form
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500),
                child: Container(
                  padding: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 30,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Send a Message',
                        style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Dr. Mukherjee typically responds within 1–2 business days.',
                        style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey[500]),
                      ),
                      const SizedBox(height: 32),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person_outline),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Subject',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.subject),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Message',
                          border: OutlineInputBorder(),
                          alignLabelWithHint: true,
                        ),
                        maxLines: 5,
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.primaryColor,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 60),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text('Send Message'),
                      ),
                    ],
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

class _ContactDetail extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const _ContactDetail({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: theme.colorScheme.primary, size: 24),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: onTap != null ? theme.colorScheme.secondary : Colors.grey[600],
                    decoration: onTap != null ? TextDecoration.underline : TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
