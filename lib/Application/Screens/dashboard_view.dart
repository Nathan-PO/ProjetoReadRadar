import 'package:flutter/material.dart';
import '../ViewModels/dashboard_view_model.dart';
import '../ViewModels/home_view_model.dart';
import '../ViewModels/favorites_view_model.dart';
import '../Models/book.dart';
import 'home_view.dart';
import 'book_details_view.dart';
import 'design_system_view.dart';
import '../../Design_system/Shared/colors.dart';
import '../../Design_system/Shared/styles.dart';

class SmartFavoritesView extends StatelessWidget {
  final FavoritesViewModel viewModel;
  const SmartFavoritesView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    viewModel.loadFavorites();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AnimatedBuilder(
      animation: viewModel,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: AppColors.background(isDark),
          appBar: AppBar(
              title: Text("Meus Favoritos", style: AppTypography.h2(isDark)),
              backgroundColor: AppColors.surface(isDark),
              elevation: 0,
              iconTheme: IconThemeData(color: AppColors.icon(isDark))
          ),
          body: viewModel.favoriteBooks.isEmpty
              ? Center(child: Text("Nenhum favorito ainda", style: AppTypography.caption(isDark)))
              : ListView.builder(
            itemCount: viewModel.favoriteBooks.length,
            itemBuilder: (context, index) {
              final Book book = viewModel.favoriteBooks[index];
              return Card(
                color: AppColors.surface(isDark),
                margin: const EdgeInsets.symmetric(horizontal: AppSpacings.m, vertical: AppSpacings.s),
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(AppSpacings.s),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                        book.imageUrl,
                        width: 50,
                        height: 70,
                        fit: BoxFit.cover,
                        errorBuilder: (_,__,___)=> const Icon(Icons.book, size: 50)
                    ),
                  ),
                  title: Text(book.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppTypography.h3(isDark)),
                  subtitle: Text(book.author, style: AppTypography.caption(isDark)),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => BookDetailsView(book: book))),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: AppColors.error),
                    onPressed: () => viewModel.removeFavorite(book),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class FunctionalCategoriesView extends StatelessWidget {
  final Function(String) onCategorySelected;
  const FunctionalCategoriesView({super.key, required this.onCategorySelected});

  final List<String> categories = const [
    "Tecnologia", "Ficção", "Romance", "História", "Ciência", "Biografias", "Mangá", "Negócios"
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: AppColors.background(isDark),
      appBar: AppBar(
          title: Text("Explorar", style: AppTypography.h2(isDark)),
          backgroundColor: AppColors.surface(isDark),
          elevation: 0,
          centerTitle: false
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
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () => onCategorySelected(categories[index]),
                child: Center(
                  child: Text(
                      categories[index],
                      style: AppTypography.h3(isDark).copyWith(color: AppColors.primary)
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

class SettingsView extends StatelessWidget {
  final String username;
  final VoidCallback onThemeToggle;
  final VoidCallback onLogout;

  const SettingsView({super.key, required this.username, required this.onThemeToggle, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final surfaceColor = AppColors.surface(isDark);

    return Scaffold(
      backgroundColor: AppColors.background(isDark),
      appBar: AppBar(
        title: Text("Configurações", style: AppTypography.h2(isDark)),
        backgroundColor: surfaceColor,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.icon(isDark)),
      ),
      body: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: AppColors.primary),
            accountName: Text(username, style: AppTypography.h2(false).copyWith(color: Colors.white)),
            accountEmail: const Text("aluno@universidade.edu", style: TextStyle(color: Colors.white70)),
            currentAccountPicture: CircleAvatar(
              backgroundColor: surfaceColor,
              child: Text(username.isNotEmpty ? username[0].toUpperCase() : "U", style: TextStyle(fontSize: 24, color: AppColors.primary, fontWeight: FontWeight.bold)),
            ),
          ),
          ListTile(
            tileColor: surfaceColor,
            leading: Icon(Icons.dark_mode, color: AppColors.icon(isDark)),
            title: Text("Tema Escuro", style: AppTypography.body(isDark)),
            trailing: Switch(
              value: isDark,
              onChanged: (val) => onThemeToggle(),
              activeColor: AppColors.primary,
            ),
          ),
          const Divider(height: 1),
          ListTile(
            tileColor: surfaceColor,
            leading: Icon(Icons.palette, color: AppColors.primary),
            title: Text("Visualizar Design System", style: AppTypography.body(isDark)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.icon(isDark)),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DesignSystemView())),
          ),
          const Divider(height: 1),
          ListTile(
            tileColor: surfaceColor,
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text("Sair do App", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            onTap: onLogout,
          ),
        ],
      ),
    );
  }
}

class DashboardView extends StatelessWidget {
  final DashboardViewModel dashboardViewModel;
  final HomeViewModel homeViewModel;
  final FavoritesViewModel favoritesViewModel;
  final VoidCallback onThemeToggle;
  final VoidCallback onLogout;

  const DashboardView({
    super.key,
    required this.dashboardViewModel,
    required this.homeViewModel,
    required this.favoritesViewModel,
    required this.onThemeToggle,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final List<Widget> pages = [
      HomeView(viewModel: homeViewModel),
      FunctionalCategoriesView(onCategorySelected: (category) {
        homeViewModel.fetchBooks("subject:$category");
        dashboardViewModel.setIndex(0);
      }),
      SmartFavoritesView(viewModel: favoritesViewModel),
      SettingsView(
        username: dashboardViewModel.username,
        onThemeToggle: onThemeToggle,
        onLogout: onLogout,
      ),
    ];

    return AnimatedBuilder(
      animation: dashboardViewModel,
      builder: (context, _) {
        return Scaffold(
          body: pages[dashboardViewModel.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.surface(isDark),
            currentIndex: dashboardViewModel.currentIndex,
            onTap: (index) => dashboardViewModel.setIndex(index),
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.textSecondary(isDark),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Categorias'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Config'),
            ],
          ),
        );
      },
    );
  }
}