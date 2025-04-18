// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CardapioStruct extends FFFirebaseStruct {
  CardapioStruct({
    List<String>? lanches,
    String? nomeDaCategoria,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _lanches = lanches,
        _nomeDaCategoria = nomeDaCategoria,
        super(firestoreUtilData);

  // "lanches" field.
  List<String>? _lanches;
  List<String> get lanches => _lanches ?? const [];
  set lanches(List<String>? val) => _lanches = val;

  void updateLanches(Function(List<String>) updateFn) {
    updateFn(_lanches ??= []);
  }

  bool hasLanches() => _lanches != null;

  // "nomeDaCategoria" field.
  String? _nomeDaCategoria;
  String get nomeDaCategoria => _nomeDaCategoria ?? '';
  set nomeDaCategoria(String? val) => _nomeDaCategoria = val;

  bool hasNomeDaCategoria() => _nomeDaCategoria != null;

  static CardapioStruct fromMap(Map<String, dynamic> data) => CardapioStruct(
        lanches: getDataList(data['lanches']),
        nomeDaCategoria: data['nomeDaCategoria'] as String?,
      );

  static CardapioStruct? maybeFromMap(dynamic data) =>
      data is Map ? CardapioStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'lanches': _lanches,
        'nomeDaCategoria': _nomeDaCategoria,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'lanches': serializeParam(
          _lanches,
          ParamType.String,
          isList: true,
        ),
        'nomeDaCategoria': serializeParam(
          _nomeDaCategoria,
          ParamType.String,
        ),
      }.withoutNulls;

  static CardapioStruct fromSerializableMap(Map<String, dynamic> data) =>
      CardapioStruct(
        lanches: deserializeParam<String>(
          data['lanches'],
          ParamType.String,
          true,
        ),
        nomeDaCategoria: deserializeParam(
          data['nomeDaCategoria'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CardapioStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CardapioStruct &&
        listEquality.equals(lanches, other.lanches) &&
        nomeDaCategoria == other.nomeDaCategoria;
  }

  @override
  int get hashCode => const ListEquality().hash([lanches, nomeDaCategoria]);
}

CardapioStruct createCardapioStruct({
  String? nomeDaCategoria,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CardapioStruct(
      nomeDaCategoria: nomeDaCategoria,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CardapioStruct? updateCardapioStruct(
  CardapioStruct? cardapio, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cardapio
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCardapioStructData(
  Map<String, dynamic> firestoreData,
  CardapioStruct? cardapio,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cardapio == null) {
    return;
  }
  if (cardapio.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cardapio.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cardapioData = getCardapioFirestoreData(cardapio, forFieldValue);
  final nestedData = cardapioData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cardapio.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCardapioFirestoreData(
  CardapioStruct? cardapio, [
  bool forFieldValue = false,
]) {
  if (cardapio == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cardapio.toMap());

  // Add any Firestore field values
  cardapio.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCardapioListFirestoreData(
  List<CardapioStruct>? cardapios,
) =>
    cardapios?.map((e) => getCardapioFirestoreData(e, true)).toList() ?? [];
