import 'package:flutter/material.dart';
import '../../Design_system/Shared/colors.dart';
import '../../Design_system/Shared/styles.dart';
import '../../Design_system/Components/Buttons/primary_button.dart';
import '../../Design_system/Components/Inputs/custom_input.dart';
import '../../Design_system/Components/Card/book_card.dart';
import '../Models/book.dart';

class DesignSystemView extends StatelessWidget {
  const DesignSystemView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: AppColors.background(isDark),
      appBar: AppBar(
        title: Text("UI Kit", style: AppTypography.h2(isDark)),
        centerTitle: true,
        backgroundColor: AppColors.background(isDark),
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.icon(isDark)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Guia de Estilos",
              style: AppTypography.h1(isDark).copyWith(fontSize: 22),
            ),
            const SizedBox(height: 8),
            Text(
              "Selecao de categoria",
              style: AppTypography.body(isDark).copyWith(color: AppColors.textSecondary(isDark)),
            ),
            const SizedBox(height: 24),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  _buildGridCard(
                    context, isDark,
                    title: "Cores",
                    icon: Icons.palette_outlined,
                    color: Colors.purpleAccent,
                    destination: const ColorsDetailView(),
                  ),
                  _buildGridCard(
                    context, isDark,
                    title: "Tipografia",
                    icon: Icons.text_fields_rounded,
                    color: Colors.blueAccent,
                    destination: const TypographyDetailView(),
                  ),
                  _buildGridCard(
                    context, isDark,
                    title: "Componentes",
                    icon: Icons.layers_outlined,
                    color: Colors.orangeAccent,
                    destination: const ComponentsDetailView(),
                  ),
                  _buildGridCard(
                    context, isDark,
                    title: "Cards",
                    icon: Icons.view_carousel_outlined,
                    color: Colors.tealAccent,
                    destination: const CardsDetailView(),
                  ),
                ],
              ),
            ),

            Center(
              child: Text(
                "ReadRadar v1.0 • Design System",
                style: AppTypography.caption(isDark),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildGridCard(BuildContext context, bool isDark, {
    required String title,
    required IconData icon,
    required Color color,
    required Widget destination,
  }) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => destination)),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface(isDark),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(isDark ? 0.3 : 0.05), blurRadius: 10, offset: const Offset(0, 4))
          ],
          border: Border.all(color: isDark ? Colors.grey[800]! : Colors.transparent),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 32, color: color),
            ),
            const SizedBox(height: 16),
            Text(title, style: AppTypography.h3(isDark)),
          ],
        ),
      ),
    );
  }
}


class ColorsDetailView extends StatelessWidget {
  const ColorsDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: AppColors.background(isDark),
      appBar: AppBar(title: Text("Paleta de Cores", style: AppTypography.h2(isDark)), centerTitle: true, elevation: 0, backgroundColor: Colors.transparent, iconTheme: IconThemeData(color: AppColors.icon(isDark))),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildColorRow(isDark, "Principal", AppColors.primary),
          _buildColorRow(isDark, "Superfície", AppColors.surface(isDark)),
          _buildColorRow(isDark, "Fundo", AppColors.background(isDark)),
          _buildColorRow(isDark, "Erro", AppColors.error),
          _buildColorRow(isDark, "Sucesso", AppColors.success),
        ],
      ),
    );
  }

  Widget _buildColorRow(bool isDark, String name, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: AppColors.surface(isDark), borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Container(width: 40, height: 40, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8))),
          const SizedBox(width: 16),
          Text(name, style: AppTypography.body(isDark)),
        ],
      ),
    );
  }
}

class TypographyDetailView extends StatelessWidget {
  const TypographyDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: AppColors.background(isDark),
      appBar: AppBar(title: Text("Tipografia", style: AppTypography.h2(isDark)), centerTitle: true, elevation: 0, backgroundColor: Colors.transparent, iconTheme: IconThemeData(color: AppColors.icon(isDark))),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildTypeItem(isDark, "Título H1", AppTypography.h1(isDark)),
          _buildTypeItem(isDark, "Título H2", AppTypography.h2(isDark)),
          _buildTypeItem(isDark, "Título H3", AppTypography.h3(isDark)),
          _buildTypeItem(isDark, "Corpo de Texto", AppTypography.body(isDark)),
          _buildTypeItem(isDark, "Legenda", AppTypography.caption(isDark)),
        ],
      ),
    );
  }

  Widget _buildTypeItem(bool isDark, String name, TextStyle style) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.surface(isDark), borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: AppTypography.caption(isDark).copyWith(color: AppColors.primary)),
          const SizedBox(height: 8),
          Text("Text style...", style: style),
        ],
      ),
    );
  }
}

class ComponentsDetailView extends StatelessWidget {
  const ComponentsDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: AppColors.background(isDark),
      appBar: AppBar(title: Text("Componentes", style: AppTypography.h2(isDark)), centerTitle: true, elevation: 0, backgroundColor: Colors.transparent, iconTheme: IconThemeData(color: AppColors.icon(isDark))),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          CustomInput(label: "Campo de Texto", controller: TextEditingController(), prefixIcon: Icons.edit),
          const SizedBox(height: 16),
          PrimaryButton(text: "Botão Padrão", onPressed: () {}),
          const SizedBox(height: 16),
          PrimaryButton(text: "Botão Outline", onPressed: () {}, isOutlined: true),
        ],
      ),
    );
  }
}

class CardsDetailView extends StatelessWidget {
  const CardsDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final exampleBook = Book(
        id: "1", title: "Flutter Clean Architecture", author: "Dev Team", description: "...",
        imageUrl: "https://via.placeholder.com/150"
    );

    return Scaffold(
      backgroundColor: AppColors.background(isDark),
      appBar: AppBar(title: Text("Cards", style: AppTypography.h2(isDark)), centerTitle: true, elevation: 0, backgroundColor: Colors.transparent, iconTheme: IconThemeData(color: AppColors.icon(isDark))),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [
          BookCard(book: exampleBook, isFavorite: false, onTap: (){}, onFavoriteToggle: (_){}),
          BookCard(book: exampleBook, isFavorite: true, onTap: (){}, onFavoriteToggle: (_){}),
        ],
      ),
    );
  }
}