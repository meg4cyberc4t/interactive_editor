import 'package:flutter/material.dart';
import 'package:interactive_editor/interactive_editor.dart';

class TextItem extends InteractiveItem {
  factory TextItem.empty() => TextItem(
        controller: TextEditingController(text: ""),
        focusNode: FocusNode(),
      );

  factory TextItem.fromText(String value) => TextItem(
        controller: TextEditingController(text: value),
        focusNode: FocusNode(),
      );

  TextItem({
    required this.controller,
    required this.focusNode,
  });

  TextEditingController controller;
  FocusNode focusNode;

  @override
  String toString() {
    return "TextItem: ${controller.text.toString()}";
  }

  @override
  dispose() {
    controller.dispose();
    focusNode.dispose();
    return super.dispose();
  }
}
