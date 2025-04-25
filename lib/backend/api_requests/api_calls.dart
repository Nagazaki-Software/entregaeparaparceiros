import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start bancodedados Group Code

class BancodedadosGroup {
  static String getBaseUrl() =>
      'https://southamerica-east1-entregaeparaparceiros-1it8zd.cloudfunctions.net/';
  static Map<String, String> headers = {};
  static UpdateKycDocumentsCall updateKycDocumentsCall =
      UpdateKycDocumentsCall();
}

class UpdateKycDocumentsCall {
  Future<ApiCallResponse> call({
    String? accountId = '',
    String? fileId = '',
  }) async {
    final baseUrl = BancodedadosGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'updateKycDocuments',
      apiUrl: '${baseUrl}updateKycDocuments',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'accountId': accountId,
        'fileId': fileId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End bancodedados Group Code

class GetIPCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getIP',
      apiUrl: 'https://api.country.is/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? ip(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.ip''',
      ));
}

class CreateAccountStripeCall {
  static Future<ApiCallResponse> call({
    String? uid = '',
    String? email = '',
    String? firstName = '',
    String? lastName = '',
    int? dobDay,
    int? dobMonth,
    int? dobYear,
    String? addressLine1 = '',
    String? addressCity = '',
    String? addressState = '',
    String? ip = '',
    String? phone = '',
    String? addressPostalCode = '',
    String? cpf = '',
    String? documentoPDF = '',
    int? bankAccountNumber,
    String? bankAccountHolderName = '',
    String? bankCountry = '',
    String? bankCurrency = '',
    String? bankRoutingNumber = '',
    String? bankAccountHolderType = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'createAccountStripe',
      apiUrl:
          'https://southamerica-east1-entregaeparaparceiros-1it8zd.cloudfunctions.net/createAccountStripeCustom',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'uid': uid,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'dobDay': dobDay,
        'dobMonth': dobMonth,
        'dobYear': dobYear,
        'addressLine1': addressLine1,
        'addressCity': addressCity,
        'addressState': addressState,
        'ip': ip,
        'phone': phone,
        'addressPostalCode': addressPostalCode,
        'cpf': cpf,
        'productDescription': "entregaê para parceiros",
        'documentoPDF': documentoPDF,
        'bankAccountNumber': bankAccountNumber,
        'bankAccountHolderName': bankAccountHolderName,
        'bankAccountHolderType': bankAccountHolderType,
        'bankCountry': bankCountry,
        'bankCurrency': bankCurrency,
        'bankRoutingNumber': bankRoutingNumber,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
