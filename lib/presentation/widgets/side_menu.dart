import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffolKey;

  const SideMenu({super.key, required this.scaffolKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  // permite identificar cual de las secciones dle menu esta seleccionada
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    // obtiene la distancia entreel top y el Main, que puede variar entrs Andoid e IOS
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        // obtengo la opcion seleccioanda
        final menuItem = appMenuItems[value];

        // GO ROUTER //
        // navegar a la ruta por medio del path
        context.push(menuItem.link); // navego a la pantalla

        // cerrar el menu lateral luego de que se selccione una opcion en el menu
        widget.scaffolKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            28,
            hasNotch ? 10 : 20,
            16,
            10,
          ), // el hasNotch ayuda a adpatar el diseño/posicion del Menu de acuerdo al dispositivo donde se ejecute la app
          child: Text('Main'),
        ),

        ...appMenuItems
            .sublist(0, 3)
            .map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),

        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Text('More option'),
        ),

        ...appMenuItems
            .sublist(3)
            .map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),
      ],
    );
  }
}
