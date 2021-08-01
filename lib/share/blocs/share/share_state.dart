part of 'share_hydrated_bloc.dart';

abstract class ShareState extends Equatable {
  const ShareState({this.selectedProvider, this.selectedFormat});
  final int? selectedProvider, selectedFormat;

  List<ColorsUrlProvider> get providersList => ShareRepository.providers;

  @override
  List get props => <dynamic>[selectedProvider, selectedFormat];
}

class ShareFailure extends ShareState {
  const ShareFailure() : super();
}

class ShareEmptyInitial extends ShareState {
  const ShareEmptyInitial() : super();
}

class ShareSelectedInitial extends ShareState {
  const ShareSelectedInitial({
    required this.canSharePdf,
    required this.canSharePng,
    int? providerIndex,
    int? formatIndex,
  }) : super(selectedProvider: providerIndex, selectedFormat: formatIndex);
  final bool canSharePdf, canSharePng;
}
