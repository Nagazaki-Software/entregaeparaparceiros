// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<LanchesStruct>> reorderCardapio(
  List<LanchesStruct> cardapio,
  int oldIndex,
  int newIndex,
) async {
  if (oldIndex < newIndex) {
    newIndex -= 1;
  }

  final itemMovido = cardapio[oldIndex];
  cardapio.removeAt(oldIndex);
  cardapio.insert(newIndex, itemMovido);

  return cardapio;
}
