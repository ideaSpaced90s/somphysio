import 'package:flutter/material.dart';
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
      'coverImage': 'assets/images/sociology_cover.jpg',
      'purchaseLinks': {
        'Amazon': 'https://www.amazon.in/dp/9376862015',
        'Flipkart': 'https://www.flipkart.com/search?q=9789376862016',
        'Astitva Store': 'https://astitvaprakashan.com/?post_type=product&p=10216&preview=true',
        'Classic Shelf': 'https://classicshelf.in/products/textbook-of-sociology-for-physiotherapy-students-ncahp-2025-curriculum-compliant',
      },
    },
    {
      'title': 'Textbook of Psychology for Physiotherapy Students',
      'pages': '340 pages',
      'isbn': '978-9376868810',
      'description':
          'Aligned with the latest NCAHP curriculum, integrating psychological concepts with clinical physiotherapy practice. Uses simple language with examples, charts, and illustrations for easy learning.',
      'coverImage': 'assets/images/psychology_cover.jpg',
      'purchaseLinks': {
        'Amazon': 'https://www.amazon.in/dp/9376868811',
        'Flipkart': 'https://www.flipkart.com/search?q=9789376868810',
        'Astitva Store':
            'https://astitvaprakashan.com/product/textbook-of-psychology-for-physiotherapy-students-ncahp-2025-curriculum-compliant/',
        'Classic Shelf':
            'https://classicshelf.in/products/textbook-of-psychology-for-physiotherapy-students-ncahp-2025-curriculum-compliant',
      },
    },
    {
      'title': 'Pedagogy in Physiotherapy: Theories and Practices',
      'pages': '274 pages',
      'isbn': '978-9374245941',
      'description':
          'Provides comprehensive understanding of teaching methods in physiotherapy education. Bridges theory with practical teaching strategies for clinical and academic settings.',
      'coverImage': 'assets/images/pedagogy_cover.jpg',
      'purchaseLinks': {
        'Amazon': 'https://www.amazon.in/Pedagogy-Physiotherapy-Practices-Curriculum-Compliant/dp/9374245949/',
        'Flipkart': 'https://www.flipkart.com/pedagogy-physiotherapy-theories-practices-ncahp-2025-curriculum-compliant/p/itm742da9f7100e1',
        'Books Camel': 'https://bookscamel.in/app/views/shop-details.php?name=pedagogy-in-physiotherapy-theories-and-practices&q=MTM1NQ',
        'Crown Publishers': 'https://bookscamel.in/app/views/shop-details.php?id=1355',
      },
    },
    {
      'title': 'Management and Administration in Physiotherapy Practice',
      'pages': '218 pages',
      'isbn': '978-9374241431',
      'description':
          'Covers essential topics like planning, staffing, budgeting, and quality control in physiotherapy services. Builds practical management and administrative skills for clinics and hospitals.',
      'coverImage': 'assets/images/management_cover.jpg',
      'purchaseLinks': {
        'Amazon': 'https://www.amazon.in/Management-Administration-Physiotherapy-Practice-Curriculum/dp/9374241439/',
        'Flipkart': 'https://www.flipkart.com/management-administration-physiotherapy-practice-ncahp-2025-curriculum-compliant/p/itmee13219fec5a4',
        'Books Camel': 'https://bookscamel.in/app/views/shop-details.php?name=management-and-administration-in-physiotherapy-practice&q=MTM1Mg',
        'Crown Publishers': 'https://bookscamel.in/app/views/shop-details.php?id=1352',
      },
    },
    {
      'title': 'Foundations of Ethics and Professionalism in Physiotherapy Practice',
      'pages': '228 pages',
      'isbn': '978-9374244210',
      'description':
          'Covers core ethical principles, professional conduct, and legal aspects in physiotherapy. Emphasises accountability, integrity, and patient-centered care values.',
      'coverImage': 'assets/images/ethics_cover.jpg',
      'purchaseLinks': {
        'Amazon': 'https://www.amazon.in/Foundations-Ethics-Professionalism-Physiotherapy-Practice/dp/9374244217/',
        'Flipkart': 'https://www.flipkart.com/foundations-ethics-professionalism-physiotherapy-practice-ncahp-2025-curriculum-compliant/p/itm9ca6a516f44c0',
        'Books Camel': 'https://bookscamel.in/app/views/shop-details.php?id=1354',
        'Crown Publishers': 'https://bookscamel.in/app/views/shop-details.php?name=foundations-of-ethics-and-professionalism-in-physiotherapy-practice&q=MTM1NA',
      },
    },
    {
      'title': 'Introduction to National Healthcare Delivery System in India : As per NCAHP Curriculum for Bachelor of Physiotherapy',
      'pages': '204 pages',
      'isbn': '978-9374244951',
      'description':
          'Covers the national healthcare delivery system in India as per the NCAHP curriculum for Bachelor of Physiotherapy. Provides vital insights into public health structure, national policies, and healthcare administration.',
      'coverImage': 'assets/images/healthcare_delivery_cover.jpg',
      'purchaseLinks': {
        'Amazon': 'https://www.amazon.in/dp/9374244950',
        'Flipkart': 'https://www.flipkart.com/introduction-national-healthcare-delivery-system-india-per-ncahp-curriculum-bachelor-physiotherapy/p/itme69400c75311e?pid',
        'Books Camel': 'https://bookscamel.in/app/views/shop-details.php?name=introduction-to-national-healthcare-delivery-system-in-india&q=MTUyNw',
        'Google Books': 'https://play.google.com/store/books/details?id=xmjvEQAAQBAJ',
      },
    },
    {
      'title': 'Guide to Research Methodology for Allied and Healthcare Professionals (Volume - 1)',
      'pages': '857 pages',
      'isbn': '978-9376860173',
      'description':
          'A comprehensive handbook for Master\'s and PhD scholars in allied and healthcare professions. Covers foundational research processes, problem formulation, hypothesis design, literature reviews, research designs, and biostatistics.',
      'coverImage': 'assets/images/research_methodology_vol1.jpg',
      'purchaseLinks': {
        'Amazon': 'https://www.amazon.in/dp/9376860179',
        'Flipkart': 'https://www.flipkart.com/product/p/itme?pid=9789376860173',
        'Astitva Store':
            'https://astitvaprakashan.com/product/guide-to-research-methodology-for-allied-and-healthcare-professionals-volume-1/',
        'Classic Shelf':
            'https://classicshelf.in/products/guide-to-research-methodology-for-allied-and-healthcare-professionals-volume-1-a-comprehensive-handbook-for-master-s-and-phd-scholars-in-allied-and-healthcare-professions',
      },
    },
    {
      'title': 'Guide to Research Methodology for Allied and Healthcare Professionals (Volume - 2)',
      'pages': 'Chapters 8–13',
      'isbn': '978-9376869152',
      'description':
          'Focuses on the systematic execution of healthcare research, sampling techniques, measurement tools, data collection, and essential research ethics including informed consent, patient privacy, and clinical research integrity.',
      'coverImage': 'assets/images/research_methodology_vol2.jpg',
      'purchaseLinks': {
        'Amazon': 'https://www.amazon.in/dp/937686915X',
        'Flipkart': 'https://www.flipkart.com/product/p/itme?pid=9789376869152',
        'Astitva Store':
            'https://astitvaprakashan.com/product/guide-to-research-methodology-for-allied-and-healthcare-professionals-volume-2/',
        'Classic Shelf':
            'https://classicshelf.in/products/guide-to-research-methodology-for-allied-and-healthcare-professionals-volume-2-a-comprehensive-handbook-for-master-s-and-phd-scholars-in-allied-and-healthcare-professions',
      },
    },
    {
      'title': 'Guide to Research Methodology for Allied and Healthcare Professionals (Volume - 3)',
      'pages': 'Chapters 14–18',
      'isbn': '978-9376860401',
      'description':
          'Advanced practical handbook on planning, conducting, analyzing, and applying scientific research in real-world clinical and academic settings to support evidence-based healthcare practice and decision making.',
      'coverImage': 'assets/images/research_methodology_vol3.jpg',
      'purchaseLinks': {
        'Amazon': 'https://www.amazon.in/dp/9376860403',
        'Flipkart': 'https://www.flipkart.com/product/p/itme?pid=9789376860401',
        'Astitva Store':
            'https://astitvaprakashan.com/product/guide-to-research-methodology-for-allied-and-healthcare-professionals-volume-3/',
        'Classic Shelf':
            'https://classicshelf.in/products/guide-to-research-methodology-for-allied-and-healthcare-professionals-volume-3-a-comprehensive-handbook-for-master-s-and-phd-scholars-in-allied-and-healthcare-professions',
      },
    },
  ];

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
                'Published Textbooks & Research Handbooks',
                style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                '9 titles published · NCAHP & Research Methodology Series',
                style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[500]),
              ),
              const SizedBox(height: 32),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 380,
                  childAspectRatio: 0.85,
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
                    coverImagePath: book['coverImage'] as String,
                    purchaseLinks: Map<String, String>.from(book['purchaseLinks'] as Map),
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
