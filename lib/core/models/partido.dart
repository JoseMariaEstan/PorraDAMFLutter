import 'equipo.dart';

/// Un partido de la jornada. Los goles son null si aún no se ha jugado.
class Partido {
  const Partido({
    required this.id,
    required this.local,
    required this.visitante,
    this.golesLocal,
    this.golesVisitante,
  });

  final int id;
  final Equipo local;
  final Equipo visitante;
  final int? golesLocal;
  final int? golesVisitante;

  bool get jugado => golesLocal != null && golesVisitante != null;
}

/// Pronóstico del usuario para un partido.
class Pronostico {
  const Pronostico({this.golesLocal = 0, this.golesVisitante = 0});

  final int golesLocal;
  final int golesVisitante;

  Pronostico copyWith({int? golesLocal, int? golesVisitante}) => Pronostico(
        golesLocal: golesLocal ?? this.golesLocal,
        golesVisitante: golesVisitante ?? this.golesVisitante,
      );
}

/// Partido ya disputado (o pendiente) junto a lo que pronosticó el usuario.
class ResultadoJornada {
  const ResultadoJornada({
    required this.partido,
    this.pronostico,
    this.puntos,
  });

  final Partido partido;
  final Pronostico? pronostico; // null = no hizo pronóstico
  final int? puntos; // null = todavía sin puntos
}

/// Fila de la clasificación general.
class Participante {
  const Participante({required this.alias, required this.puntos});

  final String alias;
  final int puntos;
}
