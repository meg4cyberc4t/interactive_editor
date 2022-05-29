import 'package:flutter/material.dart';

Future<bool?> showDeleteDialog(
  BuildContext context,
) {
  return showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Are you sure?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(
            'Yes',
            style: TextStyle(
              color: Theme.of(context).errorColor,
            ),
          ),
        )
      ],
    ),
  );
}
