import 'package:flutter/material.dart';
import '../colors/colors.dart';
import '../typography/typography.dart';

class CardMovie extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? imageUrl; // null para placeholder
  final VoidCallback? onTap;
  final double borderRadius;
  final double elevation;

  const CardMovie({
    Key? key,
    required this.title,
    required this.subtitle,
    this.imageUrl,
    this.onTap,
    this.borderRadius = 12,
    this.elevation = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Card(
        elevation: elevation,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Placeholder
            AspectRatio(
              aspectRatio: 16 / 9,
              child: imageUrl != null
                  ? Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => _placeholder(),
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(value: progress.expectedTotalBytes != null ? progress.cumulativeBytesLoaded / (progress.expectedTotalBytes ?? 1) : null),
                  );
                },
              )
                  : _placeholder(),
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTypography.lightTextTheme.titleLarge),
                  const SizedBox(height: 6),
                  Text(subtitle, style: AppTypography.lightTextTheme.bodyMedium),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _placeholder() {
    return Container(
      color: AppColors.divider,
      child: const Center(child: Icon(Icons.image, size: 48, color: Colors.white70)),
    );
  }
}