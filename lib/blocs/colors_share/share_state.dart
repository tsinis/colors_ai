part of 'share_hydrated_bloc.dart';

abstract class ShareState extends Equatable {
  const ShareState({this.providersList = const [], this.selectedProvider});
  final int? selectedProvider;
  final List<ColorsUrlProvider> providersList;

  @override
  List<int?> get props => [selectedProvider];
}

class ShareFailure extends ShareState {
  const ShareFailure() : super();
}

class ShareEmptyInitial extends ShareState {
  const ShareEmptyInitial() : super();
}

class ShareSelectedInitial extends ShareState {
  const ShareSelectedInitial(this.providers, {int? providerIndex})
      : super(selectedProvider: providerIndex, providersList: providers);
  final List<ColorsUrlProvider> providers;
}

class ShareCopySuccess extends ShareState {
  const ShareCopySuccess(this.providers, {int? providerIndex})
      : super(selectedProvider: providerIndex, providersList: providers);
  final List<ColorsUrlProvider> providers;
}
