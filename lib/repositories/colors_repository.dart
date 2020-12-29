import '../models/colors/colors_json.dart';
import '../services/api/api.dart';

class ColorsRepository {
  const ColorsRepository();
  static const API _apiServices = API();

  Future<ColorsAI> get getAllNewColors async => await _apiServices.postRequest;
}
