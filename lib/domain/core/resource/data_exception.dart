class DataError implements Exception {
  final String errorMessage;

  DataError({required this.errorMessage});

  @override
  String toString() => errorMessage;
}
