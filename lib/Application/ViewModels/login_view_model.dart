import 'package:flutter/foundation.dart';

class LoginViewModel extends ChangeNotifier {

  bool _isLoading = false;
  bool get isLoading => _isLoading;


  Future<bool> login(String user, String pass) async {
    _isLoading = true;
    notifyListeners();


    await Future.delayed(const Duration(seconds: 2));

    _isLoading = false;
    notifyListeners();


    return user.isNotEmpty && pass.isNotEmpty;
  }
}