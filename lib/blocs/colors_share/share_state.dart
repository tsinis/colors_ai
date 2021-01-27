part of 'share_bloc.dart';

abstract class ShareState extends Equatable {
  const ShareState(this.selectedProvider);
  final int selectedProvider;
  @override
  List<Object> get props => [selectedProvider];
}

class ShareFailure extends ShareState {
  const ShareFailure() : super(0);
}

class ShareCurrentInitial extends ShareState {
  const ShareCurrentInitial(this._selectedProvider, {required this.providersList}) : super(_selectedProvider);

  // ignore: unused_field
  final int _selectedProvider;
  final List<ColorsUrlProvider> providersList;
}
