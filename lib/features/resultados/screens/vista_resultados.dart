import 'package:flutter/material.dart';

import '../../../core/data/datos_ejemplo.dart';
import '../widgets/partido_resultado_card.dart';

/// Pestaña Resultados: resultados de la jornada 1 con tu porra y tus puntos.
class VistaResultados extends StatelessWidget {
  const VistaResultados({super.key});

  @override
  Widget build(BuildContext context) {
    final texto = Theme.of(context).textTheme;
    final colores = Theme.of(context).colorScheme;
    final total = resultadosJornada1.fold<int>(
        0, (suma, r) => suma + (r.puntos ?? 0));

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          'Jornada 1',
          style: texto.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          'Has sumado $total puntos',
          style: texto.bodyMedium?.copyWith(color: colores.onSurfaceVariant),
        ),
        const SizedBox(height: 12),
        for (final resultado in resultadosJornada1) ...[
          PartidoResultadoCard(resultado: resultado),
          const SizedBox(height: 12),
        ],
      ],
    );
  }
}
