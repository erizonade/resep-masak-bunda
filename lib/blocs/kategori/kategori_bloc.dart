import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:resep_masak/models/kategori_model.dart';
import 'package:resep_masak/services/api_service.dart';

part 'kategori_event.dart';
part 'kategori_state.dart';

class KategoriBloc extends Bloc<KategoriEvent, KategoriState> {

  ApiService apiService = ApiService();

  KategoriBloc() : super(KategoriInitial()) {
    on<GetKategoriEvent>((event, emit) async{
      // TODO: implement event handler
      emit(KategoriLoading());
      try {
        final result = await _endpointKategori();
        print(result);
        if (result.status) {
          emit(KategoriSuccess(result));
        } else {
          emit(KategoriError('Tidak ada data'));
        }
      } catch (e) {
        emit(KategoriError(e.toString()));
      }

    });
  }

  Future<KategoriModel> _endpointKategori() async{
    final response = await apiService.get(url: 'category/recipes');

    final result = kategoriModelFromJson(response);
    return result;
  }



}
