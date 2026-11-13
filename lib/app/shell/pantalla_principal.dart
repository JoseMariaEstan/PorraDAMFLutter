import 'package:flutter/material.dart';

import '../../features/clasificacion/clasificacion.dart';
import '../../features/jornada/jornada.dart';
import '../../features/resultados/resultados.dart';
import 'destinos.dart';

/// Scaffold con AppBar y NavigationBar. Cambia de pestaña con estado local.
class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key, required this.alias});

  final String alias;

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  Destino _actual = Destino.jornada;

  @override
  Widget build(BuildContext context) {
    // Igual que el BackHandler de Kotlin: si no estás en Jornada,
    // el botón "atrás" te devuelve a Jornada en vez de cerrar la app.
    return PopScope(
      canPop: _actual == Destino.jornada,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) setState(() => _actual = Destino.jornada);
      },
      child: Scaffold(
        appBar: AppBar(title: Text(_actual.titulo)),
        // IndexedStack conserva el estado de cada pestaña (p. ej. los pronósticos).
        body: IndexedStack(
          index: _actual.index,
          children: [
            VistaJornada(alias: widget.alias),
            const VistaResultados(),
            VistaClasificacion(alias: widget.alias),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _actual.index,
          onDestinationSelected: (i) =>
              setState(() => _actual = Destino.values[i]),
          destinations: [
            for (final d in Destino.values)
              NavigationDestination(icon: Icon(d.icono), label: d.titulo),
          ],
        ),
      ),
    );
  }
}
