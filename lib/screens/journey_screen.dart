import 'package:flutter/material.dart';

class JourneyScreen extends StatelessWidget {
  const JourneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Academic & Clinical Journey', style: theme.textTheme.displayMedium),
              const SizedBox(height: 16),
              Text(
                'A timeline of excellence in education, leadership, and patient care.',
                style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
              ),
              const SizedBox(height: 64),
              
              // ── Career / Leadership ─────────────────────────────────────────
              _SectionHeader(title: 'Professional Experience'),
              _buildTimelineItem(
                context,
                'Feb 2025 – Present',
                'Chairperson',
                'Arunachal Pradesh Allied & Healthcare Council',
                'Leading regulatory, academic, and administrative functions ensuring quality healthcare education, professional standards, policy implementation, and institutional development statewide.',
              ),
              _buildTimelineItem(
                context,
                'Jan 2017 – Jan 2025',
                'Head of Department (HOD) – Physiotherapy',
                'Dept. of Physiotherapy, IGTAMSU',
                'Directed departmental academics, clinical training, research activities, faculty coordination, curriculum implementation, and student development — ensuring educational excellence and quality healthcare outcomes.',
              ),
              _buildTimelineItem(
                context,
                'Oct 2012 – July 2016',
                'Academician – Sports Sciences',
                'Mekelle University, Ethiopia',
                'Delivered quality education, supervised research, developed curriculum, mentored students, and promoted evidence-based sports fitness and sports injuries practices in an international academic setting.',
              ),
              _buildTimelineItem(
                context,
                'May 2009 – Apr 2012',
                'Academician – Physiotherapy',
                'SPG College of Health Sciences',
                'Delivered quality education, supervised research, developed curriculum, mentored students, and promoted evidence-based sports fitness and physiotherapy practices.',
              ),

              const SizedBox(height: 64),

              // ── Education ──────────────────────────────────────────────────
              _SectionHeader(title: 'Education'),
              _buildTimelineItem(
                context,
                'IGTAMSU',
                'PhD & M.Phil (Physiotherapy)',
                '',
                'Advanced doctoral research with focus on physiotherapy sciences and evidence-based rehabilitation practice.',
              ),
              _buildTimelineItem(
                context,
                'Dr. NTRUHS',
                'MPT (Sports), BPT',
                '',
                'Master of Physiotherapy specialising in Sports sciences; Bachelor of Physiotherapy — Dr. NTR University of Health Sciences, Andhra Pradesh.',
              ),

              const SizedBox(height: 64),

              // ── Research Guidance ──────────────────────────────────────────
              _SectionHeader(title: 'Research Guidance'),
              _buildResearchCard(context),

              const SizedBox(height: 64),

              // ── Skills ─────────────────────────────────────────────────────
              _SectionHeader(title: 'Core Competencies'),
              _buildSkillsGrid(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimelineItem(
    BuildContext context,
    String year,
    String title,
    String institution,
    String description,
  ) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 160,
            child: Text(
              year,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(width: 32),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                if (institution.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    institution,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: theme.colorScheme.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
                const SizedBox(height: 8),
                Text(
                  description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                Divider(color: Colors.grey[200]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResearchCard(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.12)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.school, color: theme.colorScheme.primary, size: 28),
                    const SizedBox(width: 12),
                    Text(
                      '4 PhD Students',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text('Currently Pursuing', style: TextStyle(color: Colors.grey[600])),
              ],
            ),
          ),
          Container(width: 1, height: 60, color: Colors.grey[300]),
          const SizedBox(width: 32),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.emoji_events, color: theme.colorScheme.secondary, size: 28),
                    const SizedBox(width: 12),
                    Text(
                      '7+ PG Students',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text('Degrees Awarded', style: TextStyle(color: Colors.grey[600])),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsGrid(BuildContext context) {
    const skills = [
      'Clinical Physiotherapy Practice',
      'Research Methodology',
      'Evidence-Based Practice',
      'Healthcare Administration',
      'Curriculum Development',
      'Leadership & Team Management',
      'Patient Assessment & Rehabilitation',
      'Scientific Writing & Publications',
      'Interdisciplinary Collaboration',
      'Student Guidance & Counseling',
      'Clinical Supervision',
      'Organisational & Administrative Management',
    ];

    final theme = Theme.of(context);
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: skills.map((skill) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[200]!),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 6,
            ),
          ],
        ),
        child: Text(
          skill,
          style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
      )).toList(),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 32,
            decoration: BoxDecoration(
              color: theme.colorScheme.secondary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}
