import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookPurchaseDialog extends StatelessWidget {
  final String title;
  final String description;

  const BookPurchaseDialog({
    super.key,
    required this.title,
    required this.description,
  });

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(description),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        TextButton.icon(
          onPressed: () => _launchUrl('https://amazon.com'),
          icon: const Icon(Icons.shopping_cart),
          label: const Text('Buy on Amazon'),
        ),
        TextButton.icon(
          onPressed: () => _launchUrl('https://books.google.com'),
          icon: const Icon(Icons.book),
          label: const Text('Get on Google Books'),
        ),
      ],
    );
  }
}
