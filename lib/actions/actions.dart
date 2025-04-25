import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

Future tocarPedido(BuildContext context) async {
  PedidoRecord? pedidos;

  pedidos = await queryPedidoRecordOnce(
    parent: currentUserDocument?.lojaReference,
    singleRecord: true,
  ).then((s) => s.firstOrNull);
  await actions.playSoundIfSameDay(
    context,
    pedidos!,
  );
}
