import 'package:flutter/material.dart';
import '../models/book.dart';
import '../widgets/book_card.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Book> favoriteBooks;
  final void Function(Book) onToggleFavorite;
  final void Function(Book) onBookTap;

  const FavoritesScreen({
    Key? key,
    required this.favoriteBooks,
    required this.onToggleFavorite,
    required this.onBookTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              // lógica para excluir
            },
          ),
        ],
      ),
      body: favoriteBooks.isEmpty
          ? const Center(child: Text('Nenhum favorito ainda.'))
          : ListView.builder(
        itemCount: favoriteBooks.length,
        itemBuilder: (context, index) {
          final book = favoriteBooks[index];
          return BookCard(
            book: book,
            onTap: () => onBookTap(book),
            isFavorite: true,
            onFavoriteToggle: () => onToggleFavorite(book),
          );
        },
      ),
    );
  }
}
