import 'package:flutter/material.dart';

import '../models/equipo.dart';
import '../models/partido.dart';

// ---- Datos fijos (los mismos que en la versión Kotlin) ----

const atleticoMarina =
    Equipo(nombre: 'Atlético Marina', iniciales: 'AM', color: Color(0xFFB3261E));
const udHuerta =
    Equipo(nombre: 'UD Huerta', iniciales: 'UH', color: Color(0xFF2E7D32));
const racingCosta =
    Equipo(nombre: 'Racing Costa', iniciales: 'RC', color: Color(0xFF1565C0));
const realSierra =
    Equipo(nombre: 'Real Sierra', iniciales: 'RS', color: Color(0xFF6A1B9A));
const cfAlbufera =
    Equipo(nombre: 'CF Albufera', iniciales: 'CA', color: Color(0xFFF9A825));
const sdOlivar =
    Equipo(nombre: 'SD Olivar', iniciales: 'SO', color: Color(0xFF558B2F));
const deportivoFaro =
    Equipo(nombre: 'Deportivo Faro', iniciales: 'DF', color: Color(0xFF00838F));
const unionPuerto =
    Equipo(nombre: 'Unión Puerto', iniciales: 'UP', color: Color(0xFFD84315));
const cdSalinas =
    Equipo(nombre: 'CD Salinas', iniciales: 'CS', color: Color(0xFF37474F));
const clubAlmendro =
    Equipo(nombre: 'Club Almendro', iniciales: 'CL', color: Color(0xFF4E342E));

/// Jornada 2: partidos para pronosticar.
const partidosJornada2 = [
  Partido(id: 1, local: atleticoMarina, visitante: udHuerta),
  Partido(id: 2, local: racingCosta, visitante: realSierra),
  Partido(id: 3, local: cfAlbufera, visitante: sdOlivar),
  Partido(id: 4, local: deportivoFaro, visitante: unionPuerto),
  Partido(id: 5, local: cdSalinas, visitante: clubAlmendro),
];

/// Jornada 1: resultados con tu porra y los puntos conseguidos.
const resultadosJornada1 = [
  ResultadoJornada(
    partido: Partido(
        id: 11, local: atleticoMarina, visitante: racingCosta,
        golesLocal: 2, golesVisitante: 1),
    pronostico: Pronostico(golesLocal: 2, golesVisitante: 1),
    puntos: 8,
  ),
  ResultadoJornada(
    partido: Partido(
        id: 12, local: udHuerta, visitante: cfAlbufera,
        golesLocal: 0, golesVisitante: 0),
    pronostico: Pronostico(golesLocal: 1, golesVisitante: 1),
    puntos: 2,
  ),
  ResultadoJornada(
    partido: Partido(
        id: 13, local: realSierra, visitante: deportivoFaro,
        golesLocal: 3, golesVisitante: 1),
    pronostico: Pronostico(golesLocal: 2, golesVisitante: 0),
    puntos: 2,
  ),
  ResultadoJornada(
    partido: Partido(
        id: 14, local: sdOlivar, visitante: cdSalinas,
        golesLocal: 1, golesVisitante: 2),
  ),
  ResultadoJornada(
    partido: Partido(id: 15, local: unionPuerto, visitante: clubAlmendro),
    pronostico: Pronostico(golesLocal: 1, golesVisitante: 1),
  ),
];

/// Clasificación general. La posición 5 la ocupa el alias del usuario.
const posicionUsuario = 5;
const puntosUsuario = 26;

const otrosParticipantes = [
  Participante(alias: 'Lucía', puntos: 34),
  Participante(alias: 'Hugo', puntos: 31),
  Participante(alias: 'Martina', puntos: 30),
  Participante(alias: 'Pablo', puntos: 28),
  Participante(alias: 'Sara', puntos: 25),
  Participante(alias: 'Álex', puntos: 22),
  Participante(alias: 'Paula', puntos: 19),
  Participante(alias: 'Adrián', puntos: 15),
  Participante(alias: 'Carmen', puntos: 12),
];
