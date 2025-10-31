import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackBarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    // oculta el snackbar anterior
    ScaffoldMessenger.of(context).clearSnackBars();

    // crea nuevo scarkbar snackbar anterior
    final snackbar = SnackBar(
      content: Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok', onPressed: () {}),
      duration: const Duration(
        seconds: 2,
      ), // se muetra solo 2 segundos y luego se oculta
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // obliga al usuario a seleccionar una de la opciones (botones) del dialogo
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro ?'),
        content: const Text('datos mostrados aqui para completar el dialogo'),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {
              context.pop();
            },
            child: Text('Acaptar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Snackbar y Dialogos')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Informacion de las licencias de la app'),
                  ],
                );
              },
              child: const Text('Licencias usadas'),
            ),
            FilledButton.tonal(
              onPressed: () {
                openDialog(context);
              },
              child: const Text('Mostrar Dialogo de pantalla'),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        onPressed: () {
          showCustomSnackbar(context);
        },
        icon: Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
