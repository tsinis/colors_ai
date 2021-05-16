part of 'share_hydrated_bloc.dart';

abstract class ShareState extends Equatable {
  const ShareState({this.selectedProvider, this.isLetter});
  final int? selectedProvider;
  final bool? isLetter;

  List<ColorsUrlProvider> get providersList => ShareRepository.providers;

  @override
  List get props => <dynamic>[selectedProvider, isLetter];
}

class ShareFailure extends ShareState {
  const ShareFailure() : super();
}

class ShareEmptyInitial extends ShareState {
  const ShareEmptyInitial() : super();
}

class ShareSelectedInitial extends ShareState {
  const ShareSelectedInitial({int? providerIndex, bool? isLetter})
      : super(selectedProvider: providerIndex, isLetter: isLetter);
}
