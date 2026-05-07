import 'package:flutter/material.dart';
import '../widgets/hero_section.dart';
import '../widgets/feature_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return SingleChildScrollView(
      child: Column(
        children: [
          const HeroSection(),
          
          // Highlights Section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
            child: Column(
              children: [
                Text(
                  'Professional Pillars',
                  style: theme.textTheme.headlineLarge,
                ),
                const SizedBox(height: 16),
                Text(
                  'A legacy of academic leadership and clinical dedication.',
                  style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
                ),
                const SizedBox(height: 64),
                Wrap(
                  spacing: 32,
                  runSpacing: 32,
                  alignment: WrapAlignment.center,
                  children: const [
                    FeatureCard(
                      icon: Icons.account_balance,
                      title: 'Academic Leadership',
                      description: 'As the Head of Department (HOD) in a top-tier university, I lead curriculum innovation and faculty excellence.',
                    ),
                    FeatureCard(
                      icon: Icons.medical_services,
                      title: 'Clinical Excellence',
                      description: 'With a Doctorate in Physical Therapy, I provide evidence-based care specializing in musculoskeletal rehabilitation.',
                    ),
                    FeatureCard(
                      icon: Icons.menu_book,
                      title: 'Published Author',
                      description: 'Author of multiple textbooks and research papers shaping the future of physiotherapy education.',
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Academic Credential Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
            color: theme.colorScheme.primary.withValues(alpha: 0.02),
            child: Column(
              children: [
                Text(
                  'Academic Affiliations',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 48),
                Wrap(
                  spacing: 64,
                  runSpacing: 32,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    _AffiliationIcon(label: 'UNIVERSITY HOD'),
                    _AffiliationIcon(label: 'BOARD CERTIFIED'),
                    _AffiliationIcon(label: 'MPT COUNCIL'),
                    _AffiliationIcon(label: 'RESEARCH GATE'),
                  ],
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}

class _AffiliationIcon extends StatelessWidget {
  final String label;
  const _AffiliationIcon({required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Icon(Icons.school, color: Colors.grey[400], size: 40),
        ),
        const SizedBox(height: 12),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.grey[500],
            letterSpacing: 1.1,
          ),
        ),
      ],
    );
  }
}
