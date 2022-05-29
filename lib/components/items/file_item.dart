import 'package:file_picker/file_picker.dart';
import 'package:interactive_editor/interactive_editor.dart';

class FileItem extends InteractiveItem {
  const FileItem({
    required this.file,
  });
  final PlatformFile file;
}
