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
                'A timeline of excellence in education and patient care.',
                style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
              ),
              const SizedBox(height: 64),
              
              _SectionHeader(title: 'Academic Leadership'),
              _buildTimelineItem(
                context, 
                '2022 - Present', 
                'Head of Department (HOD)', 
                'Leading the Department of Physiotherapy at a prestigious University. Oversaw curriculum development and research initiatives.'
              ),
              _buildTimelineItem(
                context, 
                '2018 - 2022', 
                'Associate Professor', 
                'Published over 15 peer-reviewed journals and mentored dozens of graduate students.'
              ),
              _buildTimelineItem(
                context, 
                '2015', 
                'Doctor of Physical Therapy (DPT)', 
                'Completed advanced doctoral research in neuro-muscular rehabilitation.'
              ),

              const SizedBox(height: 64),
              _SectionHeader(title: 'Clinical Experience'),
              _buildTimelineItem(
                context, 
                '2010 - Present', 
                'Senior Consultant Physiotherapist', 
                'Specializing in sports injury rehabilitation and geriatric care with a focus on holistic wellness.'
              ),
              _buildTimelineItem(
                context, 
                '2008 - 2010', 
                'Clinical Researcher', 
                'Worked on breakthrough studies regarding non-invasive spine treatments.'
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimelineItem(BuildContext context, String year, String title, String description) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: Text(
              year, 
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              )
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
                const SizedBox(height: 8),
                Text(
                  description, 
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                    height: 1.5,
                  )
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
