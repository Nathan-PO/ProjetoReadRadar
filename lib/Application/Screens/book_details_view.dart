import 'package:flutter/material.dart';
import '../../Design_system/Shared/colors.dart';
import '../../Design_system/Shared/styles.dart';
import '../Models/book.dart';

class BookDetailsView extends StatelessWidget {
  final Book book;

  const BookDetailsView({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    //Detecta o tema para passar para os métodos do DS
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      //Fundo controlado pelo DS
      backgroundColor: AppColors.background(isDark),
      appBar: AppBar(
        title: Text('Detalhes', style: AppTypography.h2(isDark)),
        backgroundColor: AppColors.surface(isDark),
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.icon(isDark)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacings.l), //Espaçamento DS
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: book.id,
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10)
                      )
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      book.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Icon(Icons.book, size: 100),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacings.xl),

            Text(book.title, style: AppTypography.h1(isDark)),

            const SizedBox(height: AppSpacings.s),

            Row(
              children: [
                Icon(Icons.person, size: 18, color: AppColors.primary),
                const SizedBox(width: AppSpacings.s),
                Expanded(
                  child: Text(
                      book.author,
                      // Pequena variação de tamanho permitida, mas baseada no DS
                      style: AppTypography.caption(isDark).copyWith(fontSize: 18)
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSpacings.l),
            Divider(color: isDark ? Colors.grey[800] : Colors.grey[300]),
            const SizedBox(height: AppSpacings.m),

            Text("Sinopse", style: AppTypography.h2(isDark)),

            const SizedBox(height: AppSpacings.s),

            Text(
              book.description.isNotEmpty ? book.description : "Nenhuma descrição disponível.",
              style: AppTypography.body(isDark),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}