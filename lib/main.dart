import 'package:flutter/material.dart'; ///Android

///
import 'models/book.dart';

///Telas
import 'screens/home_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/saved_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/book_details_screen.dart';
import 'screens/design_system_screen.dart';

///Dados
import 'data/books_data.dart';

///Serviços
import 'services/book_api_service.dart';
import 'services/favorite_service.dart';
import 'services/saved_service.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>(); // ADICIONADO

void main() {
  runApp(const ReadRadarApp());
}

class ReadRadarApp extends StatefulWidget {
  const ReadRadarApp({super.key});

  @override
  State<ReadRadarApp> createState() => _ReadRadarAppState();
}

class _ReadRadarAppState extends State<ReadRadarApp> {
  ThemeMode _themeMode = ThemeMode.light;
  String _userName = 'Usuário';
  List<Book> _books = [];
  List<Book> _favoriteBooks = [];
  List<Book> _savedBooks = [];

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    await _loadFavorites();
    await _loadSavedBooks();
    await _searchBooks('literature');
  }

  Future<void> _loadFavorites() async {
    final favoriteTitles = await FavoriteService.loadFavorites();
    setState(() {
      _favoriteBooks = booksList
          .where((book) => favoriteTitles.contains(book.title))
          .toList();
    });
  }

  Future<void> _loadSavedBooks() async {
    final savedTitles = await SavedService.loadSavedBooks();
    setState(() {
      _savedBooks = booksList
          .where((book) => savedTitles.contains(book.title))
          .toList();
    });
  }

  Future<void> _searchBooks(String query) async {
    try {
      final results = await BookApiService.searchBooks(query);
      setState(() {
        _books = results;
      });
    } catch (e) {
      setState(() {
        _books = [];
      });
    }
  }

  void _toggleFavorite(Book book) async {
    final isCurrentlyFavorite = _favoriteBooks.any((b) => b.title == book.title);
    setState(() {
      if (isCurrentlyFavorite) {
        _favoriteBooks.removeWhere((b) => b.title == book.title);
        FavoriteService.removeFavorite(book.title);
      } else {
        _favoriteBooks.add(book);
        FavoriteService.addFavorite(book.title);
      }
    });
  }

  void _toggleSaved(Book book) async {
    final isSaved = _savedBooks.any((b) => b.title == book.title);
    setState(() async {
      if (isSaved) {
        _savedBooks.removeWhere((b) => b.title == book.title);
        await SavedService.removeSavedBook(book.title);
      } else {
        _savedBooks.add(book);
        await SavedService.saveBook(book.title);
      }
    });
  }

  void _clearAllSavedBooks() async {
    setState(() {
      _savedBooks.clear();
    });
    await SavedService.clearAll();
  }

  void _navigateToDetails(Book book) {
    print('Abrindo detalhes do livro: ${book.title}');

    final isFavorite = _favoriteBooks.any((b) => b.title == book.title);
    final isSaved = _savedBooks.any((b) => b.title == book.title);

    navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (_) => BookDetailsScreen(
          book: book,
          isFavorite: isFavorite,
          isSaved: isSaved,
          onFavoriteToggle: () => _toggleFavorite(book),
          onToggleSaved: () => _toggleSaved(book),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      DesignSystemScreen(

      ),
      HomeScreen(
        books: _books,
        favoriteBooks: _favoriteBooks,
        onToggleFavorite: _toggleFavorite,
        onBookTap: _navigateToDetails,
        onSearch: _searchBooks,
      ),
      FavoritesScreen(
        favoriteBooks: _favoriteBooks,
        onToggleFavorite: _toggleFavorite,
        onBookTap: _navigateToDetails,
      ),
      SavedScreen(
        savedBooks: _savedBooks,
        onBookTap: _navigateToDetails,
        onToggleFavorite: _toggleFavorite,
        onClearSaved: _clearAllSavedBooks,
      ),
      SettingsScreen(
        onToggleTheme: () {
          setState(() {
            _themeMode = _themeMode == ThemeMode.light
                ? ThemeMode.dark
                : ThemeMode.light;
          });
        },
        userName: _userName,
        onUserNameChanged: (name) {
          setState(() {
            _userName = name;
          });
        },
      ),
    ];

    return MaterialApp(
      title: 'ReadRadar',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      themeMode: _themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        body: screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() => _selectedIndex = index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.edit),
              label: 'Modelo',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Início',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favoritos',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Ler Depois',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Configurações',
              backgroundColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
