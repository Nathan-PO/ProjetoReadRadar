import 'package:flutter/material.dart';
import '../models/book.dart';
import '../widgets/book_card.dart';
import '../services/book_api_service.dart';

class HomeScreen extends StatefulWidget {
  //final List<Book> books;
  final List<Book> favoriteBooks;
  final void Function(Book) onToggleFavorite;
  final void Function(Book) onBookTap;

  const HomeScreen({
    Key? key,
    //required this.books,
    required this.favoriteBooks,
    required this.onToggleFavorite,
    required this.onBookTap,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

/*class _HomeScreenState extends State<HomeScreen> {
  bool isBookFavorite(Book book) {
    return widget.favoriteBooks.contains(book);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReadRadar'),
        backgroundColor: Colors.blue, //mudei a cor de fundo
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return BookCard(
            book: book,
            onTap: () => widget.onBookTap(book),
            isFavorite: isBookFavorite(book),
            onFavoriteToggle: () => widget.onToggleFavorite(book),
          );
        },
      ),
    );
  }
}*/

class _HomeScreenState extends State<HomeScreen> {
  List<Book> _books = [];
  bool _isLoading = false;
  final TextEditingController _searchController = TextEditingController();

  bool _isFavorite(Book book) {
    return widget.favoriteBooks.contains(book);
  }

  Future<void> _searchBooks(String query) async {
    setState(() => _isLoading = true);
    try {
      final books = await BookApiService.searchBooks(query);
      setState(() => _books = books);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao buscar livros')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReadRadar'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              controller: _searchController,
              onSubmitted: _searchBooks,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: 'Buscar livros...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    setState(() => _books = []);
                  },
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _books.isEmpty
          ? const Center(child: Text('Nenhum livro encontrado'))
          : ListView.builder(
        itemCount: _books.length,
        itemBuilder: (context, index) {
          final book = _books[index];
          return BookCard(
            book: book,
            onTap: () => widget.onBookTap(book),
            isFavorite: _isFavorite(book),
            onFavoriteToggle: () => widget.onToggleFavorite(book),
          );
        },
      ),
    );
  }
}