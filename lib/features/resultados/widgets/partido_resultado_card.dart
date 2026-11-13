import 'package:flutter/material.dart';

import '../../../core/models/equipo.dart';
import '../../../core/models/partido.dart';
import '../../../core/widgets/escudo_equipo.dart';

/// Tarjeta con el resultado real, tu porra y los puntos que te ha dado.
class PartidoResultadoCard extends StatelessWidget {
  const PartidoResultadoCard({super.key, required this.resultado});

  final ResultadoJornada resultado;

  String get _textoPorra {
    final p = resultado.pronostico;
    if (p == null) return 'No hiciste pronóstico';
    final porra = 'Tu porra: ${p.golesLocal} - ${p.golesVisitante}';
    return resultado.partido.jugado ? porra : '$porra · aún no se ha jugado';
  }

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final partido = resultado.partido;
    final puntos = resultado.puntos;

    return Card(
      margin: EdgeInsets.zero,
      elevation: 2,
      color: tema.colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          spacing: 12,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 6,
                children: [
                  _FilaResultado(
                      equipo: partido.local, goles: partido.golesLocal),
                  _FilaResultado(
                      equipo: partido.visitante,
                      goles: partido.golesVisitante),
                  Text(
                    _textoPorra,
                    style: tema.textTheme.labelMedium?.copyWith(
                      color: tema.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              puntos == null ? '–' : '+$puntos',
              style: tema.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: (puntos ?? 0) > 0
                    ? tema.colorScheme.primary
                    : tema.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilaResultado extends StatelessWidget {
  const _FilaResultado({required this.equipo, required this.goles});

  final Equipo equipo;
  final int? goles; // null = aún no se ha jugado

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        EscudoEquipo(
            iniciales: equipo.iniciales, color: equipo.color, tamano: 28),
        Expanded(child: Text(equipo.nombre)),
        Text(
          goles?.toString() ?? '-',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
