extension StringExtension on String {
  /// Convert a string to beginning of sentence case. In fact this just converts the first letter to uppercase.
  String toBeginningOfSentenceCase() => '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
}
