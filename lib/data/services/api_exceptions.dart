class ApiException {
  final String errorText;
  final String? body;

  ApiException(
    this.errorText, {
    this.body,
  });
}
