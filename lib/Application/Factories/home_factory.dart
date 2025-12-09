import 'package:flutter/material.dart';
import '../Screens/home_view.dart';
import '../ViewModels//home_view_model.dart';

class HomeFactory {
  static Widget create() {
    final viewModel = HomeViewModel();
    return HomeView(viewModel: viewModel);
  }
}