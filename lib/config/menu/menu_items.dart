import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Botones',
    subTitle: 'Varios',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Tarjetas',
    subTitle: 'Un Contenedor Estilizado',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'ProgressIndicators',
    subTitle: 'Generares y Contrlados',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    title: 'SnackBars',
    subTitle: 'Snackbars y Dialogos',
    link: '/snackbars',
    icon: Icons.info_outline,
  ),
  MenuItem(
    title: 'Animated Container',
    subTitle: 'Animated Container',
    link: '/animated',
    icon: Icons.check_box_outlined,
  ),
  MenuItem(
    title: 'UI Controlls',
    subTitle: 'UI Controlls',
    link: '/ui-controlls',
    icon: Icons.check_box_outlined,
  ),
];
