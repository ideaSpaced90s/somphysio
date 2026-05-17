import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ResearchScreen extends StatelessWidget {
  const ResearchScreen({super.key});

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 800;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 40 : 80,
        horizontal: 24,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Header Banner Bar ─────────────────────────────────────────
              _buildHeaderBanner(context, isMobile),
              const SizedBox(height: 48),

              // ── Title & Intro ──────────────────────────────────────────────
              Text(
                'Research & Publications',
                style: theme.textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Advancing evidence-based practice and physiotherapy education through scientific rigor and international publication.',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.grey[600],
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 48),

              // ── Main Content Grid ──────────────────────────────────────────
              isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildScholarDashboard(context),
                        const SizedBox(height: 32),
                        _buildMentorshipCard(context),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: _buildScholarDashboard(context),
                        ),
                        const SizedBox(width: 32),
                        Expanded(
                          flex: 2,
                          child: _buildMentorshipCard(context),
                        ),
                      ],
                    ),
              const SizedBox(height: 64),

              // ── Research Domains ───────────────────────────────────────────
              _SectionHeader(title: 'Key Research Domains'),
              const SizedBox(height: 24),
              _buildResearchDomains(context, isMobile),
              const SizedBox(height: 64),

              // ── Academic Affiliations ──────────────────────────────────────
              _SectionHeader(title: 'Scientific Contributions'),
              const SizedBox(height: 24),
              _buildContributionsCard(context, isMobile),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderBanner(BuildContext context, bool isMobile) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: isMobile ? 3 : 4.5, // Slim banner profile
          child: Image.asset(
            'assets/images/img3.PNG',
            fit: BoxFit.cover,
            alignment: Alignment.center,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.science,
                        size: 48,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Research Publications Header Banner',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildScholarDashboard(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.08),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.auto_stories,
                  color: theme.colorScheme.primary,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Google Scholar Citations',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Active index of peer-reviewed articles & textbooks',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 36),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem(context, '30+', 'Research Articles'),
              Container(width: 1, height: 50, color: Colors.grey[200]),
              _buildStatItem(context, '7+', 'Textbooks Published'),
              Container(width: 1, height: 50, color: Colors.grey[200]),
              _buildStatItem(context, '20+', 'Years Experience'),
            ],
          ),
          const SizedBox(height: 40),
          Divider(color: Colors.grey[200]),
          const SizedBox(height: 24),
          Text(
            'Dr. Som Sankar Mukherjee\'s publications are archived and tracked on Google Scholar, spanning clinical research in sports physiology, physical rehabilitation methodologies, and academic pedagogy standards.',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: Colors.grey[700],
              height: 1.6,
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () => _openUrl(
              'https://scholar.google.com/citations?user=D22r0K4AAAAJ&hl=en',
            ),
            icon: const Icon(Icons.school, size: 20),
            label: const Text('View Dr. Som\'s Google Scholar Profile'),
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 22),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, String value, String label) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          value,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: theme.textTheme.labelMedium?.copyWith(
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildMentorshipCard(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.secondary.withValues(alpha: 0.08),
            theme.colorScheme.primary.withValues(alpha: 0.04),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.secondary.withValues(alpha: 0.15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Academic Mentorship',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Guiding the next generation of clinical researchers and academic leaders.',
            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
          ),
          const SizedBox(height: 32),
          _buildMentorshipItem(
            context,
            Icons.school,
            '4 PhD Candidates',
            'Currently guiding advanced doctoral researchers focusing on physiotherapy sciences.',
            theme.colorScheme.primary,
          ),
          const SizedBox(height: 24),
          _buildMentorshipItem(
            context,
            Icons.emoji_events,
            '7+ Postgraduates',
            'Supervised and awarded postgraduate (MPT) degrees in specialized sports sciences.',
            theme.colorScheme.secondary,
          ),
        ],
      ),
    );
  }

  Widget _buildMentorshipItem(
    BuildContext context,
    IconData icon,
    String title,
    String description,
    Color accentColor,
  ) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: accentColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: accentColor, size: 22),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildResearchDomains(BuildContext context, bool isMobile) {
    final domains = [
      {
        'title': 'Sports Physical Therapy & Rehabilitation',
        'desc': 'Advanced research and rehabilitation design focusing on sports fitness, performance enhancement, and athletic injury recovery pathways.',
        'icon': Icons.sports_gymnastics,
      },
      {
        'title': 'Academic Pedagogy & Standards',
        'desc': 'Fostering modern teaching methodologies, curriculum design, clinical skill integration, and alignment with regulatory council paradigms.',
        'icon': Icons.menu_book,
      },
      {
        'title': 'Clinical Sociology & Healthcare Policy',
        'desc': 'Investigating social, cultural, and community dynamics influencing patient compliance, recovery outcomes, and healthcare administration.',
        'icon': Icons.groups,
      },
      {
        'title': 'Ethical Codes & Professionalism',
        'desc': 'Establishing frameworks for ethical practice, professional standards, clinical accountability, and patient-centered core values in rehabilitation.',
        'icon': Icons.gavel,
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 1 : 2,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        mainAxisExtent: isMobile ? 180 : 160,
      ),
      itemCount: domains.length,
      itemBuilder: (context, index) {
        final domain = domains[index];
        final theme = Theme.of(context);
        return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[150] ?? Colors.grey[200]!),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.02),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  domain['icon'] as IconData,
                  color: theme.colorScheme.primary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      domain['title'] as String,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: Text(
                        domain['desc'] as String,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                          height: 1.4,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContributionsCard(BuildContext context, bool isMobile) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ongoing Scientific Contributions',
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            'Apart from peer-reviewed journals, Dr. Som Sankar Mukherjee acts as an academic reviewer and editorial contributor for multiple international and national publications in allied health sciences. He actively leads and participates in research symposia, shaping evidence-based practices in contemporary physiotherapy.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.grey[650] ?? Colors.grey[700],
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Container(
          width: 4,
          height: 28,
          decoration: BoxDecoration(
            color: theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 16),
        Text(
          title,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
