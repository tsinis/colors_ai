import 'package:colors_ai/common/blocs/snackbars/snackbar_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('$UrlCopySuccess constructor', () {
    const UrlCopySuccess snackbarState = UrlCopySuccess('url');
    expect(snackbarState.url, 'url');
  });

  test('$FileCopySuccess constructor', () {
    const FileCopySuccess snackbarState = FileCopySuccess('pdf');
    expect(snackbarState.format, 'pdf');
  });

  test('$ColorCopySuccess constructor', () {
    const ColorCopySuccess snackbarState = ColorCopySuccess('hex');
    expect(snackbarState.hex, 'hex');
  });
}
