class InteractiveEditorActive {
  const InteractiveEditorActive({
    this.documents = true,
    this.images = true,
    this.text = true,
  });

  final bool text;
  final bool images;
  final bool documents;
}
