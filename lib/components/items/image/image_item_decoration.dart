import 'package:flutter/material.dart';

class ImageItemDecoration {
  const ImageItemDecoration({
    this.onLongPress,
    this.onTap,
  });

  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
}
