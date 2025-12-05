import 'package:flutter/material.dart';
import '../../Design_system/Shared/colors.dart';
import '../../Design_system/Shared/styles.dart';
import '../../Design_system/Components/Buttons/primary_button.dart';
import '../../Design_system/Components/Inputs/custom_input.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final nameCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
    final passCtrl = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.background(isDark),
      appBar: AppBar(
        title: Text("Criar Conta", style: AppTypography.h2(isDark)),
        backgroundColor: AppColors.surface(isDark),
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.icon(isDark)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacings.l),
        child: Column(
          children: [
            CustomInput(label: "Nome Completo", controller: nameCtrl, prefixIcon: Icons.person),
            const SizedBox(height: AppSpacings.m),
            CustomInput(label: "E-mail", controller: emailCtrl, prefixIcon: Icons.email),
            const SizedBox(height: AppSpacings.m),
            CustomInput(label: "Senha", controller: passCtrl, isPassword: true, prefixIcon: Icons.lock),
            const SizedBox(height: AppSpacings.l),
            PrimaryButton(
              text: "CADASTRAR",
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final emailCtrl = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.background(isDark),
      appBar: AppBar(
        title: Text("Recuperar Senha", style: AppTypography.h2(isDark)),
        backgroundColor: AppColors.surface(isDark),
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.icon(isDark)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacings.l),
        child: Column(
          children: [
            Text(
              "Digite seu e-mail para receber o link de redefinição.",
              style: AppTypography.body(isDark),
            ),
            const SizedBox(height: AppSpacings.m),
            CustomInput(label: "E-mail", controller: emailCtrl, prefixIcon: Icons.email),
            const SizedBox(height: AppSpacings.l),
            PrimaryButton(
              text: "ENVIAR",
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("E-mail enviado!")));
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}