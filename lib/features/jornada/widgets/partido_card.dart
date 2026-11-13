import 'package:flutter/material.dart';

import '../../../core/models/equipo.dart';
import '../../../core/models/partido.dart';
import '../../../core/widgets/escudo_equipo.dart';
import '../../../core/widgets/marcador_selector.dart';

/// Tarjeta de un partido con un selector de goles para cada equipo.
class PartidoCard extends StatelessWidget {
  const PartidoCard({
    super.key,
    required this.partido,
    required this.pronostico,
    required this.onCambioLocal,
    required this.onCambioVisitante,
  });

  final Partido partido;
  final Pronostico pronostico;
  final ValueChanged<int> onCambioLocal;
  final ValueChanged<int> onCambioVisitante;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 2,
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 12,
          children: [
            _FilaEquipoSelector(
              equipo: partido.local,
              goles: pronostico.golesLocal,
              onCambio: onCambioLocal,
            ),
            const Divider(height: 1),
            _FilaEquipoSelector(
              equipo: partido.visitante,
              goles: pronostico.golesVisitante,
              onCambio: onCambioVisitante,
            ),
          ],
        ),
      ),
    );
  }
}

class _FilaEquipoSelector extends StatelessWidget {
  const _FilaEquipoSelector({
    required this.equipo,
    required this.goles,
    required this.onCambio,
  });

  final Equipo equipo;
  final int goles;
  final ValueChanged<int> onCambio;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        EscudoEquipo(iniciales: equipo.iniciales, color: equipo.color),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            equipo.nombre,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        MarcadorSelector(goles: goles, onCambio: onCambio),
      ],
    );
  }
}
