import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:widget_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider((ref) => false);

// Listado de Colores inmutable
// "Provider" indica que no lo puedo cambiar, cada vez que acceda al valor red, sera ne modo lectura
final colorListProvider = Provider((ref) => colorList);

// Listado de Colores inmutable
final selectedIndexColorProvider = StateProvider((ref) => 0);
