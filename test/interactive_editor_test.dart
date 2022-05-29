import 'package:flutter_test/flutter_test.dart';
import 'package:interactive_editor/interactive_editor.dart';

void main() {
  group("Test for controller", () {
    final InteractiveController controller = InteractiveController.empty();
    test("Add elements", () {
      final item = TextItem.fromText("Hello");
      controller.add(item);
      assert(controller.items.contains(item));
    });

    test("Remove elements", () {
      controller.removeAt(0);
      assert(controller.items.isEmpty);
    });
  });
}
