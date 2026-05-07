import 'package:flutter/material.dart';

class JourneyScreen extends StatelessWidget {
  const JourneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(32.0),
        children: [
          Text('My Journey', style: Theme.of(context).textTheme.displaySmall),
          const SizedBox(height: 32),
          _buildTimelineItem(context, '2023', 'Published "The Healing Touch"'),
          _buildTimelineItem(context, '2018', 'Senior Physiotherapist at City Hospital'),
          _buildTimelineItem(context, '2015', 'Bachelor of Physiotherapy Degree'),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(BuildContext context, String year, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(year, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(width: 24),
          Expanded(child: Text(description, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
