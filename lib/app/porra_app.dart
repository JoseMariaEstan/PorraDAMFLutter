import 'package:flutter/material.dart';

import '../core/widgets/con_fondo.dart';
import '../features/bienvenida/screens/pantalla_bienvenida.dart';
import 'shell/pantalla_principal.dart';

/// Decide qué se muestra: la bienvenida (sin alias) o la pantalla principal.
class PorraApp extends StatefulWidget {
  const PorraApp({super.key});

  @override
  State<PorraApp> createState() => _PorraAppState();
}

class _PorraAppState extends State<PorraApp> {
  String? _alias;

  @override
  Widget build(BuildContext context) {
    final alias = _alias;

    return ConFondo(
      child: alias == null
          ? PantallaBienvenida(
              onEntrar: (nombre) => setState(() => _alias = nombre),
            )
          : PantallaPrincipal(alias: alias),
    );
  }
}
