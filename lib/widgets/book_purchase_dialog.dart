import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookPurchaseDialog extends StatelessWidget {
  final String title;
  final String description;
  final String amazonUrl;
  final String flipkartUrl;

  const BookPurchaseDialog({
    super.key,
    required this.title,
    required this.description,
    required this.amazonUrl,
    required this.flipkartUrl,
  });

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(
        title,
        style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            description,
            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[700], height: 1.5),
          ),
          const SizedBox(height: 24),
          Text(
            'Available at:',
            style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actionsPadding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      actions: [
        ElevatedButton.icon(
          onPressed: () => _launchUrl(amazonUrl),
          icon: const Icon(Icons.shopping_cart, size: 18),
          label: const Text('Amazon'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF9900),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        ElevatedButton.icon(
          onPressed: () => _launchUrl(flipkartUrl),
          icon: const Icon(Icons.store, size: 18),
          label: const Text('Flipkart'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2874F0),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
