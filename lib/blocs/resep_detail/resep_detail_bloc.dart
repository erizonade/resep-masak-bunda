import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:resep_masak/models/resep_detail_model.dart';
import 'package:resep_masak/services/api_service.dart';

part 'resep_detail_event.dart';
part 'resep_detail_state.dart';

class ResepDetailBloc extends Bloc<ResepDetailEvent, ResepDetailState> {
  ApiService apiService = ApiService();
  ResepDetailBloc() : super(ResepDetailInitial()) {
    on<GetResepDetailEvent>((event, emit) async{
      // TODO: implement event handler
      emit(ResepDetailLoading()); 
      try {
        final result = await endpointResepDetail(keyResepDetail: event.keyResepDetail);
        if (result.status) {
          emit(ResepDetailSuccess(result));
        } else {
          emit(ResepDetailError('Tidak Ada Data'));
        }
      } catch (e) {
          emit(ResepDetailError(e.toString()));
      }
    });
  }

  Future<ResepDetailModel> endpointResepDetail(
    {required String keyResepDetail}
  ) async{
    final response = await apiService.get(url: 'recipe/$keyResepDetail');
    final results = resepDetailModelFromJson(response);
    return results;

  }

}
