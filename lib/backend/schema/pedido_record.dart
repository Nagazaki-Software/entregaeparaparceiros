import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PedidoRecord extends FirestoreRecord {
  PedidoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "idDoPedido" field.
  String? _idDoPedido;
  String get idDoPedido => _idDoPedido ?? '';
  bool hasIdDoPedido() => _idDoPedido != null;

  // "lanches" field.
  List<DocumentReference>? _lanches;
  List<DocumentReference> get lanches => _lanches ?? const [];
  bool hasLanches() => _lanches != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "referenceDaLoja" field.
  DocumentReference? _referenceDaLoja;
  DocumentReference? get referenceDaLoja => _referenceDaLoja;
  bool hasReferenceDaLoja() => _referenceDaLoja != null;

  // "dataDoPedido" field.
  DateTime? _dataDoPedido;
  DateTime? get dataDoPedido => _dataDoPedido;
  bool hasDataDoPedido() => _dataDoPedido != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "pedidosendopreparado" field.
  DateTime? _pedidosendopreparado;
  DateTime? get pedidosendopreparado => _pedidosendopreparado;
  bool hasPedidosendopreparado() => _pedidosendopreparado != null;

  // "pedidosaiuparaentrega" field.
  DateTime? _pedidosaiuparaentrega;
  DateTime? get pedidosaiuparaentrega => _pedidosaiuparaentrega;
  bool hasPedidosaiuparaentrega() => _pedidosaiuparaentrega != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _idDoPedido = snapshotData['idDoPedido'] as String?;
    _lanches = getDataList(snapshotData['lanches']);
    _user = snapshotData['user'] as DocumentReference?;
    _referenceDaLoja = snapshotData['referenceDaLoja'] as DocumentReference?;
    _dataDoPedido = snapshotData['dataDoPedido'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _pedidosendopreparado = snapshotData['pedidosendopreparado'] as DateTime?;
    _pedidosaiuparaentrega = snapshotData['pedidosaiuparaentrega'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('pedido')
          : FirebaseFirestore.instance.collectionGroup('pedido');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('pedido').doc(id);

  static Stream<PedidoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PedidoRecord.fromSnapshot(s));

  static Future<PedidoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PedidoRecord.fromSnapshot(s));

  static PedidoRecord fromSnapshot(DocumentSnapshot snapshot) => PedidoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PedidoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PedidoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PedidoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PedidoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPedidoRecordData({
  String? idDoPedido,
  DocumentReference? user,
  DocumentReference? referenceDaLoja,
  DateTime? dataDoPedido,
  String? status,
  DateTime? pedidosendopreparado,
  DateTime? pedidosaiuparaentrega,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'idDoPedido': idDoPedido,
      'user': user,
      'referenceDaLoja': referenceDaLoja,
      'dataDoPedido': dataDoPedido,
      'status': status,
      'pedidosendopreparado': pedidosendopreparado,
      'pedidosaiuparaentrega': pedidosaiuparaentrega,
    }.withoutNulls,
  );

  return firestoreData;
}

class PedidoRecordDocumentEquality implements Equality<PedidoRecord> {
  const PedidoRecordDocumentEquality();

  @override
  bool equals(PedidoRecord? e1, PedidoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.idDoPedido == e2?.idDoPedido &&
        listEquality.equals(e1?.lanches, e2?.lanches) &&
        e1?.user == e2?.user &&
        e1?.referenceDaLoja == e2?.referenceDaLoja &&
        e1?.dataDoPedido == e2?.dataDoPedido &&
        e1?.status == e2?.status &&
        e1?.pedidosendopreparado == e2?.pedidosendopreparado &&
        e1?.pedidosaiuparaentrega == e2?.pedidosaiuparaentrega;
  }

  @override
  int hash(PedidoRecord? e) => const ListEquality().hash([
        e?.idDoPedido,
        e?.lanches,
        e?.user,
        e?.referenceDaLoja,
        e?.dataDoPedido,
        e?.status,
        e?.pedidosendopreparado,
        e?.pedidosaiuparaentrega
      ]);

  @override
  bool isValidKey(Object? o) => o is PedidoRecord;
}
