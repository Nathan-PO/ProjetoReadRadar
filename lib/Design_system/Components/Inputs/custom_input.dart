import 'package:flutter/material.dart';
import '../../Shared/colors.dart';
import '../../Shared/styles.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final Function(String)? onSubmitted;

  const CustomInput({
    super.key,
    required this.label,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return TextField(
      controller: controller,
      obscureText: isPassword,

      style: AppTypography.body(isDark),
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        labelText: label,

        labelStyle: AppTypography.caption(isDark),
        filled: true,

        fillColor: AppColors.surface(isDark),

        contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacings.l, vertical: AppSpacings.m),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.primary, width: 1.5),
        ),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: AppColors.primary) : null,
        suffixIcon: suffixIcon,
      ),
    );
  }
}