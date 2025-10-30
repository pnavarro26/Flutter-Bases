import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';

  const HomeScreen({super.key});

  // widget de tipo Scaffold, que contiene el appBar y el body, con el ListViwe de botones //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Futter + Material 3')),
      body: _HomeViwe(),
    );
  }
}

class _HomeViwe extends StatelessWidget {
  final list = appMenuItems;
  const _HomeViwe();

  @override
  Widget build(BuildContext context) {
    // listado de widet .builder se contruye en ejecucion
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final MenuItem menuItem;

  const _CustomListTile({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(
      context,
    ).colorScheme; // obtiene el color del esquema (theme) definido en el main

    return ListTile(
      leading: Icon(menuItem.icon, color: color.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: color.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        // FLUTTE //
        /*Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (context) => const ButtonsScreen()),
        );*/
        //Navigator.pushNamed(context, menuItem.link);

        // GO ROUTER //
        // navegar a la ruta por medio del path
        context.push(menuItem.link);

        // navegar a la ruta por medio del name
        //context.pushNamed(menuItem.name); // NOTA: hayque agregar al menuItem, la propiedad name, para almacenar el nombre de esa ruta
      },
    );
  }
}
