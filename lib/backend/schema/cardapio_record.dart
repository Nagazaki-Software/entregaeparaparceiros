import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CardapioRecord extends FirestoreRecord {
  CardapioRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nomedacategoria" field.
  String? _nomedacategoria;
  String get nomedacategoria => _nomedacategoria ?? '';
  bool hasNomedacategoria() => _nomedacategoria != null;

  // "lanches" field.
  List<LanchesStruct>? _lanches;
  List<LanchesStruct> get lanches => _lanches ?? const [];
  bool hasLanches() => _lanches != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nomedacategoria = snapshotData['nomedacategoria'] as String?;
    _lanches = getStructList(
      snapshotData['lanches'],
      LanchesStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('cardapio')
          : FirebaseFirestore.instance.collectionGroup('cardapio');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('cardapio').doc(id);

  static Stream<CardapioRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CardapioRecord.fromSnapshot(s));

  static Future<CardapioRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CardapioRecord.fromSnapshot(s));

  static CardapioRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CardapioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CardapioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CardapioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CardapioRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CardapioRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCardapioRecordData({
  String? nomedacategoria,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nomedacategoria': nomedacategoria,
    }.withoutNulls,
  );

  return firestoreData;
}

class CardapioRecordDocumentEquality implements Equality<CardapioRecord> {
  const CardapioRecordDocumentEquality();

  @override
  bool equals(CardapioRecord? e1, CardapioRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nomedacategoria == e2?.nomedacategoria &&
        listEquality.equals(e1?.lanches, e2?.lanches);
  }

  @override
  int hash(CardapioRecord? e) =>
      const ListEquality().hash([e?.nomedacategoria, e?.lanches]);

  @override
  bool isValidKey(Object? o) => o is CardapioRecord;
}
