import 'package:flutter/material.dart';
import '../models/book.dart';

class BookDetailsScreen extends StatelessWidget {
  final Book book;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const BookDetailsScreen({
    Key? key,
    required this.book,
    required this.isFavorite,
    required this.onFavoriteToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            book.imageUrl,
            errorBuilder: (context, error, stackTrace) => const Icon(Icons.book),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              //  Text(book.title, style: Theme.of(context).textTheme.headline6),
              //  Text(book.author, style: Theme.of(context).textTheme.subtitle1),
                const SizedBox(height: 16),
                IconButton(
                  icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                  onPressed: onFavoriteToggle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
