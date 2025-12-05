import 'package:flutter/material.dart';
import '../../Design_system/Shared/colors.dart';
import '../../Design_system/Shared/styles.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  final List<String> categories = const [
    "Tecnologia", "Ficção", "Romance", "História", "Ciência", "Biografias", "Mangá", "Negócios"
  ];

  @override
  Widget build(BuildContext context) {
    //Detecta tema
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: AppColors.background(isDark),
      appBar: AppBar(
        title: Text("Explorar", style: AppTypography.h2(isDark)),
        backgroundColor: AppColors.surface(isDark),
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: AppColors.icon(isDark)),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(AppSpacings.m),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: AppSpacings.m,
          mainAxisSpacing: AppSpacings.m,
          childAspectRatio: 1.5,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: AppColors.surface(isDark),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4)
                )
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Filtrar por: ${categories[index]} (TODO)")),
                  );
                },
                child: Center(
                  child: Text(
                    categories[index],
                    //Uso do estilo dinâmico
                    style: AppTypography.h3(isDark).copyWith(color: AppColors.primary),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}