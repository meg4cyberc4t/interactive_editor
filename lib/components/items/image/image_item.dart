import 'package:file_picker/file_picker.dart';
import 'package:interactive_editor/interactive_editor.dart';

class ImageItem extends InteractiveItem {
  const ImageItem({required this.image});

  final PlatformFile image;

  @override
  String toString() {
    return "ImageItem: ${image.name.toString()}";
  }
}
