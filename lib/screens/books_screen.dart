import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/book_card.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  static const List<Map<String, dynamic>> _books = [
    {
      'title': 'Textbook of Sociology for Physiotherapy Students',
      'pages': '191 pages',
      'isbn': '978-9376862016',
      'description':
          'Covers physiotherapy syllabus as per Indian universities, ensuring exam relevance. Includes case studies, illustrations, and practical examples. Explains social and cultural factors affecting patient health and recovery.',
      'amazon': 'https://www.amazon.in/dp/9376862015',
      'flipkart': 'https://www.flipkart.com/product/p/itme?pid=9789376862016',
    },
    {
      'title': 'Textbook of Psychology for Physiotherapy Students',
      'pages': '340 pages',
      'isbn': '978-9376868810',
      'description':
          'Aligned with the latest NCAHP curriculum, integrating psychological concepts with clinical physiotherapy practice. Uses simple language with examples, charts, and illustrations for easy learning.',
      'amazon': 'https://www.amazon.in/dp/9376862015',
      'flipkart': 'https://www.flipkart.com/product/p/itme?pid=9789376862016',
    },
    {
      'title': 'Pedagogy in Physiotherapy: Theories and Practices',
      'pages': '274 pages',
      'isbn': '978-9374245941',
      'description':
          'Provides comprehensive understanding of teaching methods in physiotherapy education. Bridges theory with practical teaching strategies for clinical and academic settings.',
      'amazon': 'https://www.amazon.in/Pedagogy-Physiotherapy-Practices-Curriculum-Compliant/dp/9374245949/',
      'flipkart': 'https://www.flipkart.com/pedagogy-physiotherapy-theories-practices-ncahp-2025-curriculum-compliant/p/itm742da9f7100e1',
    },
    {
      'title': 'Management and Administration in Physiotherapy Practice',
      'pages': '218 pages',
      'isbn': '978-9374241431',
      'description':
          'Covers essential topics like planning, staffing, budgeting, and quality control in physiotherapy services. Builds practical management and administrative skills for clinics and hospitals.',
      'amazon': 'https://www.amazon.in/Management-Administration-Physiotherapy-Practice-Curriculum/dp/9374241439/',
      'flipkart': 'https://www.flipkart.com/management-administration-physiotherapy-practice-ncahp-2025-curriculum-compliant/p/itmee13219fec5a4',
    },
    {
      'title': 'Foundations of Ethics and Professionalism in Physiotherapy Practice',
      'pages': '228 pages',
      'isbn': '978-9374244210',
      'description':
          'Covers core ethical principles, professional conduct, and legal aspects in physiotherapy. Emphasises accountability, integrity, and patient-centered care values.',
      'amazon': 'https://www.amazon.in/Foundations-Ethics-Professionalism-Physiotherapy-Practice/dp/9374244217/',
      'flipkart': 'https://www.flipkart.com/foundations-ethics-professionalism-physiotherapy-practice-ncahp-2025-curriculum-compliant/p/itm9ca6a516f44c0',
    },
  ];

  Future<void> _openUrl(String url) async {
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
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Publications & Authorship', style: theme.textTheme.displayMedium),
              const SizedBox(height: 16),
              Text(
                'A collection of NCAHP-curriculum-aligned textbooks and research contributions shaping physiotherapy education across India.',
                style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
              ),
              const SizedBox(height: 64),
              
              // ── Featured Textbooks ─────────────────────────────────────────
              Text(
                'Published Textbooks',
                style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                '5 titles published · 2 more under preparation',
                style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[500]),
              ),
              const SizedBox(height: 32),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 380,
                  childAspectRatio: 0.62,
                  crossAxisSpacing: 28,
                  mainAxisSpacing: 28,
                ),
                itemCount: _books.length,
                itemBuilder: (context, index) {
                  final book = _books[index];
                  return BookCard(
                    title: book['title'] as String,
                    description: book['description'] as String,
                    pages: book['pages'] as String,
                    isbn: book['isbn'] as String,
                    amazonUrl: book['amazon'] as String,
                    flipkartUrl: book['flipkart'] as String,
                  );
                },
              ),

              const SizedBox(height: 80),

              // ── Research Publications ─────────────────────────────────────
              Text(
                'Research Publications',
                style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              _buildScholarBanner(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScholarBanner(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary.withValues(alpha: 0.06),
            theme.colorScheme.secondary.withValues(alpha: 0.04),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.science, color: theme.colorScheme.primary, size: 36),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '30+ Peer-Reviewed Research Articles',
                      style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Published in national and international physiotherapy and health sciences journals.',
                      style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          Wrap(
            spacing: 16,
            runSpacing: 12,
            children: [
              ElevatedButton.icon(
                onPressed: () => _openUrl(
                  'https://scholar.google.com/citations?user=D22r0K4AAAAJ&hl=en',
                ),
                icon: const Icon(Icons.open_in_new, size: 18),
                label: const Text('View All on Google Scholar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
