import 'package:flutter/material.dart';
import '../models/book.dart';
import '../widgets/book_card.dart';

class SavedScreen extends StatelessWidget {
  final List<Book> savedBooks;
  final void Function(Book) onToggleFavorite;
  final void Function(Book) onBookTap;
  final VoidCallback onClearSaved;

  const SavedScreen({
    Key? key,
    required this.savedBooks,
    required this.onToggleFavorite,
    required this.onBookTap,
    required this.onClearSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ler Depois'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: onClearSaved,
            tooltip: 'Excluir todos',
          ),
        ],
      ),
      body: savedBooks.isEmpty
          ? const Center(child: Text('Nenhum livro salvo.'))
          : ListView.builder(
        itemCount: savedBooks.length,
        itemBuilder: (context, index) {
          final book = savedBooks[index];
          return BookCard(
            book: book,
            onTap: () => onBookTap(book),
            isFavorite: false,
            onFavoriteToggle: () => onToggleFavorite(book),
          );
        },
      ),
    );
  }
}
