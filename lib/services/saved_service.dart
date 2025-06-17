import 'package:shared_preferences/shared_preferences.dart';

class SavedService {
  static const String _savedKey = 'saved_books';

  static Future<List<String>> loadSavedBooks() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_savedKey) ?? [];
  }

  static Future<void> saveBook(String title) async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList(_savedKey) ?? [];
    if (!saved.contains(title)) {
      saved.add(title);
      await prefs.setStringList(_savedKey, saved);
    }
  }

  static Future<void> removeSavedBook(String title) async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList(_savedKey) ?? [];
    saved.remove(title);
    await prefs.setStringList(_savedKey, saved);
  }

  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_savedKey);
  }
}
