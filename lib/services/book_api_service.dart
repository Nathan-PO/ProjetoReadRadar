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

      return items.map((item) {
        final volumeInfo = item['volumeInfo'];
        return Book(
          title: volumeInfo['title'] ?? 'Sem título',
          author: (volumeInfo['authors'] as List?)?.join(', ') ?? 'Autor desconhecido',
          description: volumeInfo['description'] ?? 'Sem descrição',
          imageUrl: volumeInfo['imageLinks']?['thumbnail'] ?? 'https://via.placeholder.com/150',
        );
      }).toList();
    } else {
      throw Exception('Erro ao buscar livros');
    }
  }
}
