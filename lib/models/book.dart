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

  // Método auxiliar para criar um Book a partir de um JSON (útil para APIs)
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'] ?? 'Sem título',
      author: json['author'] ?? 'Desconhecido',
      description: json['description'] ?? 'Sem descrição',
      imageUrl: json['coverUrl'] ?? 'https://via.placeholder.com/150',
    );
  }

  // Método para converter um Book em JSON (se quiser salvar localmente ou enviar para API)
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
      'description': description,
      'coverUrl': imageUrl,
    };
  }
}
