import 'package:flutter/material.dart';
import '../Screens/dashboard_view.dart';
import '../ViewModels/dashboard_view_model.dart';
import '../ViewModels/home_view_model.dart';
import '../ViewModels/favorites_view_model.dart';

class DashboardFactory {
  //create precisa receber a função de toggle para passar para a View
  static Widget create({required VoidCallback onThemeToggle}) {
    return DashboardView(
      dashboardViewModel: DashboardViewModel(),
      homeViewModel: HomeViewModel(),
      favoritesViewModel: FavoritesViewModel(),
      onThemeToggle: onThemeToggle, onLogout: () {  },
    );
  }
}