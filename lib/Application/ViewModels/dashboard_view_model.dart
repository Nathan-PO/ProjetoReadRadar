import 'package:flutter/foundation.dart';

class DashboardViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  String _username = "Visitante";

  int get currentIndex => _currentIndex;
  String get username => _username;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void setUsername(String name) {
    _username = name;
    notifyListeners();
  }
}