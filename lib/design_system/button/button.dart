import 'package:flutter/material.dart';
import '../colors/colors.dart';
import '../typography/typography.dart';

enum AppButtonVariant { primary, secondary, outline }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final bool enabled;
  final Widget? leading;
  final EdgeInsetsGeometry padding;

  const AppButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.enabled = true,
    this.leading,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Definir cores
    Color background;
    Color foreground;
    BorderSide? borderSide;

    switch (variant) {
      case AppButtonVariant.primary:
        background = AppColors.primary;
        foreground = AppColors.onPrimary;
        borderSide = null;
        break;
      case AppButtonVariant.secondary:
        background = AppColors.backgroundDark;
        foreground = AppColors.onBackgroundDark;
        borderSide = null;
        break;
      case AppButtonVariant.outline:
        background = Colors.transparent;
        foreground = AppColors.primary;
        borderSide = BorderSide(color: AppColors.primary, width: 1.2);
        break;
    }

    if (!enabled) {
      background = AppColors.disabled;
      foreground = Colors.white;
    }

    final ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: background,
      foregroundColor: foreground,
      padding: padding,
      textStyle: AppTypography.lightTextTheme.labelLarge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: borderSide ?? BorderSide.none),
      elevation: variant == AppButtonVariant.outline ? 0 : 2,
    );

    // usar ElevatedButton para primary/secondary, OutlinedButton para outline para acessibilidade
    if (variant == AppButtonVariant.outline) {
      return OutlinedButton(
        onPressed: enabled ? onPressed : null,
        style: OutlinedButton.styleFrom(
          side: borderSide,
          padding: padding,
          foregroundColor: foreground,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: AppTypography.lightTextTheme.labelLarge,
        ),
        child: _buildChild(foreground),
      );
    }

    return ElevatedButton(
      onPressed: enabled ? onPressed : null,
      style: style,
      child: _buildChild(foreground),
    );
  }

  Widget _buildChild(Color textColor) {
    if (leading != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          leading!,
          const SizedBox(width: 8),
          Text(label),
        ],
      );
    }
    return Text(label);
  }
}