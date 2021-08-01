enum FileFormat { pdfA4, pdfLetter, pngA4, pngLetter }

extension NameExtension on FileFormat {
  String get name {
    switch (this) {
      case FileFormat.pdfA4:
        return 'PDF A4';
      case FileFormat.pdfLetter:
        return 'PDF Letter';
      case FileFormat.pngA4:
        return 'PNG A4';
      case FileFormat.pngLetter:
        return 'PNG Letter';
      default:
        return 'Unknown';
    }
  }

  String get format => name.substring(0, 3);

  bool get isLetter => this == FileFormat.pdfLetter || this == FileFormat.pngLetter;
  bool get isA4 => this == FileFormat.pdfA4 || this == FileFormat.pngA4;
}
