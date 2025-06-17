import 'package:flutter/material.dart';
import '../models/book.dart';
import '../widgets/book_card.dart';

class HomeScreen extends StatefulWidget {
  final List<Book> books;
  final List<Book> favoriteBooks;
  final Function(Book) onToggleFavorite;
  final Function(Book) onBookTap;
  final Function(String) onSearch;

  const HomeScreen({
    super.key,
    required this.books,
    required this.favoriteBooks,
    required this.onToggleFavorite,
    required this.onBookTap,
    required this.onSearch,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  void _handleSearch() {
    final query = _searchController.text.trim();
    if (query.isNotEmpty) {
      widget.onSearch(query);
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final books = widget.books;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ReadRadar'),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: 'Buscar livros...',
                        border: OutlineInputBorder(),
                      ),
                      onSubmitted: (_) => _handleSearch(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _handleSearch,
                    child: const Icon(Icons.search),
                  ),
                ],
              ),
            ),
            Expanded(
              child: books.isEmpty
                  ? const Center(child: Text('Nenhum livro encontrado.'))
                  : ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  final isFavorite = widget.favoriteBooks
                      .any((b) => b.title == book.title);

                  return BookCard(
                    book: book,
                    isFavorite: isFavorite,
                    onFavoriteToggle: () =>
                        widget.onToggleFavorite(book),
                    onTap: () => widget.onBookTap(book),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
