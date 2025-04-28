import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<ComplementoStruct> _complementos = [];
  List<ComplementoStruct> get complementos => _complementos;
  set complementos(List<ComplementoStruct> value) {
    _complementos = value;
  }

  void addToComplementos(ComplementoStruct value) {
    complementos.add(value);
  }

  void removeFromComplementos(ComplementoStruct value) {
    complementos.remove(value);
  }

  void removeAtIndexFromComplementos(int index) {
    complementos.removeAt(index);
  }

  void updateComplementosAtIndex(
    int index,
    ComplementoStruct Function(ComplementoStruct) updateFn,
  ) {
    complementos[index] = updateFn(_complementos[index]);
  }

  void insertAtIndexInComplementos(int index, ComplementoStruct value) {
    complementos.insert(index, value);
  }
}
