import 'package:flutter/material.dart';
import '../widgets/book_card.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 0.7,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
        ),
        itemCount: 4,
        itemBuilder: (context, index) => BookCard(
          title: 'Book ${index + 1}',
          description: 'A deep dive into clinical practices and personal wellness strategies.',
          imageUrl: 'https://via.placeholder.com/200x300',
        ),
      ),
    );
  }
}
