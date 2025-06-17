class Book {
  final String title;
  final String author;
  final String description;
  final String imageUrl;

  Book({
    required this.title,
    required this.author,
    required this.description,
    required this.imageUrl,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'] ?? {};

    return Book(
      title: volumeInfo['title'] ?? 'Sem título',
      author: (volumeInfo['authors'] as List?)?.join(', ') ?? 'Autor desconhecido',
      description: volumeInfo['description'] ?? 'Sem descrição',
      imageUrl: volumeInfo['imageLinks']?['thumbnail'] ??
          'https://via.placeholder.com/150',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
      'description': description,
      'imageUrl': imageUrl,
    };
  }
}
