import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/presentation/providers/theme_provider.dart';

class ThemeChanger extends ConsumerWidget {
  static const name = 'theme-changer';

  const ThemeChanger({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // el "watch" esta pendiente de los cambios del counterProvider
    // cada vez que el counter cambia, obtenemos el nuevo valor, y Flutter redibuja le witdge
    final bool darkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Changer'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update((state) => !state);
            },
            icon: darkMode
                ? Icon(Icons.dark_mode_outlined)
                : Icon(Icons.light_mode_outlined),
          ),
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedColor = ref.watch(selectedIndexColorProvider);

    return RadioGroup<int>(
      groupValue: selectedColor,

      onChanged: (value) {
        if (value != null) {
          ref.read(selectedIndexColorProvider.notifier).state = value;
        }
      },
      child: ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final color = colors[index];
          return RadioListTile<int>(
            value: index,
            title: Text('Este color', style: TextStyle(color: color)),
            subtitle: Text('${color.toARGB32()}'),
          );
        },
      ),
    );
  }
}
