import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/presentation/providers/counter_provider.dart';
import 'package:widget_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const name = 'counter_screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // el "watch" esta pendiente de los cambios del counterProvider
    // cada vez que el counter cambia, obtenemos el nuevo valor, y Flutter redibuja le witdge
    final int clickCounter = ref.watch(counterProvider);
    final bool darkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Screen'),
        actions: [
          IconButton(
            onPressed: () {
              ref
                  .read(isDarkModeProvider.notifier)
                  .update((stateActual) => !stateActual);
            },
            icon: darkMode
                ? Icon(Icons.dark_mode_outlined)
                : Icon(Icons.light_mode_outlined),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Valor: $clickCounter',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // "read" para obtener el valor
          // si quiero hacer un cambio al counterProvider, debo colocar le .notifier, para que haga referencia al que se va a encargar de hacer la notificacion
          // el state, va a permitir modificar el valor del counterProvider
          //ref.read(counterProvider.notifier).state++;

          ref
              .read(counterProvider.notifier)
              .update((stateActual) => stateActual + 1);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
