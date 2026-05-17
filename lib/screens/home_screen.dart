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
                  'A legacy of academic leadership, clinical dedication, and scholarly contribution.',
                  style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
                  textAlign: TextAlign.center,
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
                      description: 'As former HOD at IGTAMSU and now Chairperson of the Arunachal Pradesh Allied & Healthcare Council, Dr. Mukherjee drives institutional and policy-level healthcare education across the nation.',
                    ),
                    FeatureCard(
                      icon: Icons.medical_services,
                      title: 'Clinical Excellence',
                      description: 'With a PhD and MPT (Sports) from Dr. NTRUHS, Dr. Mukherjee brings 20 years of hands-on clinical practice in physiotherapy, delivering evidence-based patient-centered care.',
                    ),
                    FeatureCard(
                      icon: Icons.menu_book,
                      title: 'Published Author',
                      description: 'Author of 7+ physiotherapy textbooks and 30+ peer-reviewed research articles, shaping the future of physiotherapy education across India and internationally.',
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Stats Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
            color: theme.colorScheme.primary,
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: Wrap(
                  spacing: 64,
                  runSpacing: 40,
                  alignment: WrapAlignment.spaceAround,
                  children: const [
                    _StatItem(value: '20+', label: 'Years of Clinical Practice'),
                    _StatItem(value: '18+', label: 'Years in Academia'),
                    _StatItem(value: '7+', label: 'Textbooks Published'),
                    _StatItem(value: '30+', label: 'Research Articles'),
                  ],
                ),
              ),
            ),
          ),

          // Academic Affiliations Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
            color: theme.colorScheme.primary.withValues(alpha: 0.02),
            child: Column(
              children: [
                Text(
                  'Institutional Affiliations',
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
                  children: const [
                    _AffiliationIcon(label: 'IGTAMSU', icon: Icons.account_balance),
                    _AffiliationIcon(label: 'DR. NTRUHS', icon: Icons.local_hospital),
                    _AffiliationIcon(label: 'AP COUNCIL', icon: Icons.gavel),
                    _AffiliationIcon(label: 'GOOGLE SCHOLAR', icon: Icons.science),
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

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white.withValues(alpha: 0.85),
            letterSpacing: 0.5,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _AffiliationIcon extends StatelessWidget {
  final String label;
  final IconData icon;
  const _AffiliationIcon({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey[200]!),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 12,
              ),
            ],
          ),
          child: Icon(icon, color: theme.colorScheme.primary, size: 36),
        ),
        const SizedBox(height: 12),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
            letterSpacing: 1.1,
          ),
        ),
      ],
    );
  }
}
