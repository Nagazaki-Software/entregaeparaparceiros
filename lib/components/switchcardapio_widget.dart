import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'switchcardapio_model.dart';
export 'switchcardapio_model.dart';

class SwitchcardapioWidget extends StatefulWidget {
  const SwitchcardapioWidget({
    super.key,
    required this.lanches,
  });

  final DocumentReference? lanches;

  @override
  State<SwitchcardapioWidget> createState() => _SwitchcardapioWidgetState();
}

class _SwitchcardapioWidgetState extends State<SwitchcardapioWidget> {
  late SwitchcardapioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwitchcardapioModel());

    _model.switchValue = true;
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _model.switchValue!,
      onChanged: (newValue) async {
        safeSetState(() => _model.switchValue = newValue);
        if (newValue) {
          await widget.lanches!.update(createLanchesRecordData(
            ativo: false,
          ));
        } else {
          await widget.lanches!.update(createLanchesRecordData(
            ativo: true,
          ));
        }
      },
      activeColor: FlutterFlowTheme.of(context).secondaryBackground,
      activeTrackColor: FlutterFlowTheme.of(context).primary,
      inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
      inactiveThumbColor: FlutterFlowTheme.of(context).secondaryBackground,
    );
  }
}
