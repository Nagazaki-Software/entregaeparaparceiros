// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:entregae_para_parceiros/backend/schema/pedido_record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:async';

AudioPlayer _player = AudioPlayer();
Timer? _stopTimer;

/// Toca som se algum item da lista 'pedido' dentro de PedidoRecord tiver data igual à data de hoje.
Future<void> playSoundIfSameDay(
    BuildContext context, PedidoRecord pedido) async {
  final List<dynamic>? listaPedidos = pedido.pedido;

  if (listaPedidos == null || listaPedidos.isEmpty) return;

  final DateTime agora = DateTime.now();

  bool temDataIgualHoje = listaPedidos.any((item) {
    if (item is Map<String, dynamic> && item['data'] is Timestamp) {
      final DateTime data = (item['data'] as Timestamp).toDate();
      return data.year == agora.year &&
          data.month == agora.month &&
          data.day == agora.day;
    }
    return false;
  });

  if (temDataIgualHoje) {
    if (_player.playing) return;

    await _player.setAsset('assets/sounds/alerta.mp3');
    await _player.play();

    _stopTimer?.cancel();
    _stopTimer = Timer(Duration(minutes: 2), () {
      _player.stop();
    });
  }
}
