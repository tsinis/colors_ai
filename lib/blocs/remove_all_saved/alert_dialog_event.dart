import 'package:equatable/equatable.dart';

abstract class AlertDialogEvent extends Equatable {
  const AlertDialogEvent();

  @override
  List<Object> get props => [];
}

class AlertDialogShowed extends AlertDialogEvent {
  const AlertDialogShowed();
}

class AlertDialogHided extends AlertDialogEvent {
  const AlertDialogHided();
}
