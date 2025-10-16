import 'package:flutter/material.dart';
import '../design_system/colors/colors.dart';
import '../design_system/icons/icons.dart';
import '../design_system/button/button.dart';
import '../design_system/card_movie/card_movie.dart';
import '../design_system/typography/typography.dart';

class DesignSystemScreen extends StatelessWidget {
  const DesignSystemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Design System'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Cores', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Wrap(spacing: 12, runSpacing: 12, children: [
            _colorTile('Primary', AppColors.primary),
            _colorTile('BG Light', AppColors.background),
            _colorTile('BG Dark', AppColors.backgroundDark),
            _colorTile('Surface', AppColors.surface),
            _colorTile('Favorite', AppColors.fav),
          ]),
          const SizedBox(height: 20),

          const Text('Tipografia', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('Title - Exemplo', style: AppTypography.title),
          Text('Subtitle - Exemplo', style: AppTypography.subtitle),
          Text('Bodytext - Exemplo', style: AppTypography.bodyText),
          const SizedBox(height: 20),

          const Text('Botões', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(spacing: 8, children: [
            AppButton(label: 'Primary', onPressed: () {}, variant: AppButtonVariant.primary),
            //AppButton(label: 'backgroundDark', onPressed: () {}, variant: AppButtonVariant.secondary),
            AppButton(label: 'Outline', onPressed: () {}, variant: AppButtonVariant.outline),
            AppButton(label: 'Disabled', onPressed: () {}, enabled: false),
          ]),
          const SizedBox(height: 20),
          const Text('Icones', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Wrap(spacing: 12, runSpacing: 12, children: [
            Icon(Icons.edit),
            Icon(Icons.home),
            Icon(Icons.favorite),
            Icon(Icons.bookmark),
            Icon(Icons.settings),
            Icon(Icons.search),
            Icon(Icons.book),
            Icon(Icons.delete),
            Icon(Icons.brightness_6),
          ]),
          const SizedBox(height: 20),

          const Text('Cartão', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          CardMovie(title: 'Título Exemplo', subtitle: 'Subtítulo do item', imageUrl: null, onTap: () {}),

        ]),
      ),
    );
  }

  Widget _colorTile(String label, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 72, height: 56, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8))),
        const SizedBox(height: 6),
        Text(label),
      ],
    );
  }
}