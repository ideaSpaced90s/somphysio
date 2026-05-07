import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

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
                      title: 'Office Location',
                      subtitle: 'Department of Physiotherapy, [University Name], City, State.',
                    ),
                    const SizedBox(height: 24),
                    _ContactDetail(
                      icon: Icons.email,
                      title: 'Email Address',
                      subtitle: 'dr.somnath@university.edu',
                    ),
                    const SizedBox(height: 24),
                    _ContactDetail(
                      icon: Icons.access_time,
                      title: 'Consultation Hours',
                      subtitle: 'Mon - Fri: 09:00 AM - 04:00 PM',
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
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 30,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Send a Message', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 32),
                      const TextField(decoration: InputDecoration(labelText: 'Full Name', border: OutlineInputBorder())),
                      const SizedBox(height: 24),
                      const TextField(decoration: InputDecoration(labelText: 'Email Address', border: OutlineInputBorder())),
                      const SizedBox(height: 24),
                      const TextField(
                        decoration: InputDecoration(labelText: 'Message', border: OutlineInputBorder()), 
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

  const _ContactDetail({required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withOpacity(0.05),
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
              Text(subtitle, style: TextStyle(color: Colors.grey[600])),
            ],
          ),
        ),
      ],
    );
  }
}
