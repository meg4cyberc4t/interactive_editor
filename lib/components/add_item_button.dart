import 'package:flutter/material.dart';

class AddItemButtons extends StatelessWidget {
  const AddItemButtons({
    required this.addTextItemCallback,
    required this.addImageItemCallback,
    required this.addFileItemCallback,
    this.additional,
    Key? key,
  }) : super(key: key);
  final VoidCallback addTextItemCallback;
  final VoidCallback addImageItemCallback;
  final VoidCallback addFileItemCallback;
  final Widget? additional;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Wrap(
        runSpacing: 4,
        alignment: WrapAlignment.center,
        spacing: 4,
        children: [
          OutlinedButton(
            onPressed: addTextItemCallback,
            child: const Icon(Icons.text_increase_rounded),
          ),
          OutlinedButton(
            onPressed: addImageItemCallback,
            child: const Icon(Icons.photo_library_rounded),
          ),
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
