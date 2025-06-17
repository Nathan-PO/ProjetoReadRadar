import 'package:flutter/material.dart'; //Designer android

//Livros
//import 'data/books_data.dart';
import 'models/book.dart';

//Telas
import 'screens/home_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/saved_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/book_details_screen.dart';

void main() {
  runApp(const ReadRadarApp());
}

class ReadRadarApp extends StatefulWidget {
  const ReadRadarApp({Key? key}) : super(key: key);

  @override
  State<ReadRadarApp> createState() => _ReadRadarAppState();
}

class _ReadRadarAppState extends State<ReadRadarApp> {
  ThemeMode _themeMode = ThemeMode.light;
  String _userName = 'Leitor';
  int _selectedIndex = 0;

  final List<Book> _favoriteBooks = [];
  final List<Book> _savedBooks = [];

  void _toggleFavorite(Book book) {
    setState(() {
      if (_favoriteBooks.contains(book)) {
        _favoriteBooks.remove(book);
      } else {
        _favoriteBooks.add(book);
      }
    });
  }

  void _onBookTap(Book book) {
    final isFavorite = _favoriteBooks.contains(book);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BookDetailsScreen(
          book: book,
          isFavorite: isFavorite,
          onFavoriteToggle: () => _toggleFavorite(book),
        ),
      ),
    );
  }

  List<Widget> get _screens => [
    HomeScreen(
      //books: booksList,
      favoriteBooks: _favoriteBooks,
      onToggleFavorite: _toggleFavorite,
      onBookTap: _onBookTap,
    ),
    FavoritesScreen(
      favoriteBooks: _favoriteBooks,
      onToggleFavorite: _toggleFavorite,
      onBookTap: _onBookTap,
    ),
    SavedScreen(
      savedBooks: _savedBooks,
      onToggleFavorite: _toggleFavorite,
      onBookTap: _onBookTap,
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReadRadar',
      themeMode: _themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false, //Retria a etiqueta de teste
      home: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          items: const [
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
