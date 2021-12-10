part of 'share_bloc.dart';

abstract class ShareState extends Equatable {
  final int? selectedFormat;
  final int? selectedProvider;

  @override
  List<int?> get props => <int?>[selectedProvider, selectedFormat];

  List<ColorsUrlProvider> get providersList => ShareRepository.providers;

  const ShareState({this.selectedProvider, this.selectedFormat});
}

class ShareFailure extends ShareState {
  const ShareFailure() : super();
}

class ShareEmptyInitial extends ShareState {
  const ShareEmptyInitial() : super();
}

class ShareSelectedInitial extends ShareState {
  final bool canSharePdf;
  final bool canSharePng;

  const ShareSelectedInitial({
    required this.canSharePdf,
    required this.canSharePng,
    int? providerIndex,
    int? formatIndex,
  }) : super(selectedProvider: providerIndex, selectedFormat: formatIndex);
}
