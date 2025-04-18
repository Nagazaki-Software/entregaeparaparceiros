import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LanchesRecord extends FirestoreRecord {
  LanchesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nomedolanche" field.
  String? _nomedolanche;
  String get nomedolanche => _nomedolanche ?? '';
  bool hasNomedolanche() => _nomedolanche != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "valor" field.
  double? _valor;
  double get valor => _valor ?? 0.0;
  bool hasValor() => _valor != null;

  // "valorpromocional" field.
  double? _valorpromocional;
  double get valorpromocional => _valorpromocional ?? 0.0;
  bool hasValorpromocional() => _valorpromocional != null;

  // "foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  bool hasFoto() => _foto != null;

  // "ativo" field.
  bool? _ativo;
  bool get ativo => _ativo ?? false;
  bool hasAtivo() => _ativo != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nomedolanche = snapshotData['nomedolanche'] as String?;
    _descricao = snapshotData['descricao'] as String?;
    _categoria = snapshotData['categoria'] as String?;
    _valor = castToType<double>(snapshotData['valor']);
    _valorpromocional = castToType<double>(snapshotData['valorpromocional']);
    _foto = snapshotData['foto'] as String?;
    _ativo = snapshotData['ativo'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('lanches')
          : FirebaseFirestore.instance.collectionGroup('lanches');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('lanches').doc(id);

  static Stream<LanchesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LanchesRecord.fromSnapshot(s));

  static Future<LanchesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LanchesRecord.fromSnapshot(s));

  static LanchesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LanchesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LanchesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LanchesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LanchesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LanchesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLanchesRecordData({
  String? nomedolanche,
  String? descricao,
  String? categoria,
  double? valor,
  double? valorpromocional,
  String? foto,
  bool? ativo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nomedolanche': nomedolanche,
      'descricao': descricao,
      'categoria': categoria,
      'valor': valor,
      'valorpromocional': valorpromocional,
      'foto': foto,
      'ativo': ativo,
    }.withoutNulls,
  );

  return firestoreData;
}

class LanchesRecordDocumentEquality implements Equality<LanchesRecord> {
  const LanchesRecordDocumentEquality();

  @override
  bool equals(LanchesRecord? e1, LanchesRecord? e2) {
    return e1?.nomedolanche == e2?.nomedolanche &&
        e1?.descricao == e2?.descricao &&
        e1?.categoria == e2?.categoria &&
        e1?.valor == e2?.valor &&
        e1?.valorpromocional == e2?.valorpromocional &&
        e1?.foto == e2?.foto &&
        e1?.ativo == e2?.ativo;
  }

  @override
  int hash(LanchesRecord? e) => const ListEquality().hash([
        e?.nomedolanche,
        e?.descricao,
        e?.categoria,
        e?.valor,
        e?.valorpromocional,
        e?.foto,
        e?.ativo
      ]);

  @override
  bool isValidKey(Object? o) => o is LanchesRecord;
}
