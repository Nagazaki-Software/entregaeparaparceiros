import '/flutter_flow/flutter_flow_util.dart';
import 'centraldeajuda_widget.dart' show CentraldeajudaWidget;
import 'package:flutter/material.dart';

class CentraldeajudaModel extends FlutterFlowModel<CentraldeajudaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
