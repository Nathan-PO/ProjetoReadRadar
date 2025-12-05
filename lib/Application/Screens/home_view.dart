import 'package:flutter/material.dart';
import '../../Design_system/Components/Card/book_card.dart';
import '../../Design_system/Components/Inputs/custom_input.dart';
import '../../Design_system/Shared/colors.dart';
import '../../Design_system/Shared/styles.dart';
import '../ViewModels/home_view_model.dart';
import '../Services/favorite_service.dart';
import '../Models/book.dart';
import 'book_details_view.dart';

class HomeView extends StatefulWidget {
  final HomeViewModel viewModel;

  const HomeView({super.key, required this.viewModel});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _favoriteIds = [];

  @override
  void initState() {
    super.initState();
    widget.viewModel.addListener(_update);
    _refreshFavorites();

    if (widget.viewModel.books.isEmpty) {
      widget.viewModel.fetchBooks('flutter');
    }
  }

  Future<void> _refreshFavorites() async {
    final favBooks = await FavoriteService.getFavorites();
    if (mounted) {
      setState(() {
        _favoriteIds = favBooks.map((b) => b.id).toList();
      });
    }
  }

  Future<void> _toggleFavorite(Book book) async {
    await FavoriteService.toggleFavorite(book);
    await _refreshFavorites();
  }

  @override
  void dispose() {
    widget.viewModel.removeListener(_update);
    super.dispose();
  }

  void _update() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: AppColors.background(isDark),
      appBar: AppBar(
        title: Text('ReadRadar Home', style: AppTypography.h2(isDark)),
        backgroundColor: AppColors.surface(isDark),
        elevation: 0,
        centerTitle: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacings.m),
            child: CustomInput(
              label: 'Pesquisar livros',
              controller: _searchController,
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  if (_searchController.text.isNotEmpty) {
                    widget.viewModel.fetchBooks(_searchController.text);
                  }
                },
              ),
              onSubmitted: (val) => widget.viewModel.fetchBooks(val),
            ),
          ),
          Expanded(
            child: widget.viewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : widget.viewModel.errorMessage.isNotEmpty
                ? Center(child: Text(widget.viewModel.errorMessage, style: AppTypography.body(isDark)))
                : ListView.builder(
              itemCount: widget.viewModel.books.length,
              itemBuilder: (context, index) {
                final book = widget.viewModel.books[index];
                final isFav = _favoriteIds.contains(book.id);

                return BookCard(
                  book: book,
                  isFavorite: isFav,
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BookDetailsView(book: book),
                      ),
                    );
                    _refreshFavorites();
                  },
                  onFavoriteToggle: (b) => _toggleFavorite(b),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}