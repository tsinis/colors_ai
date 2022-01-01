part of 'share_bloc.dart';

abstract class ShareState extends Equatable {
  final FileFormat? selectedFormat;
  final ColorsUrlProvider? selectedProvider;

  @override
  List<Object?> get props => <Object?>[selectedProvider, selectedFormat];

  List<ColorsUrlProvider> get providersList => UrlProvidersList.providers;

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
    ColorsUrlProvider? urlProvider,
    FileFormat? fileFormat,
  }) : super(selectedProvider: urlProvider, selectedFormat: fileFormat);
}
