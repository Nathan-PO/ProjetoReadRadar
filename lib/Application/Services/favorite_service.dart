import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/book.dart';

class FavoriteService {
  static const _key = 'favorites_books_v2';

  static Future<List<Book>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> jsonList = prefs.getStringList(_key) ?? [];

    return jsonList.map((jsonString) {
      return Book.fromJson(json.decode(jsonString));
    }).toList();
  }

  // Verifica se é favorito pelo ID
  static Future<bool> isFavorite(String id) async {
    final books = await getFavorites();
    return books.any((b) => b.id == id);
  }

  static Future<void> toggleFavorite(Book book) async {
    final prefs = await SharedPreferences.getInstance();
    List<Book> books = await getFavorites();

    final index = books.indexWhere((b) => b.id == book.id);

    if (index >= 0) {
      books.removeAt(index); // Remove se já existe
    } else {
      books.add(book); // Adiciona se não existe
    }

    // Converte tudo para JSON String e salva
    final List<String> jsonList = books.map((b) => json.encode(b.toJson())).toList();
    await prefs.setStringList(_key, jsonList);
  }
}