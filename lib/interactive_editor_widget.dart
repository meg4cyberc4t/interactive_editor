import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:interactive_editor/components/add_item_button.dart';
import 'package:interactive_editor/components/dialogs/delete_dialog/delete_dialog.dart';
import 'package:interactive_editor/interactive_editor.dart';

class InteractiveEditorWidget extends StatefulWidget {
  const InteractiveEditorWidget({
    this.controller,
    this.fileItemDecoration,
    this.imageItemDecoration,
    this.textItemDecoration,
    this.editorPadding,
    this.itemPadding,
    this.decoration,
    this.insidePadding,
    this.deleteDialogDecoration = const DeleteDialogDecoration(),
    Key? key,
  }) : super(key: key);

  final InteractiveController? controller;
  final FileItemDecoration? fileItemDecoration;
  final ImageItemDecoration? imageItemDecoration;
  final TextItemDecoration? textItemDecoration;
  final DeleteDialogDecoration deleteDialogDecoration;
  final EdgeInsets? itemPadding;
  final EdgeInsets? editorPadding;
  final EdgeInsets? insidePadding;
  final Decoration? decoration;

  @override
  State<InteractiveEditorWidget> createState() =>
      InteractiveEditorWidgetState();
}

class InteractiveEditorWidgetState extends State<InteractiveEditorWidget> {
  late final InteractiveController controller;

  @override
  void initState() {
    controller = widget.controller ?? InteractiveController.empty();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int get itemCount => controller.length + 1;

  Widget itemBuilder(context, index) {
    InteractiveItem item = controller[index];
    if (item is TextItem) {
      return TextField(
        key: GlobalKey(),
        controller: item.controller,
        autofocus: true,
        focusNode: item.focusNode,
        minLines: 1,
        maxLines: null,
        style: widget.textItemDecoration?.textStyle,
        decoration: InputDecoration(
          hintText: widget.textItemDecoration?.hintText,
          suffixIcon: InkWell(
            child: const Icon(Icons.close),
            onTap: () {
              controller.removeAt(index);
              item.dispose();
            },
          ),
        ),
      );
    } else if (item is FileItem) {
      return ListTile(
        leading: widget.fileItemDecoration?.customIcon ??
            const Icon(Icons.file_present_rounded),
        onLongPress: widget.fileItemDecoration?.onLongPress ??
            () async {
              bool? res = await showDeleteDialog(
                  context, widget.deleteDialogDecoration);
              if (res == null || !res) return;
              controller.removeAt(index);
            },
        onTap: widget.fileItemDecoration?.onTap,
        title: Text(item.file.name),
      );
    } else if (item is ImageItem) {
      return InkWell(
        onLongPress: widget.fileItemDecoration?.onLongPress ??
            () async {
              bool? res = await showDeleteDialog(
                  context, widget.deleteDialogDecoration);
              if (res == null || !res) return;
              controller.removeAt(index);
            },
        onTap: widget.fileItemDecoration?.onTap,
        child: Image.file(
          File(
            item.image.path!,
          ),
          repeat: ImageRepeat.noRepeat,
          fit: BoxFit.contain,
          semanticLabel: item.image.name,
          alignment: Alignment.center,
        ),
      );
    }
    debugPrint("Not found item: $item");
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.editorPadding ?? EdgeInsets.zero,
      child: Container(
        width: double.infinity,
        decoration: widget.decoration,
        child: Padding(
          padding: widget.insidePadding ?? EdgeInsets.zero,
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, _) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ...List.generate(
                  controller.length,
                  (index) => Padding(
                    padding: widget.itemPadding ??
                        const EdgeInsets.symmetric(vertical: 4),
                    child: itemBuilder(context, index),
                  ),
                ),
                AddItemButtons(
                  addTextItemCallback: () {
                    TextItem textItem = TextItem.empty();
                    controller.add(textItem);
                    FocusScope.of(context).requestFocus(textItem.focusNode);
                  },
                  addImageItemCallback: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                      type: FileType.image,
                      allowMultiple: false,
                      dialogTitle: 'Выберите фото',
                      withData: true,
                    );
                    if (result == null || result.count == 0) return;
                    for (PlatformFile platformFile in result.files) {
                      controller.add(
                        ImageItem(
                          image: platformFile,
                        ),
                      );
                    }
                  },
                  addFileItemCallback: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                      type: FileType.any,
                      allowMultiple: false,
                      dialogTitle: 'Выберите документы',
                      withData: true,
                    );
                    if (result == null || result.count == 0) return;
                    for (PlatformFile platformFile in result.files) {
                      controller.add(
                        FileItem(
                          file: platformFile,
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
