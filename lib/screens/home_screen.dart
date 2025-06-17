//import 'package:flutter/material.dart';
// import '../models/book.dart';
// import '../widgets/book_card.dart';
// import '../services/book_api_service.dart';
//
// class HomeScreen extends StatefulWidget {
//   //final List<Book> books;
//   final List<Book> favoriteBooks;
//   final void Function(Book) onToggleFavorite;
//   final void Function(Book) onBookTap;
//
//   const HomeScreen({
//     Key? key,
//     //required this.books,
//     required this.favoriteBooks,
//     required this.onToggleFavorite,
//     required this.onBookTap,
//   }) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   List<Book> _books = [];
//   bool _isLoading = true;
//   String? error;
//   final TextEditingController _searchController = TextEditingController();
//
//   bool _isFavorite(Book book) {
//     return widget.favoriteBooks.contains(book);
//   }
//
//   Future<void> _searchBooks(String query) async {
//     setState(() => _isLoading = true);
//     try {
//       final books = await BookApiService.searchBooks(query);
//       setState(() => _books = books);
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Erro ao buscar livros')),
//       );
//     } finally {
//       setState(() => _isLoading = false);
//     }
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ReadRadar'),
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(56),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             child: TextField(
//               controller: _searchController,
//               onSubmitted: _searchBooks,
//               textInputAction: TextInputAction.search,
//               decoration: InputDecoration(
//                 hintText: 'Buscar livros...',
//                 prefixIcon: const Icon(Icons.search),
//                 suffixIcon: IconButton(
//                   icon: const Icon(Icons.clear),
//                   onPressed: () {
//                     _searchController.clear();
//                     setState(() => _books = []);
//                   },
//                 ),
//                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : _books.isEmpty
//           ? const Center(child: Text('Nenhum livro encontrado'))
//           : ListView.builder(
//         itemCount: _books.length,
//         itemBuilder: (context, index) {
//           final book = _books[index];
//           return BookCard(
//             book: book,
//             onTap: () => widget.onBookTap(book),
//             isFavorite: _isFavorite(book),
//             onFavoriteToggle: () => widget.onToggleFavorite(book),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../models/book.dart';
import '../services/book_api_service.dart';
import '../widgets/book_card.dart';

class HomeScreen extends StatefulWidget {
  final List<Book> favoriteBooks;
  final void Function(Book) onToggleFavorite;
  final void Function(Book) onBookTap;

  const HomeScreen({
    Key? key,
    required this.favoriteBooks,
    required this.onToggleFavorite,
    required this.onBookTap,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Book> books = [];
  bool isLoading = true;
  String? error;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadInitialBooks();
  }

  Future<void> _loadInitialBooks() async {
    await _searchBooks('literatura'); // termo inicial padrão
  }

  Future<void> _searchBooks(String query) async {
    setState(() {
      isLoading = true;
      error = null;
    });

    try {
      final result = await BookApiService.searchBooks(query);
      setState(() {
        books = result;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = 'Erro ao buscar livros.';
        isLoading = false;
      });
    }
  }

  bool isBookFavorite(Book book) {
    return widget.favoriteBooks.contains(book);
  }

  void _onSearchSubmitted(String query) {
    if (query.trim().isNotEmpty) {
      _searchBooks(query.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReadRadar'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _searchController,
              onSubmitted: _onSearchSubmitted,
              decoration: InputDecoration(
                hintText: 'Buscar livros...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    _loadInitialBooks();
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : error != null
                ? Center(child: Text(error!))
                : books.isEmpty
                ? const Center(child: Text('Nenhum livro encontrado.'))
                : ListView.builder(
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
          ),
        ],
      ),
    );
  }
}
