import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/book.dart';

class BookApiService {
  static Future<List<Book>> searchBooks(String query) async {
    final url = Uri.parse('https://www.googleapis.com/books/v1/volumes?q=$query');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final items = data['items'] as List<dynamic>?;

      if (items == null) return [];

      return items.map((item) => Book.fromJson(item)).toList();
    } else {
      throw Exception('Erro ao buscar livros');
    }
  }
}
