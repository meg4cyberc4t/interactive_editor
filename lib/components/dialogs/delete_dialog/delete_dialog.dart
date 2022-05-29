import 'package:flutter/material.dart';
import 'package:interactive_editor/components/dialogs/delete_dialog/delete_dialog_decoration.dart';

Future<bool?> showDeleteDialog(
  BuildContext context,
  DeleteDialogDecoration decoration,
) {
  return showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(decoration.title),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(decoration.disagreeLabel),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(
            decoration.agreeLabel,
            style: TextStyle(
              color: Theme.of(context).errorColor,
            ),
          ),
        )
      ],
    ),
  );
}
