import '../services/api/api.dart';

class DataRepository {
  static const API _apiServices = API();
  final List<List<int>> _colorsList = [];

  List<List<int>> get colorsList => _colorsList;

  Future<List<List<int>>> get getAllColors => _apiServices.postRequest.then((jsonColors) => _colorsList
    ..clear()
    ..addAll(jsonColors));
}
