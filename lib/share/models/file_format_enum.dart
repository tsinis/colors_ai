enum FileFormat { pdfA4, pdfLetter, pngA4, pngLetter, svg }

extension NameExtension on FileFormat {
  String get name {
    switch (this) {
      case FileFormat.pdfA4:
        return 'PDF (A4)';
      case FileFormat.pdfLetter:
        return 'PDF (Letter)';
      case FileFormat.pngA4:
        return 'PNG (A4)';
      case FileFormat.pngLetter:
        return 'PNG (Letter)';
      case FileFormat.svg:
        return 'SVG';
      default:
        return 'JSON';
    }
  }

  String get format => (name.length <= 3) ? name : name.substring(0, 4).trim();

  bool get isLetter => this == FileFormat.pdfLetter || this == FileFormat.pngLetter;
  bool get isA4 => this == FileFormat.pdfA4 || this == FileFormat.pngA4;
}