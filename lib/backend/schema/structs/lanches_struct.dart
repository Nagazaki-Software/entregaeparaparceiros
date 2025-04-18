// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class LanchesStruct extends FFFirebaseStruct {
  LanchesStruct({
    String? nomedolanche,
    String? categoria,
    double? valor,
    double? valorPromocional,
    String? descricao,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nomedolanche = nomedolanche,
        _categoria = categoria,
        _valor = valor,
        _valorPromocional = valorPromocional,
        _descricao = descricao,
        super(firestoreUtilData);

  // "nomedolanche" field.
  String? _nomedolanche;
  String get nomedolanche => _nomedolanche ?? '';
  set nomedolanche(String? val) => _nomedolanche = val;

  bool hasNomedolanche() => _nomedolanche != null;

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  set categoria(String? val) => _categoria = val;

  bool hasCategoria() => _categoria != null;

  // "valor" field.
  double? _valor;
  double get valor => _valor ?? 0.0;
  set valor(double? val) => _valor = val;

  void incrementValor(double amount) => valor = valor + amount;

  bool hasValor() => _valor != null;

  // "valorPromocional" field.
  double? _valorPromocional;
  double get valorPromocional => _valorPromocional ?? 0.0;
  set valorPromocional(double? val) => _valorPromocional = val;

  void incrementValorPromocional(double amount) =>
      valorPromocional = valorPromocional + amount;

  bool hasValorPromocional() => _valorPromocional != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  set descricao(String? val) => _descricao = val;

  bool hasDescricao() => _descricao != null;

  static LanchesStruct fromMap(Map<String, dynamic> data) => LanchesStruct(
        nomedolanche: data['nomedolanche'] as String?,
        categoria: data['categoria'] as String?,
        valor: castToType<double>(data['valor']),
        valorPromocional: castToType<double>(data['valorPromocional']),
        descricao: data['descricao'] as String?,
      );

  static LanchesStruct? maybeFromMap(dynamic data) =>
      data is Map ? LanchesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'nomedolanche': _nomedolanche,
        'categoria': _categoria,
        'valor': _valor,
        'valorPromocional': _valorPromocional,
        'descricao': _descricao,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nomedolanche': serializeParam(
          _nomedolanche,
          ParamType.String,
        ),
        'categoria': serializeParam(
          _categoria,
          ParamType.String,
        ),
        'valor': serializeParam(
          _valor,
          ParamType.double,
        ),
        'valorPromocional': serializeParam(
          _valorPromocional,
          ParamType.double,
        ),
        'descricao': serializeParam(
          _descricao,
          ParamType.String,
        ),
      }.withoutNulls;

  static LanchesStruct fromSerializableMap(Map<String, dynamic> data) =>
      LanchesStruct(
        nomedolanche: deserializeParam(
          data['nomedolanche'],
          ParamType.String,
          false,
        ),
        categoria: deserializeParam(
          data['categoria'],
          ParamType.String,
          false,
        ),
        valor: deserializeParam(
          data['valor'],
          ParamType.double,
          false,
        ),
        valorPromocional: deserializeParam(
          data['valorPromocional'],
          ParamType.double,
          false,
        ),
        descricao: deserializeParam(
          data['descricao'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LanchesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LanchesStruct &&
        nomedolanche == other.nomedolanche &&
        categoria == other.categoria &&
        valor == other.valor &&
        valorPromocional == other.valorPromocional &&
        descricao == other.descricao;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([nomedolanche, categoria, valor, valorPromocional, descricao]);
}

LanchesStruct createLanchesStruct({
  String? nomedolanche,
  String? categoria,
  double? valor,
  double? valorPromocional,
  String? descricao,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LanchesStruct(
      nomedolanche: nomedolanche,
      categoria: categoria,
      valor: valor,
      valorPromocional: valorPromocional,
      descricao: descricao,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LanchesStruct? updateLanchesStruct(
  LanchesStruct? lanches, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    lanches
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLanchesStructData(
  Map<String, dynamic> firestoreData,
  LanchesStruct? lanches,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (lanches == null) {
    return;
  }
  if (lanches.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && lanches.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final lanchesData = getLanchesFirestoreData(lanches, forFieldValue);
  final nestedData = lanchesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = lanches.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLanchesFirestoreData(
  LanchesStruct? lanches, [
  bool forFieldValue = false,
]) {
  if (lanches == null) {
    return {};
  }
  final firestoreData = mapToFirestore(lanches.toMap());

  // Add any Firestore field values
  lanches.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLanchesListFirestoreData(
  List<LanchesStruct>? lanchess,
) =>
    lanchess?.map((e) => getLanchesFirestoreData(e, true)).toList() ?? [];
