import 'package:flutter/foundation.dart';
import '../Services/favorite_service.dart';
import '../Models/book.dart';

class FavoritesViewModel extends ChangeNotifier {
  List<Book> _favoriteBooks = [];
  List<Book> get favoriteBooks => _favoriteBooks;

  Future<void> loadFavorites() async {
    _favoriteBooks = await FavoriteService.getFavorites();
    notifyListeners();
  }

  Future<void> removeFavorite(Book book) async {
    await FavoriteService.toggleFavorite(book);
    await loadFavorites();
  }
}