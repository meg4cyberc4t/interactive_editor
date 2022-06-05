import 'package:flutter/material.dart';
import 'package:interactive_editor/interactive_editor_active.dart';

class AddItemButtons extends StatelessWidget {
  const AddItemButtons({
    required this.addTextItemCallback,
    required this.addImageItemCallback,
    required this.addFileItemCallback,
    required this.active,
    this.additional,
    Key? key,
  }) : super(key: key);
  final VoidCallback addTextItemCallback;
  final VoidCallback addImageItemCallback;
  final VoidCallback addFileItemCallback;
  final Widget? additional;
  final InteractiveEditorActive active;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Wrap(
        runSpacing: 4,
        alignment: WrapAlignment.center,
        spacing: 4,
        children: [
          if (active.text)
            OutlinedButton(
              onPressed: addTextItemCallback,
              child: const Icon(Icons.text_increase_rounded),
            ),
          if (active.images)
            OutlinedButton(
              onPressed: addImageItemCallback,
              child: const Icon(Icons.photo_library_rounded),
            ),
          if (active.documents)
            OutlinedButton(
              onPressed: addFileItemCallback,
              child: const Icon(Icons.file_present_rounded),
            ),
          additional ?? const SizedBox(),
        ],
      ),
    );
  }
}
