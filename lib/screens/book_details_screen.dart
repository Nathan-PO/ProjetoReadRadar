import 'package:flutter/material.dart';
import '../models/book.dart';

class BookDetailsScreen extends StatefulWidget {
  final Book book;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;
  final bool isSaved;
  final VoidCallback onToggleSaved;

  const BookDetailsScreen({
    Key? key,
    required this.book,
    required this.isFavorite,
    required this.onFavoriteToggle,
    required this.isSaved,
    required this.onToggleSaved,
  }) : super(key: key);

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  late bool _isFavorite;
  late bool _isSaved;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
    _isSaved = widget.isSaved;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.book.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.book.imageUrl.isNotEmpty
                ? Image.network(
              widget.book.imageUrl,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.book, size: 100),
            )
                : const Icon(Icons.book, size: 100),
            const SizedBox(height: 16),
            Text(widget.book.title, style: Theme.of(context).textTheme.titleLarge),
            Text(widget.book.author, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 16),
            Text(widget.book.description),
            const SizedBox(height: 16),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    _isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: _isFavorite ? Colors.red : null,
                  ),
                  onPressed: () {
                    widget.onFavoriteToggle();
                    setState(() {
                      _isFavorite = !_isFavorite;
                    });
                  },
                  tooltip: _isFavorite ? 'Remover dos favoritos' : 'Adicionar aos favoritos',
                ),
                IconButton(
                  icon: Icon(
                    _isSaved ? Icons.bookmark : Icons.bookmark_border,
                    color: _isSaved ? Colors.blue : null,
                  ),
                  onPressed: () {
                    widget.onToggleSaved();
                    setState(() {
                      _isSaved = !_isSaved;
                    });
                  },
                  tooltip: _isSaved ? 'Remover de Ler Depois' : 'Salvar para Ler Depois',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
