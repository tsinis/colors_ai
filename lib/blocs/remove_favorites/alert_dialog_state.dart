import 'package:equatable/equatable.dart';

abstract class AlertDialogState extends Equatable {
  const AlertDialogState();

  @override
  List<Object> get props => [];
}

class AlertDialogCloseInitial extends AlertDialogState {
  const AlertDialogCloseInitial();
}

class AlertDialogOpenInitial extends AlertDialogState {
  const AlertDialogOpenInitial();
}

class AlertDialogFailure extends AlertDialogState {
  const AlertDialogFailure();
}
