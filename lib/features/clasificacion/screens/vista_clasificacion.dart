import 'package:flutter/material.dart';

import '../../../core/data/datos_ejemplo.dart';
import '../../../core/models/partido.dart';
import '../widgets/fila_clasificacion.dart';

/// Pestaña Clasificación: ranking general con tu fila resaltada.
class VistaClasificacion extends StatelessWidget {
  const VistaClasificacion({super.key, required this.alias});

  final String alias;

  @override
  Widget build(BuildContext context) {
    final texto = Theme.of(context).textTheme;
    final colores = Theme.of(context).colorScheme;

    // Metemos al usuario en su posición dentro de la lista fija.
    final participantes = [...otrosParticipantes]..insert(
        posicionUsuario - 1,
        Participante(alias: alias, puntos: puntosUsuario),
      );

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          'Clasificación general',
          style: texto.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          '${participantes.length} participantes',
          style: texto.bodyMedium?.copyWith(color: colores.onSurfaceVariant),
        ),
        const SizedBox(height: 8),
        for (var i = 0; i < participantes.length; i++) ...[
          FilaClasificacion(
            posicion: i + 1,
            alias: participantes[i].alias,
            puntos: participantes[i].puntos,
            esYo: i + 1 == posicionUsuario,
          ),
          const SizedBox(height: 4),
        ],
      ],
    );
  }
}
