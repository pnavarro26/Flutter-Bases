import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMOde;

  AppTheme({this.selectedColor = 0, this.isDarkMOde = false})
    : assert(
        selectedColor >= 0 && selectedColor < colorList.length,
        'Selected color debe estar entre 0 y ${colorList.length - 1}',
      ); // valida que el indice enviado a la clase se encuentre dentro de la lista colores

  // Metodo para obtener el color seleccionado
  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkMOde ? Brightness.dark : Brightness.light,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: AppBarTheme(
      centerTitle: true,
    ), // centra todos los appBar de la aplicacion
  );
}
