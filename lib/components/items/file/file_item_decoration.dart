import 'package:flutter/material.dart';

class FileItemDecoration {
  const FileItemDecoration({
    this.customIcon,
    this.onTap,
    this.onLongPress,
  });
  final Widget? customIcon;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
}
