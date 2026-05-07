import 'package:flutter/material.dart';
import '../widgets/book_card.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

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
                'A collection of textbooks and research papers contributing to clinical knowledge.',
                style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
              ),
              const SizedBox(height: 64),
              
              Text('Featured Textbooks', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 32),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 350,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 32,
                  mainAxisSpacing: 32,
                ),
                itemCount: 3,
                itemBuilder: (context, index) => BookCard(
                  title: _getBookTitle(index),
                  description: 'Comprehensive guide for physiotherapy students and practitioners.',
                  imageUrl: 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?auto=format&fit=crop&q=80&w=400',
                ),
              ),
              
              const SizedBox(height: 80),
              Text('Research Papers', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 32),
              _buildPublicationItem(
                context, 
                'Comparison of Manual Therapy vs. Exercise in Chronic Low Back Pain', 
                'International Journal of Physiotherapy, 2022'
              ),
              _buildPublicationItem(
                context, 
                'Advanced Rehabilitation Post-ACL Reconstruction: A Systematic Review', 
                'Journal of Orthopaedic Sports Physical Therapy, 2021'
              ),
              _buildPublicationItem(
                context, 
                'Effectiveness of Tele-rehabilitation during COVID-19', 
                'Global Health Perspectives, 2020'
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getBookTitle(int index) {
    switch (index) {
      case 0: return 'The Healing Touch';
      case 1: return 'Clinical Biomechanics';
      case 2: return 'Rehab Redefined';
      default: return 'Textbook';
    }
  }

  Widget _buildPublicationItem(BuildContext context, String title, String journal) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Row(
          children: [
            Icon(Icons.description, color: theme.colorScheme.primary, size: 32),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title, 
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    journal, 
                    style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward),
              label: const Text('Read Paper'),
            ),
          ],
        ),
      ),
    );
  }
}
