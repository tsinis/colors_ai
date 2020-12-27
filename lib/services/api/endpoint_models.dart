import 'dart:convert';
import 'constants.dart';

// ignore: avoid_classes_with_only_static_members
class Endpoint {
  static final List<int> model = utf8.encode(_model());
  static String _model({String type = defaultModelName}) => '{"model":"$type"}';
  static final Set<String> _models = {defaultModelName, uiModelName};
  static Set<String> get models => _models;
  static set models(Set<String> fetchedModels) => _models.addAll(fetchedModels);
}
