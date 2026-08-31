import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class ResearchScreen extends StatelessWidget {
  const ResearchScreen({super.key});

  static const String _scholarUrl =
      'https://scholar.google.com/citations?user=D22r0K4AAAAJ&hl=en';

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 768;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 32 : 64,
        horizontal: isMobile ? 16 : 32,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── 0. Header Image Banner (img3.PNG) ───────────────────────────
              _buildHeaderBanner(context, isMobile),
              const SizedBox(height: 32),

              // ── 1. Hero & Impact Header ─────────────────────────────────────
              _buildHeroHeader(context, isMobile),
              const SizedBox(height: 36),

              // ── 2. Stat Impact Bar ──────────────────────────────────────────
              _buildImpactMetricsBar(context, isMobile),
              const SizedBox(height: 56),

              // ── 3. Scholar Dashboard & Academic Mentorship Hub ──────────────
              if (isMobile)
                Column(
                  children: [
                    _buildScholarHub(context),
                    const SizedBox(height: 32),
                    _buildMentorshipHub(context),
                  ],
                )
              else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: _buildScholarHub(context),
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                      flex: 2,
                      child: _buildMentorshipHub(context),
                    ),
                  ],
                ),
              const SizedBox(height: 64),

              // ── 5. Key Research Domains (Bento Grid) ────────────────────────
              _buildSectionHeader(
                context,
                title: 'Core Research Domains & Specializations',
                subtitle:
                    'Investigating evidence-based physical rehabilitation, academic pedagogy models, and health system governance.',
                icon: Icons.science_outlined,
              ),
              const SizedBox(height: 28),
              _buildResearchDomainsBento(context, isMobile),
              const SizedBox(height: 64),

              // ── 6. Press & Literature Times Editorial Hub ───────────────────
              _buildSectionHeader(
                context,
                title: 'Press Coverage & Editorial Features',
                subtitle:
                    'National literary reviews, book releases, and author spotlights published in The Literature Times.',
                icon: Icons.newspaper_outlined,
              ),
              const SizedBox(height: 28),
              _buildLiteratureTimesHub(context, isMobile),
              const SizedBox(height: 64),

              // ── 7. Scientific Contributions & Academic Collaboration ─────────
              _buildScientificContributionsBanner(context, isMobile),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // 0. HEADER IMAGE BANNER (img3.PNG)
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildHeaderBanner(BuildContext context, bool isMobile) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: AspectRatio(
          aspectRatio: isMobile ? 3.0 : 4.5, // Slim editorial banner profile
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

  // ─────────────────────────────────────────────────────────────────────────
  // 1. HERO HEADER
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildHeroHeader(BuildContext context, bool isMobile) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 24 : 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A237E).withValues(alpha: 0.04),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Scholarly Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: theme.colorScheme.primary.withValues(alpha: 0.2),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.verified_outlined,
                  size: 16,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'PEER-REVIEWED RESEARCH & ACADEMIC SCHOLARSHIP',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.8,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Main Title
          Text(
            'Research & Publications',
            style: theme.textTheme.displayMedium?.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
              fontSize: isMobile ? 32 : 46,
              height: 1.15,
            ),
          ),
          const SizedBox(height: 16),

          // Subtitle
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 860),
            child: Text(
              'Advancing evidence-based practice and physiotherapy education through scientific rigor, international journal publications, and standard-setting textbooks across India and global healthcare academia.',
              style: theme.textTheme.titleMedium?.copyWith(
                color: const Color(0xFF475569),
                height: 1.6,
                fontSize: isMobile ? 15 : 17,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // 2. STAT IMPACT BAR
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildImpactMetricsBar(BuildContext context, bool isMobile) {
    final stats = [
      {
        'value': '30+',
        'label': 'Peer-Reviewed Articles',
        'sub': 'International & National Journals',
        'icon': Icons.article_outlined,
      },
      {
        'value': '9+',
        'label': 'Academic Textbooks',
        'sub': 'NCAHP Curriculum Compliant',
        'icon': Icons.menu_book_outlined,
      },
      {
        'value': '4',
        'label': 'PhD Candidates Guided',
        'sub': 'Doctoral Health Sciences',
        'icon': Icons.school_outlined,
      },
      {
        'value': '20+',
        'label': 'Years Clinical Evidence',
        'sub': 'Sports Physio & Rehabilitation',
        'icon': Icons.verified_user_outlined,
      },
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 28,
        vertical: 24,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0F172A),
            Color(0xFF1E293B),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withValues(alpha: 0.25),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: isMobile
          ? Column(
              children: [
                for (int i = 0; i < stats.length; i++) ...[
                  _buildStatPill(stats[i]),
                  if (i < stats.length - 1)
                    Divider(
                      color: Colors.white.withValues(alpha: 0.12),
                      height: 24,
                    ),
                ],
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (int i = 0; i < stats.length; i++) ...[
                  Expanded(child: _buildStatPill(stats[i])),
                  if (i < stats.length - 1)
                    Container(
                      width: 1,
                      height: 48,
                      color: Colors.white.withValues(alpha: 0.15),
                    ),
                ],
              ],
            ),
    );
  }

  Widget _buildStatPill(Map<String, dynamic> stat) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF38BDF8).withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              stat['icon'] as IconData,
              color: const Color(0xFF38BDF8),
              size: 22,
            ),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                stat['value'] as String,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  letterSpacing: -0.5,
                ),
              ),
              Text(
                stat['label'] as String,
                style: const TextStyle(
                  color: Color(0xFFF1F5F9),
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
              Text(
                stat['sub'] as String,
                style: TextStyle(
                  color: const Color(0xFF94A3B8).withValues(alpha: 0.9),
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // 3. SCHOLAR DASHBOARD & ACADEMIC MENTORSHIP HUB
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildScholarHub(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 16,
            offset: const Offset(0, 6),
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
                  color: const Color(0xFF4285F4).withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.school,
                  color: Color(0xFF1A73E8),
                  size: 26,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Google Scholar Index',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      'Citations, Indexed Metrics & Verified Peer Papers',
                      style: TextStyle(fontSize: 13, color: Color(0xFF64748B)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Dr. Som Sankar Mukherjee\'s scholarly body of work is globally indexed and tracked on Google Scholar. His publications encompass scientific research in sports rehabilitation, musculoskeletal physiotherapy, academic pedagogy curricula, and clinical sociology.',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF475569),
              height: 1.6,
            ),
          ),
          const SizedBox(height: 20),

          // Indexed Topics Chips
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              _TopicChip(label: 'Sports Physical Therapy'),
              _TopicChip(label: 'Rehabilitation Biomechanics'),
              _TopicChip(label: 'Physiotherapy Pedagogy'),
              _TopicChip(label: 'Clinical Sociology'),
              _TopicChip(label: 'Healthcare Governance'),
            ],
          ),
          const SizedBox(height: 28),

          // Direct Google Scholar Action Card
          InkWell(
            onTap: () => _openUrl(_scholarUrl),
            borderRadius: BorderRadius.circular(14),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: const Color(0xFF1A73E8).withValues(alpha: 0.3),
                  width: 1.5,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A73E8).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.open_in_new,
                      color: Color(0xFF1A73E8),
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'View Full Profile on Google Scholar',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0xFF1A73E8),
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'scholar.google.com · Citations, co-authors & publication metrics',
                          style: TextStyle(
                            fontSize: 11.5,
                            color: Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: Color(0xFF1A73E8),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMentorshipHub(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF1E1B4B).withValues(alpha: 0.04),
            const Color(0xFF312E81).withValues(alpha: 0.08),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: theme.colorScheme.secondary.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondary.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.psychology,
                  color: theme.colorScheme.secondary,
                  size: 26,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Academic Mentorship',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      'Doctoral & Postgraduate Guidance',
                      style: TextStyle(fontSize: 13, color: Color(0xFF64748B)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildMentorshipItem(
            context,
            icon: Icons.school,
            badge: '4 PhD SCHOLARS',
            badgeColor: theme.colorScheme.primary,
            title: 'Doctoral Candidates Supervised',
            description:
                'Currently guiding advanced doctoral researchers focusing on clinical physiotherapy methods, musculoskeletal epidemiology, and health systems.',
          ),
          const SizedBox(height: 20),
          _buildMentorshipItem(
            context,
            icon: Icons.emoji_events,
            badge: '7+ POSTGRADUATES',
            badgeColor: const Color(0xFFD97706),
            title: 'Master of Physiotherapy (MPT) Theses',
            description:
                'Supervised and successfully awarded postgraduate theses specializing in sports physical therapy, kinesiology, and exercise physiology.',
          ),
        ],
      ),
    );
  }

  Widget _buildMentorshipItem(
    BuildContext context, {
    required IconData icon,
    required String badge,
    required Color badgeColor,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: badgeColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(icon, size: 16, color: badgeColor),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: badgeColor.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  badge,
                  style: TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.bold,
                    color: badgeColor,
                    letterSpacing: 0.4,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(
              fontSize: 12.5,
              color: Color(0xFF64748B),
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // 5. KEY RESEARCH DOMAINS (BENTO GRID)
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildResearchDomainsBento(BuildContext context, bool isMobile) {
    final domains = [
      {
        'title': 'Sports Physical Therapy & Rehabilitation',
        'badge': 'CLINICAL KINETICS',
        'color': const Color(0xFF0284C7),
        'icon': Icons.sports_gymnastics,
        'desc':
            'Advanced clinical investigation into athletic injury pathways, neuromuscular rehabilitation, sports fitness conditioning, and performance enhancement protocols.',
        'points': [
          'Kinetic chain recovery protocols',
          'Evidence-based athletic rehab',
          'Musculoskeletal injury prevention',
        ],
      },
      {
        'title': 'Academic Pedagogy & Curriculum Standards',
        'badge': 'EDUCATION SCIENCE',
        'color': const Color(0xFF1A237E),
        'icon': Icons.menu_book,
        'desc':
            'Fostering modern teaching methodologies, clinical training integration, objective assessments, and alignment with national regulatory council guidelines.',
        'points': [
          'NCAHP 2025 curriculum alignment',
          'Competency-based clinical pedagogy',
          'Simulation-based learning models',
        ],
      },
      {
        'title': 'Clinical Sociology & Healthcare Systems',
        'badge': 'HEALTH POLICY',
        'color': const Color(0xFFD97706),
        'icon': Icons.groups,
        'desc':
            'Investigating social, economic, and institutional factors influencing patient adherence, community health dynamics, and national healthcare delivery frameworks.',
        'points': [
          'Indian healthcare delivery models',
          'Socio-cultural recovery barriers',
          'Public health rehabilitation policy',
        ],
      },
      {
        'title': 'Ethical Codes, Governance & Professionalism',
        'badge': 'BIOETHICS & LAW',
        'color': const Color(0xFF059669),
        'icon': Icons.gavel,
        'desc':
            'Establishing rigorous frameworks for clinical accountability, bioethics, patient rights, legal jurisprudence, and professional core values in modern therapy.',
        'points': [
          'Legal & ethical accountability',
          'Patient-centered value frameworks',
          'Institutional regulatory compliance',
        ],
      },
    ];

    return isMobile
        ? Column(
            children: domains
                .map((d) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _buildDomainCard(context, d),
                    ))
                .toList(),
          )
        : GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              mainAxisExtent: 260,
            ),
            itemCount: domains.length,
            itemBuilder: (context, index) =>
                _buildDomainCard(context, domains[index]),
          );
  }

  Widget _buildDomainCard(BuildContext context, Map<String, dynamic> domain) {
    final Color color = domain['color'] as Color;
    final List<String> points = domain['points'] as List<String>;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
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
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(domain['icon'] as IconData, color: color, size: 22),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  domain['badge'] as String,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: color,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            domain['title'] as String,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFF0F172A),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          Text(
            domain['desc'] as String,
            style: const TextStyle(
              fontSize: 12.5,
              color: Color(0xFF64748B),
              height: 1.45,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          const Divider(height: 1, color: Color(0xFFF1F5F9)),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: points
                .map(
                  (p) => Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Row(
                      children: [
                        Icon(Icons.check_circle_outline,
                            size: 13, color: color),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            p,
                            style: const TextStyle(
                              fontSize: 11.5,
                              color: Color(0xFF334155),
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // 6. PRESS & LITERATURE TIMES EDITORIAL HUB
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildLiteratureTimesHub(BuildContext context, bool isMobile) {
    final articles = [
      {
        'tag': 'TRILOGY RELEASE',
        'title': 'Research Methodology for Allied & Healthcare Professionals (Vol. 1)',
        'pub': 'The Literature Times Feature',
        'desc':
            'Coverage of the national release of Volume 1, establishing research foundational standards for Master\'s and PhD candidates.',
        'url':
            'https://www.theliteraturetimes.com/book-release-guide-to-research-methodology-for-allied-and-healthcare-professionals-by-dr-som-sankar-mukherjee-phd/',
      },
      {
        'tag': 'BOOK LAUNCH',
        'title': 'Research Methodology Volume 2: Advanced Design & Biostatistics',
        'pub': 'The Literature Times Review',
        'desc':
            'Critique and launch overview of Volume 2, focusing on clinical sampling, epidemiological designs, and statistical computation.',
        'url':
            'https://www.theliteraturetimes.com/book-release-guide-to-research-methodology-for-allied-and-healthcare-professionals-volume-2-by-dr-som-sankar-mukherjee-ph-d/',
      },
      {
        'tag': 'CONCLUDING VOLUME',
        'title': 'Research Methodology Volume 3: Data Analysis & Publishing',
        'pub': 'The Literature Times Announcement',
        'desc':
            'Feature report detailing the culmination of the trilogy, covering ethical approvals, thesis defense, and indexed journal submissions.',
        'url':
            'https://www.theliteraturetimes.com/book-release-guide-to-research-methodology-for-allied-and-healthcare-professionals-volume-3-by-dr-som-sankar-mukherjee-ph-d/',
      },
      {
        'tag': 'AUTHOR SPOTLIGHT',
        'title': 'Dr. Som Sankar Mukherjee: Author Profile & Academic Legacy',
        'pub': 'The Literature Times National Press',
        'desc':
            'In-depth biographical profile celebrating 20 years of clinical contributions, textbook publications, and council leadership.',
        'url': 'https://www.theliteraturetimes.com/search/Som+Sankar+Mukherjee/',
      },
    ];

    return isMobile
        ? Column(
            children: articles
                .map((a) => Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: _buildEditorialArticleCard(context, a),
                    ))
                .toList(),
          )
        : GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              mainAxisExtent: 145,
            ),
            itemCount: articles.length,
            itemBuilder: (context, index) =>
                _buildEditorialArticleCard(context, articles[index]),
          );
  }

  Widget _buildEditorialArticleCard(
    BuildContext context,
    Map<String, String> article,
  ) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: () => _openUrl(article['url']!),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE2E8F0)),
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
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.article_outlined,
                size: 22,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          article['tag']!,
                          style: const TextStyle(
                            fontSize: 9.5,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF475569),
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          article['pub']!,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF94A3B8),
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    article['title']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.5,
                      color: Color(0xFF0F172A),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        'Read Full Article',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.open_in_new,
                        size: 13,
                        color: theme.colorScheme.secondary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // 7. SCIENTIFIC CONTRIBUTIONS & ACADEMIC COLLABORATION
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildScientificContributionsBanner(
    BuildContext context,
    bool isMobile,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 24 : 36),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withValues(alpha: 0.2),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildContributionsContent(context),
                const SizedBox(height: 24),
                _buildCollaborationButton(context),
              ],
            )
          : Row(
              children: [
                Expanded(
                  flex: 3,
                  child: _buildContributionsContent(context),
                ),
                const SizedBox(width: 32),
                Expanded(
                  flex: 1,
                  child: _buildCollaborationButton(context),
                ),
              ],
            ),
    );
  }

  Widget _buildContributionsContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Row(
          children: [
            Icon(Icons.workspace_premium, color: Color(0xFFFBBF24), size: 22),
            SizedBox(width: 10),
            Text(
              'PEER REVIEW & EDITORIAL LEADERSHIP',
              style: TextStyle(
                color: Color(0xFFFBBF24),
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Text(
          'Active Peer Reviewer, Editorial Contributor & Council Leader',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: -0.3,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Beyond authorship, Dr. Mukherjee serves as an academic reviewer and editorial advisor for national and international biomedical publications. He regularly chairs research symposia, guides institutional ethics panels, and contributes to standardizing allied health curricula across India.',
          style: TextStyle(
            color: Color(0xFF94A3B8),
            fontSize: 13.5,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildCollaborationButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => context.go('/contact'),
      icon: const Icon(Icons.mail_outline, size: 18),
      label: const Text(
        'Research Inquiries',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF0F172A),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        shape: _roundedBorder(12),
        elevation: 0,
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // HELPER SECTION HEADER
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildSectionHeader(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, size: 20, color: theme.colorScheme.primary),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  letterSpacing: -0.3,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          subtitle,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: const Color(0xFF64748B),
            height: 1.4,
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────
// HELPER WIDGETS
// ─────────────────────────────────────────────────────────────────────────

class _TopicChip extends StatelessWidget {
  final String label;
  const _TopicChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Text(
        '# $label',
        style: const TextStyle(
          fontSize: 12,
          color: Color(0xFF334155),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

RoundedRectangleBorder _roundedBorder(double radius) {
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(radius),
  );
}

