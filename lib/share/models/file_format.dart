enum FileFormat { pdfA4, pdfLetter, pngA4, pngLetter, svg, json, scss }

extension NameExtension on FileFormat {
  String get title {
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
      case FileFormat.scss:
      case FileFormat.json:
        return name.toUpperCase();
    }
  }

  String get format => (title.length <= 3) ? title : title.substring(0, 4).trim();

  bool get isLetter => this == FileFormat.pdfLetter || this == FileFormat.pngLetter;
  bool get isA4 => this == FileFormat.pdfA4 || this == FileFormat.pngA4;

  bool get isPrintable => isA4 || isLetter;
}
