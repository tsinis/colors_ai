part of 'share_hydrated_bloc.dart';

abstract class ShareState extends Equatable {
  const ShareState({this.selectedProvider});
  final int? selectedProvider;

  List<ColorsUrlProvider> get providersList => ShareRepository.providers;

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
  const ShareSelectedInitial({int? providerIndex}) : super(selectedProvider: providerIndex);
}

class ShareCopySuccess extends ShareState {
  const ShareCopySuccess({int? providerIndex}) : super(selectedProvider: providerIndex);
}
