import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "cnpj" field.
  String? _cnpj;
  String get cnpj => _cnpj ?? '';
  bool hasCnpj() => _cnpj != null;

  // "lojistanaplataforma" field.
  bool? _lojistanaplataforma;
  bool get lojistanaplataforma => _lojistanaplataforma ?? false;
  bool hasLojistanaplataforma() => _lojistanaplataforma != null;

  // "lojaReference" field.
  DocumentReference? _lojaReference;
  DocumentReference? get lojaReference => _lojaReference;
  bool hasLojaReference() => _lojaReference != null;

  // "stripeAccountId" field.
  String? _stripeAccountId;
  String get stripeAccountId => _stripeAccountId ?? '';
  bool hasStripeAccountId() => _stripeAccountId != null;

  // "stripeAccountType" field.
  String? _stripeAccountType;
  String get stripeAccountType => _stripeAccountType ?? '';
  bool hasStripeAccountType() => _stripeAccountType != null;

  // "stripeBankAccountId" field.
  String? _stripeBankAccountId;
  String get stripeBankAccountId => _stripeBankAccountId ?? '';
  bool hasStripeBankAccountId() => _stripeBankAccountId != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _cnpj = snapshotData['cnpj'] as String?;
    _lojistanaplataforma = snapshotData['lojistanaplataforma'] as bool?;
    _lojaReference = snapshotData['lojaReference'] as DocumentReference?;
    _stripeAccountId = snapshotData['stripeAccountId'] as String?;
    _stripeAccountType = snapshotData['stripeAccountType'] as String?;
    _stripeBankAccountId = snapshotData['stripeBankAccountId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? cnpj,
  bool? lojistanaplataforma,
  DocumentReference? lojaReference,
  String? stripeAccountId,
  String? stripeAccountType,
  String? stripeBankAccountId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'cnpj': cnpj,
      'lojistanaplataforma': lojistanaplataforma,
      'lojaReference': lojaReference,
      'stripeAccountId': stripeAccountId,
      'stripeAccountType': stripeAccountType,
      'stripeBankAccountId': stripeBankAccountId,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.cnpj == e2?.cnpj &&
        e1?.lojistanaplataforma == e2?.lojistanaplataforma &&
        e1?.lojaReference == e2?.lojaReference &&
        e1?.stripeAccountId == e2?.stripeAccountId &&
        e1?.stripeAccountType == e2?.stripeAccountType &&
        e1?.stripeBankAccountId == e2?.stripeBankAccountId;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.cnpj,
        e?.lojistanaplataforma,
        e?.lojaReference,
        e?.stripeAccountId,
        e?.stripeAccountType,
        e?.stripeBankAccountId
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
