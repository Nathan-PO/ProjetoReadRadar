import 'package:flutter/foundation.dart';
import '../Models/book.dart';
import '../Services/book_api_service.dart';

class HomeViewModel extends ChangeNotifier {
  List<Book> _books = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<Book> get books => _books;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  final BookApiService _apiService = BookApiService();

  // Método para buscar livros
  Future<void> fetchBooks(String query) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      // Usando seu método estático ou instanciado
      _books = (await BookApiService.searchBooks(query)).cast<Book>();
    } catch (e) {
      _errorMessage = 'Erro ao carregar livros: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}