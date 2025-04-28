// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ComplementoStruct extends FFFirebaseStruct {
  ComplementoStruct({
    String? nomeDoComplemento,
    double? valordocomplemento,
    String? descricaodocomplemento,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nomeDoComplemento = nomeDoComplemento,
        _valordocomplemento = valordocomplemento,
        _descricaodocomplemento = descricaodocomplemento,
        super(firestoreUtilData);

  // "nomeDoComplemento" field.
  String? _nomeDoComplemento;
  String get nomeDoComplemento => _nomeDoComplemento ?? '';
  set nomeDoComplemento(String? val) => _nomeDoComplemento = val;

  bool hasNomeDoComplemento() => _nomeDoComplemento != null;

  // "valordocomplemento" field.
  double? _valordocomplemento;
  double get valordocomplemento => _valordocomplemento ?? 0.0;
  set valordocomplemento(double? val) => _valordocomplemento = val;

  void incrementValordocomplemento(double amount) =>
      valordocomplemento = valordocomplemento + amount;

  bool hasValordocomplemento() => _valordocomplemento != null;

  // "descricaodocomplemento" field.
  String? _descricaodocomplemento;
  String get descricaodocomplemento => _descricaodocomplemento ?? '';
  set descricaodocomplemento(String? val) => _descricaodocomplemento = val;

  bool hasDescricaodocomplemento() => _descricaodocomplemento != null;

  static ComplementoStruct fromMap(Map<String, dynamic> data) =>
      ComplementoStruct(
        nomeDoComplemento: data['nomeDoComplemento'] as String?,
        valordocomplemento: castToType<double>(data['valordocomplemento']),
        descricaodocomplemento: data['descricaodocomplemento'] as String?,
      );

  static ComplementoStruct? maybeFromMap(dynamic data) => data is Map
      ? ComplementoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nomeDoComplemento': _nomeDoComplemento,
        'valordocomplemento': _valordocomplemento,
        'descricaodocomplemento': _descricaodocomplemento,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nomeDoComplemento': serializeParam(
          _nomeDoComplemento,
          ParamType.String,
        ),
        'valordocomplemento': serializeParam(
          _valordocomplemento,
          ParamType.double,
        ),
        'descricaodocomplemento': serializeParam(
          _descricaodocomplemento,
          ParamType.String,
        ),
      }.withoutNulls;

  static ComplementoStruct fromSerializableMap(Map<String, dynamic> data) =>
      ComplementoStruct(
        nomeDoComplemento: deserializeParam(
          data['nomeDoComplemento'],
          ParamType.String,
          false,
        ),
        valordocomplemento: deserializeParam(
          data['valordocomplemento'],
          ParamType.double,
          false,
        ),
        descricaodocomplemento: deserializeParam(
          data['descricaodocomplemento'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ComplementoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ComplementoStruct &&
        nomeDoComplemento == other.nomeDoComplemento &&
        valordocomplemento == other.valordocomplemento &&
        descricaodocomplemento == other.descricaodocomplemento;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([nomeDoComplemento, valordocomplemento, descricaodocomplemento]);
}

ComplementoStruct createComplementoStruct({
  String? nomeDoComplemento,
  double? valordocomplemento,
  String? descricaodocomplemento,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ComplementoStruct(
      nomeDoComplemento: nomeDoComplemento,
      valordocomplemento: valordocomplemento,
      descricaodocomplemento: descricaodocomplemento,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ComplementoStruct? updateComplementoStruct(
  ComplementoStruct? complemento, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    complemento
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addComplementoStructData(
  Map<String, dynamic> firestoreData,
  ComplementoStruct? complemento,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (complemento == null) {
    return;
  }
  if (complemento.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && complemento.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final complementoData =
      getComplementoFirestoreData(complemento, forFieldValue);
  final nestedData =
      complementoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = complemento.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getComplementoFirestoreData(
  ComplementoStruct? complemento, [
  bool forFieldValue = false,
]) {
  if (complemento == null) {
    return {};
  }
  final firestoreData = mapToFirestore(complemento.toMap());

  // Add any Firestore field values
  complemento.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getComplementoListFirestoreData(
  List<ComplementoStruct>? complementos,
) =>
    complementos?.map((e) => getComplementoFirestoreData(e, true)).toList() ??
    [];
