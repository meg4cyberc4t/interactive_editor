class DeleteDialogDecoration {
  const DeleteDialogDecoration({
    this.agreeLabel = "Yes",
    this.disagreeLabel = "No",
    this.title = "Are you sure?",
  });
  final String title;
  final String agreeLabel;
  final String disagreeLabel;
}
