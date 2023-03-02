import 'package:resep_masak/models/resep_now_model.dart';
import 'package:resep_masak/services/api_service.dart';

class ResepRespository {
  
  Future<ResepNowModel> getResepNow() async {
  // Future<ResepNowModel> getResepNow() async {
    /* url api */
    ApiService _apiService = ApiService();

    final response = await _apiService.get(url: 'recipes');
    final result = resepNowModelFromJson(response);
    return result;

  }
}