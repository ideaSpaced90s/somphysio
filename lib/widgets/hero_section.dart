import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 1000;

    return Stack(
      children: [
        // Background feature image with dark overlay
        Positioned.fill(
          child: Image.asset(
            'assets/images/feature_bg.jpg',
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  theme.colorScheme.primary.withValues(alpha: 0.92),
                  theme.colorScheme.primary.withValues(alpha: 0.75),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),

        // Foreground content
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 64,
            vertical: isMobile ? 64 : 120,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 80,
                runSpacing: 40,
                children: [
                  // Text Content
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Column(
                      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.white.withValues(alpha: 0.4)),
                          ),
                          child: Text(
                            'PROFESSOR | MPT | PhD | PHYSIOTHERAPIST',
                            style: theme.textTheme.labelLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          '20 Years of Clinical Excellence,\nShaping the Future of Physiotherapy.',
                          style: theme.textTheme.displayMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                            color: Colors.white,
                          ),
                          textAlign: isMobile ? TextAlign.center : TextAlign.start,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Dr. Som Sankar Mukherjee is a dynamic and accomplished Physiotherapy professional with 20 years of clinical excellence and 18 years of academic expertise. Currently Chairperson of the Arunachal Pradesh Allied & Healthcare Council, he is the author of 7+ textbooks and 30+ research articles, committed to advancing evidence-based practice and transformative education.',
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: Colors.white.withValues(alpha: 0.9),
                            height: 1.6,
                          ),
                          textAlign: isMobile ? TextAlign.center : TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  // Profile Image
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 420,
                        height: 420,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.3),
                            width: 20,
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Image.asset(
                          'assets/images/dr_som_profile.png',
                          width: 400,
                          height: 400,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            width: 400,
                            height: 400,
                            color: Colors.grey[200],
                            child: const Icon(Icons.person, size: 100, color: Colors.grey),
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
      ],
    );
  }
}
