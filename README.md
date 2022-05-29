# native_html_editor
 
#### The main purpose of this editor is more flexible work for the user with text, image, etc. I use it in the project to replace the html editor (there are a lot of problems with WebView). You can use it as you like. If there is not enough functionality or there are ideas: Issues for you!
 
### Photo:
 
<div>
 <img height="700px" src="https://user-images.githubusercontent.com/66907532/170890913-b90d64e2-13a9-4dab-aaad-a7ddc59fcc30.png"/>
 <img height="700px" src="https://user-images.githubusercontent.com/66907532/170890916-22ffcf39-fbc4-4e91-8420-1d444dc6b905.png"/>
</div>
<img src="https://user-images.githubusercontent.com/66907532/170890918-05cba0d5-2f3a-4e7f-a523-8eeaba8d5224.png" />


### Example:

```dart
body: SingleChildScrollView(
        child: InteractiveEditorWidget(
          controller: controller,
          textItemDecoration: const TextItemDecoration(
            hintText: "Ваш ответ",
          ),
          deleteDialogDecoration: const DeleteDialogDecoration(
            title: "Точно удалить?",
            agreeLabel: "Да",
            disagreeLabel: "Нет",
          ),
        ),
      ),
```

### Installing:
```yaml
interactive_editor:
    git:
     url: https://github.com/meg4cyberc4t/interactive_editor
     ref: main
```
