import 'package:flutter/material.dart';
import 'package:interactive_editor/interactive_editor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const TestPage(),
    );
  }
}

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late final InteractiveController controller = InteractiveController.empty();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('native_html_editor Test!'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('debugPrint'),
        onPressed: () {
          for (var item in controller.items) {
            debugPrint(item.toString());
          }
        },
      ),
      body: SingleChildScrollView(
        child: InteractiveEditorWidget(
          controller: controller,
          editorPadding: const EdgeInsets.all(4),
          itemPadding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 1,
            ),
          ),
          textItemDecoration: const TextItemDecoration(
            hintText: "Ваш ответ",
          ),
          deleteDialogDecoration: const DeleteDialogDecoration(
            title: "Точно удалить?",
            agreeLabel: "Да",
            disagreeLabel: "Нет",
          ),
          additional: OutlinedButton(
            child: const Icon(Icons.send),
            onPressed: () => debugPrint('Send message!'),
          ),
        ),
      ),
    );
  }
}
