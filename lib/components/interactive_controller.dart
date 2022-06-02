import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:interactive_editor/interactive_editor.dart';
import 'package:meta/meta.dart';

class InteractiveController extends ChangeNotifier {
  InteractiveController({
    required List<InteractiveItem> items,
  }) : _items = items;

  factory InteractiveController.empty() => InteractiveController(items: []);

  @internal
  late InteractiveEditorWidgetState widgetState;

  List<InteractiveItem> _items;

  UnmodifiableListView<InteractiveItem> get items =>
      UnmodifiableListView(_items);

  void onReorder(oldIndex, newIndex) {
    if (oldIndex < newIndex) newIndex -= 1;
    _items.insert(newIndex, _items.removeAt(oldIndex));
    notifyListeners();
  }

  void add(InteractiveItem item) {
    _items.add(item);
    notifyListeners();
  }

  void insert(int index, InteractiveItem item) {
    _items.insert(index, item);
    notifyListeners();
  }

  void remove(InteractiveItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void removeAt(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  int get length => _items.length;

  operator [](int index) => _items[index];

  @override
  void dispose() {
    for (var element in _items) {
      element.dispose();
    }
    super.dispose();
  }

  Future<String> toCustomString({
    required Future<String> Function(TextItem item) textItemConvert,
    required Future<String> Function(ImageItem item) imageItemConvert,
    required Future<String> Function(FileItem item) fileItemConvert,
  }) async {
    String result = "";
    for (InteractiveItem item in items) {
      if (item is TextItem) {
        result += await textItemConvert(item);
      } else if (item is ImageItem) {
        result += await imageItemConvert(item);
      } else if (item is FileItem) {
        result += await fileItemConvert(item);
      }
    }
    return result;
  }
}
