import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LojaRecord extends FirestoreRecord {
  LojaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nomedaloja" field.
  String? _nomedaloja;
  String get nomedaloja => _nomedaloja ?? '';
  bool hasNomedaloja() => _nomedaloja != null;

  // "iddaloja" field.
  String? _iddaloja;
  String get iddaloja => _iddaloja ?? '';
  bool hasIddaloja() => _iddaloja != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "endereco" field.
  String? _endereco;
  String get endereco => _endereco ?? '';
  bool hasEndereco() => _endereco != null;

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "cidade" field.
  String? _cidade;
  String get cidade => _cidade ?? '';
  bool hasCidade() => _cidade != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "cep" field.
  String? _cep;
  String get cep => _cep ?? '';
  bool hasCep() => _cep != null;

  // "telefone" field.
  String? _telefone;
  String get telefone => _telefone ?? '';
  bool hasTelefone() => _telefone != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  bool hasFoto() => _foto != null;

  // "recebendopedidos" field.
  bool? _recebendopedidos;
  bool get recebendopedidos => _recebendopedidos ?? false;
  bool hasRecebendopedidos() => _recebendopedidos != null;

  // "lanches" field.
  List<CardapioStruct>? _lanches;
  List<CardapioStruct> get lanches => _lanches ?? const [];
  bool hasLanches() => _lanches != null;

  // "taxadeentrega" field.
  double? _taxadeentrega;
  double get taxadeentrega => _taxadeentrega ?? 0.0;
  bool hasTaxadeentrega() => _taxadeentrega != null;

  // "tempodepreparo" field.
  String? _tempodepreparo;
  String get tempodepreparo => _tempodepreparo ?? '';
  bool hasTempodepreparo() => _tempodepreparo != null;

  void _initializeFields() {
    _nomedaloja = snapshotData['nomedaloja'] as String?;
    _iddaloja = snapshotData['iddaloja'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _endereco = snapshotData['endereco'] as String?;
    _categoria = snapshotData['categoria'] as String?;
    _cidade = snapshotData['cidade'] as String?;
    _estado = snapshotData['estado'] as String?;
    _cep = snapshotData['cep'] as String?;
    _telefone = snapshotData['telefone'] as String?;
    _descricao = snapshotData['descricao'] as String?;
    _email = snapshotData['email'] as String?;
    _foto = snapshotData['foto'] as String?;
    _recebendopedidos = snapshotData['recebendopedidos'] as bool?;
    _lanches = getStructList(
      snapshotData['lanches'],
      CardapioStruct.fromMap,
    );
    _taxadeentrega = castToType<double>(snapshotData['taxadeentrega']);
    _tempodepreparo = snapshotData['tempodepreparo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('loja');

  static Stream<LojaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LojaRecord.fromSnapshot(s));

  static Future<LojaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LojaRecord.fromSnapshot(s));

  static LojaRecord fromSnapshot(DocumentSnapshot snapshot) => LojaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LojaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LojaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LojaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LojaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLojaRecordData({
  String? nomedaloja,
  String? iddaloja,
  LatLng? location,
  String? endereco,
  String? categoria,
  String? cidade,
  String? estado,
  String? cep,
  String? telefone,
  String? descricao,
  String? email,
  String? foto,
  bool? recebendopedidos,
  double? taxadeentrega,
  String? tempodepreparo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nomedaloja': nomedaloja,
      'iddaloja': iddaloja,
      'location': location,
      'endereco': endereco,
      'categoria': categoria,
      'cidade': cidade,
      'estado': estado,
      'cep': cep,
      'telefone': telefone,
      'descricao': descricao,
      'email': email,
      'foto': foto,
      'recebendopedidos': recebendopedidos,
      'taxadeentrega': taxadeentrega,
      'tempodepreparo': tempodepreparo,
    }.withoutNulls,
  );

  return firestoreData;
}

class LojaRecordDocumentEquality implements Equality<LojaRecord> {
  const LojaRecordDocumentEquality();

  @override
  bool equals(LojaRecord? e1, LojaRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nomedaloja == e2?.nomedaloja &&
        e1?.iddaloja == e2?.iddaloja &&
        e1?.location == e2?.location &&
        e1?.endereco == e2?.endereco &&
        e1?.categoria == e2?.categoria &&
        e1?.cidade == e2?.cidade &&
        e1?.estado == e2?.estado &&
        e1?.cep == e2?.cep &&
        e1?.telefone == e2?.telefone &&
        e1?.descricao == e2?.descricao &&
        e1?.email == e2?.email &&
        e1?.foto == e2?.foto &&
        e1?.recebendopedidos == e2?.recebendopedidos &&
        listEquality.equals(e1?.lanches, e2?.lanches) &&
        e1?.taxadeentrega == e2?.taxadeentrega &&
        e1?.tempodepreparo == e2?.tempodepreparo;
  }

  @override
  int hash(LojaRecord? e) => const ListEquality().hash([
        e?.nomedaloja,
        e?.iddaloja,
        e?.location,
        e?.endereco,
        e?.categoria,
        e?.cidade,
        e?.estado,
        e?.cep,
        e?.telefone,
        e?.descricao,
        e?.email,
        e?.foto,
        e?.recebendopedidos,
        e?.lanches,
        e?.taxadeentrega,
        e?.tempodepreparo
      ]);

  @override
  bool isValidKey(Object? o) => o is LojaRecord;
}
