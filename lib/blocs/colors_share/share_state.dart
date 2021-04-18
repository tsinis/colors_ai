part of 'share_bloc.dart';

abstract class ShareState extends Equatable {
  const ShareState({this.selectedProvider = 0});
  final int selectedProvider;

  @override
  List<Object> get props => [selectedProvider];
}

class ShareFailure extends ShareState {
  const ShareFailure() : super();
}

class ShareCurrentInitial extends ShareState {
  const ShareCurrentInitial(int _selectedProvider, {required this.providersList})
      : super(selectedProvider: _selectedProvider);
  final List<ColorsUrlProvider> providersList;
}

class ShareCopySuccess extends ShareState {
  const ShareCopySuccess() : super();
}
