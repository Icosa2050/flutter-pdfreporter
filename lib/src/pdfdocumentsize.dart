import 'package:pdf/pdf.dart';

// enum of standard available paper sizes
enum DocumentPaperSize { a5, a4, a3, letter, legal }

/// Simple class to expose PDFPageFormat
class PDFDocumentSize {
  final DocumentPaperSize size;
  final bool landscape;
  final double width;
  final double height;

  /// Define the size of the paper to use when creating PDF Document pages
  /// Either use a pre-defined [size] OR specify the [width] and [height]
  /// [landscape] can also be set to  select either portrat(the default) or lanscape orientation
  PDFDocumentSize({this.size, this.landscape: false, this.width, this.height}) {
    if ((size == null) && (width == null || height == null)) {
      throw Exception(
          "Either a size MUST be specified or the width and height MUST be provided.");
    }
  }

  /// Return the correct PDFFormatPage info for the selected paper
  get paper {
    if (size == null) {
      return PdfPageFormat(width, height);
    }
    switch (size) {
      case DocumentPaperSize.a5:
        return (landscape) ? PdfPageFormat.a5.landscape : PdfPageFormat.a5;
      case DocumentPaperSize.a3:
        return (landscape) ? PdfPageFormat.a3.landscape : PdfPageFormat.a3;
      case DocumentPaperSize.letter:
        return (landscape)
            ? PdfPageFormat.letter.landscape
            : PdfPageFormat.letter;
      case DocumentPaperSize.legal:
        return (landscape)
            ? PdfPageFormat.legal.landscape
            : PdfPageFormat.legal;
      case DocumentPaperSize.a4:
        return (landscape) ? PdfPageFormat.a4.landscape : PdfPageFormat.a4;
    }
  }
}
