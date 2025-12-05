import 'package:flutter/material.dart';
import 'Application/Screens/login_view.dart';
import 'Application/Screens/dashboard_view.dart';
import 'Application/ViewModels/login_view_model.dart';
import 'Application/ViewModels/dashboard_view_model.dart';
import 'Application/ViewModels/home_view_model.dart';
import 'Application/ViewModels/favorites_view_model.dart';
import 'Design_system/Shared/colors.dart';

void main() {
  runApp(const ReadRadarApp());
}

class ReadRadarApp extends StatefulWidget {
  const ReadRadarApp({super.key});

  @override
  State<ReadRadarApp> createState() => _ReadRadarAppState();
}

class _ReadRadarAppState extends State<ReadRadarApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReadRadar',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,

      theme: ThemeData(
        useMaterial3: true,
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background(false),
        colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primary,
            brightness: Brightness.light
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background(true),
        colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primary,
            brightness: Brightness.dark
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E1E),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: MainCoordinator(onThemeToggle: _toggleTheme),
    );
  }
}

class MainCoordinator extends StatefulWidget {
  final VoidCallback onThemeToggle;
  const MainCoordinator({super.key, required this.onThemeToggle});

  @override
  State<MainCoordinator> createState() => _MainCoordinatorState();
}

class _MainCoordinatorState extends State<MainCoordinator> {
  bool _isLoggedIn = false;

  final DashboardViewModel _dashboardViewModel = DashboardViewModel();
  final HomeViewModel _homeViewModel = HomeViewModel();
  final FavoritesViewModel _favoritesViewModel = FavoritesViewModel();

  void _handleLoginSuccess(String username) {
    _dashboardViewModel.setUsername(username);
    setState(() {
      _isLoggedIn = true;
    });
  }

  void _handleLogout() {
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoggedIn) {
      return LoginView(
        viewModel: LoginViewModel(),
        onLoginSuccess: (name) => _handleLoginSuccess(name),
      );
    } else {
      return DashboardView(
        dashboardViewModel: _dashboardViewModel,
        homeViewModel: _homeViewModel,
        favoritesViewModel: _favoritesViewModel,
        onThemeToggle: widget.onThemeToggle,
        onLogout: _handleLogout,
      );
    }
  }
}