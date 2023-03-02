import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:resep_masak/models/resep_detail_model.dart';
import 'package:resep_masak/models/resep_now_model.dart';
import 'package:resep_masak/services/api_service.dart';

part 'resep_search_event.dart';
part 'resep_search_state.dart';

class ResepSearchBloc extends Bloc<ResepSearchEvent, ResepSearchState> {
  ApiService apiService = ApiService();
  ResepSearchBloc() : super(ResepSearchInitial()) {
    on<GetResepSearchEvent>((event, emit) async {
      // TODO: implement event handler
      try {
        emit(ResepSearchLoading());
        final result = await endpointResepSearch(keySearch: event.keySearch);
        print(result.listResults.length);
        if (event.keySearch.isEmpty) {
          emit(ResepSearchInitial());
        } else {
          if (result.status) {
            emit(ResepSearchSuccess(result));
          } else {
            emit(ResepSearchError('Tidak Ada Data'));
          }
        }
      } catch (e) {
        emit(ResepSearchError(e.toString()));
      }
    });
  }

  Future<ResepNowModel> endpointResepSearch({required String keySearch}) async {
    final response = await apiService.get(url: 'search/?q=$keySearch');
    final results = resepNowModelFromJson(response);
    return results;
  }
}
