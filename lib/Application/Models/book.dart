import 'dart:math';

class Book {
  final String id;
  final String title;
  final String author;
  final String description;
  final String imageUrl;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.imageUrl,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    // CENÁRIO 1: O JSON vem do SharedPreferences
    // Se nn tiver 'volumeInfo', assume que é o formato salvo plano
    if (!json.containsKey('volumeInfo')) {
      return Book(
        id: json['id'] ?? '',
        title: json['title'] ?? 'Sem título',
        author: json['author'] ?? 'Autor desconhecido',
        description: json['description'] ?? '',
        imageUrl: json['imageUrl'] ?? 'https://via.placeholder.com/150',
      );
    }

    // CENÁRIO 2: O JSON vem da API do Google Books
    final volumeInfo = json['volumeInfo'] ?? {};

    // Tratamento de imagem para Web (HTTPS)
    String imgUrl = volumeInfo['imageLinks']?['thumbnail'] ?? '';
    if (imgUrl.isNotEmpty && imgUrl.startsWith('http://')) {
      imgUrl = imgUrl.replaceFirst('http://', 'https://');
    }
    if (imgUrl.isEmpty) {
      imgUrl = 'https://via.placeholder.com/150';
    }

    //Usa o ID da API ou gera um se não existir
    String uniqueId = json['id'] ?? 'book_${DateTime.now().microsecondsSinceEpoch}_${Random().nextInt(1000)}';

    return Book(
      id: uniqueId,
      title: volumeInfo['title'] ?? 'Sem título',
      author: (volumeInfo['authors'] as List?)?.join(', ') ?? 'Autor desconhecido',
      description: volumeInfo['description'] ?? 'Sem descrição',
      imageUrl: imgUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'description': description,
      'imageUrl': imageUrl,
    };
  }
}