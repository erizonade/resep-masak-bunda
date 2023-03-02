import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:resep_masak/models/resep_now_model.dart';
import 'package:resep_masak/services/api_service.dart';

part 'kategori_detail_event.dart';
part 'kategori_detail_state.dart';

class KategoriDetailBloc extends Bloc<KategoriDetailEvent, KategoriDetailState> {
  ApiService apiService = ApiService();
  KategoriDetailBloc() : super(KategoriDetailInitial()) {
    on<GetKategoriDetailByIdEvent>((event, emit) async{
      // TODO: implement event handler
      emit(KategoriDetailLoading());
      try {
        final result = await endpointKategoriDetail(keyDetail: event.keyDetail);
        if (result.status) {
          emit(KategoriDetailSuccess(result));
        } else {
          emit(KategoriDetailError('Tidak ada data'));
        }
      } catch (e) {
        emit(KategoriDetailError(e.toString()));
      }
    });
  }

  Future<ResepNowModel> endpointKategoriDetail(
    {required String keyDetail}
  ) async{
    final response = await apiService.get(url: 'category/recipes/$keyDetail');
    final result = resepNowModelFromJson(response);
    return result;
  }
}
