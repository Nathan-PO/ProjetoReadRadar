import 'package:shared_preferences/shared_preferences.dart';

class FavoriteService {
  static const String _favoritesKey = 'favorites';

  /// Salva a lista de títulos favoritos no SharedPreferences
  static Future<void> saveFavorites(List<String> titles) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_favoritesKey, titles);
  }

  /// Carrega a lista de títulos favoritos do SharedPreferences
  static Future<List<String>> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favoritesKey) ?? [];
  }

  /// Adiciona um título aos favoritos
  static Future<void> addFavorite(String title) async {
    final prefs = await SharedPreferences.getInstance();
    final current = prefs.getStringList(_favoritesKey) ?? [];
    if (!current.contains(title)) {
      current.add(title);
      await prefs.setStringList(_favoritesKey, current);
    }
  }

  /// Remove um título dos favoritos
  static Future<void> removeFavorite(String title) async {
    final prefs = await SharedPreferences.getInstance();
    final current = prefs.getStringList(_favoritesKey) ?? [];
    current.remove(title);
    await prefs.setStringList(_favoritesKey, current);
  }

  /// Verifica se um título está entre os favoritos
  static Future<bool> isFavorite(String title) async {
    final prefs = await SharedPreferences.getInstance();
    final current = prefs.getStringList(_favoritesKey) ?? [];
    return current.contains(title);
  }

  /// Limpa todos os favoritos salvos
  static Future<void> clearFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_favoritesKey);
  }
}
