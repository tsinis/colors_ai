part of '../url_providers.dart';

class CohesiveColors extends ColorsUrlProvider {
  const CohesiveColors() : super(baseUrl: 'javier.xyz/cohesive-colors/?src=', separateSymbol: ',');
  // https://javier.xyz/cohesive-colors/?src=555e7b,b7d968,b576ad,e04644,fde47f&overlay=FF9C00&intensity=0.3
}
