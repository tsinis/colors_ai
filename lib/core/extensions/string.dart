extension StringExtension on String {
  String toBeginningOfSentenceCase() => '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
}
