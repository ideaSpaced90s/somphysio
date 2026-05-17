import 'dart:ui';
import 'package:flutter/material.dart';
import 'book_purchase_dialog.dart';

class BookCard extends StatelessWidget {
  final String title;
  final String description;
  final String pages;
  final String isbn;
  final String amazonUrl;
  final String flipkartUrl;
  final String coverImagePath;

  const BookCard({
    super.key,
    required this.title,
    required this.description,
    required this.pages,
    required this.isbn,
    required this.amazonUrl,
    required this.flipkartUrl,
    required this.coverImagePath,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Book cover header with premium ambient blurred backdrop
          Container(
            height: 200,
            color: Colors.black.withValues(alpha: 0.05),
            child: Stack(
              clipBehavior: Clip.antiAlias,
              children: [
                // 1. Stretched ambient blurred background
                Positioned.fill(
                  child: Image.asset(
                    coverImagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                    child: Container(
                      color: Colors.black.withValues(alpha: 0.2),
                    ),
                  ),
                ),
                // 2. Focused portrait cover in the center with drop shadow
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.25),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.asset(
                          coverImagePath,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                // 3. Page Count Badge
                Positioned(
                  bottom: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      pages,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'ISBN: $isbn',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.secondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: Text(
                      description,
                      style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => BookPurchaseDialog(
                          title: title,
                          description: description,
                          amazonUrl: amazonUrl,
                          flipkartUrl: flipkartUrl,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 40),
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('Buy / Get Book'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
