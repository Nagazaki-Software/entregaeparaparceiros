import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

double retorneStringToDouble(String texto) {
  // retorne o texto em double (sempre será em valor como 30,00, R$ 30,00, 1.900,90)
// Remove R$ and any non-numeric characters except for the decimal separator
  String sanitized =
      texto.replaceAll(RegExp(r'[^\d,]'), '').replaceAll(',', '.');
  return double.parse(sanitized);
}

int retorneAdataBaseadoNotxt(
  DateTime data,
  String diaMesAno,
) {
  // retorne a data baseado se o usuario pediu o dia mes ou ano
  switch (diaMesAno.toLowerCase()) {
    case 'dia':
      return data.day;
    case 'mes':
      return data.month;
    case 'ano':
      return data.year;
    default:
      throw ArgumentError(
          'Invalid input: $diaMesAno. Use "dia", "mes", or "ano".');
  }
}

List<String> newCustomFunction() {
  // mande em lista todos os bank routing number suportados pelo stripe do brasil exemplo " 260 - itaú"
  return [
    "001 - Banco do Brasil",
    "003 - Banco da Amazônia",
    "004 - Banco do Nordeste",
    "021 - Banestes",
    "025 - Banco Alfa",
    "027 - Banco Inter",
    "029 - Banco B3",
    "033 - Santander",
    "036 - Banco Bradesco",
    "041 - Banco do Estado do Rio Grande do Sul",
    "070 - Banco do Estado de Santa Catarina",
    "104 - Caixa Econômica Federal",
    "237 - Banco Bradesco",
    "341 - Itaú",
    "399 - HSBC",
    "756 - Banco Cooperativo do Brasil",
    "745 - Citibank",
    "260 - Itaú",
    "341 - Itaú Unibanco",
    "748 - Banco Cooperativo Sicredi",
    "655 - Banco Votorantim",
    "633 - Banco Rendimento",
    "626 - Banco Ficsa",
    "748 - Banco Cooperativo Sicredi",
    "070 - Banco do Estado de Santa Catarina",
    "003 - Banco da Amazônia",
    "004 - Banco do Nordeste",
    "021 - Banestes",
    "025 - Banco Alfa",
    "027 - Banco Inter",
    "029 - Banco B3",
    "033 - Santander",
    "036 - Banco Bradesco",
    "041 - Banco do Estado do Rio Grande do Sul",
    "104 - Caixa Econômica Federal",
    "237 - Banco Bradesco",
    "341 - Itaú",
    "399 - HSBC",
    "756 - Banco Cooperativo do Brasil",
    "745 - Citibank",
    "260 - Nubank",
  ];
}

int retireTudosSomenteNumber(String texto) {
  // retorne somente o numero retire TUDO
  return int.parse(texto.replaceAll(RegExp(r'[^0-9]'), ''));
}
