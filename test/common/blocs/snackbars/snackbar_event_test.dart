import 'package:colors_ai/common/blocs/snackbars/snackbar_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class SnackbarEventTest extends SnackbarEvent {}

void main() {
  test('$SnackbarEvent props', () {
    final SnackbarEvent snackbarEvent = SnackbarEventTest();
    expect(snackbarEvent.props.isEmpty, true);
  });

  test('$FileCopiedSuccess props', () {
    const SnackbarEvent snackbarEvent = FileCopiedSuccess('pdf');
    expect(snackbarEvent.props, <String>['pdf']);
  });

  test('$ServerStatusCheckedSuccess props', () {
    final SnackbarEvent snackbarEvent = ServerStatusCheckedSuccess(DateTime(1970));
    expect(snackbarEvent.props, <DateTime>[DateTime(1970)]);
  });
}
