import 'package:flutter/material.dart';
import '../../Design_system/Shared/colors.dart';
import '../../Design_system/Shared/styles.dart';
import '../../Design_system/Components/Buttons/primary_button.dart';
import '../../Design_system/Components/Inputs/custom_input.dart';
import '../ViewModels/login_view_model.dart';
import 'auth_extras_view.dart';

class LoginView extends StatefulWidget {
  final LoginViewModel viewModel;
  final Function(String) onLoginSuccess;

  const LoginView({super.key, required this.viewModel, required this.onLoginSuccess});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _userController.text = "Nathan";
    widget.viewModel.addListener(_update);
  }

  @override
  void dispose() {
    widget.viewModel.removeListener(_update);
    _userController.dispose();
    _passController.dispose();
    super.dispose();
  }

  void _update() => setState(() {});

  @override
  Widget build(BuildContext context) {
    // Detectar tema
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: AppColors.background(isDark),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacings.l),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(Icons.menu_book_rounded, size: 64, color: AppColors.primary),
              const SizedBox(height: AppSpacings.m),


              Text(
                  'ReadRadar Login',
                  textAlign: TextAlign.center,
                  style: AppTypography.h1(isDark)
              ),
              const SizedBox(height: AppSpacings.s),
              Text(
                  'Seu radar literário pessoal',
                  textAlign: TextAlign.center,
                  style: AppTypography.caption(isDark).copyWith(fontSize: 16)
              ),
              const SizedBox(height: AppSpacings.xxl),

              CustomInput(
                label: 'Usuário',
                controller: _userController,
                prefixIcon: Icons.person_outline,
              ),
              const SizedBox(height: AppSpacings.m),

              CustomInput(
                label: 'Senha',
                controller: _passController,
                isPassword: true,
                prefixIcon: Icons.lock_outline,
              ),

              const SizedBox(height: AppSpacings.m),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RegisterView())),
                    child: Text("Criar Conta", style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ForgotPasswordView())),
                    child: Text("Esqueci a Senha", style: AppTypography.caption(isDark)),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacings.l),

              PrimaryButton(
                text: 'ENTRAR',
                isLoading: widget.viewModel.isLoading,
                onPressed: () async {
                  final success = await widget.viewModel.login(_userController.text, _passController.text);
                  if (success) {
                    widget.onLoginSuccess(_userController.text);
                  } else {
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Preencha usuário e senha'), backgroundColor: AppColors.error));
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}