// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:js' as js;
import 'dart:typed_data';

Future<bool> shareWebPng(Uint8List bytes, {String? filename}) async {
  final html.Blob pngFile = html.Blob(<Uint8List>[bytes], 'application/png');
  final String pngUrl = html.Url.createObjectUrl(pngFile);
  final html.HtmlDocument doc = js.context['document'] as html.HtmlDocument;
  final html.AnchorElement link = html.AnchorElement(href: pngUrl);
  if (filename != null) {
    link.download = filename;
  } else {
    link.target = '_blank';
  }
  doc.body?.append(link);
  link
    ..click()
    ..remove();

  return true;
}
