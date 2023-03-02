import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:resep_masak/models/resep_now_model.dart';
import 'package:resep_masak/repository/resep_repository.dart';

part 'resep_now_event.dart';
part 'resep_now_state.dart';

class ResepNowBloc extends Bloc<ResepNowEvent, ResepNowState> {
  ResepRespository resepRespository;
  ResepNowBloc(this.resepRespository) : super(ResepNowLoading()) {
    on<GetResepNowEvent>((event, emit) async{
      emit(ResepNowLoading());
      try {
        final resepNow = await resepRespository.getResepNow();
        if (resepNow.status) {
          emit(ResepNowSuccess(resepNow));
        } else{
          emit(ResepNowNotSuccess('Tidak ada data'));
        }
      } catch (e) {
        print(e.toString());
        emit(ResepNowError(e.toString()));
      }
    });

    // void getResepNow() async {
    //    emit(ResepNowLoading());
    //   try {
    //     final resepNow = await resepRespository.getResepNow();
    //     if (resepNow.status) {
    //       emit(ResepNowSuccess(resepNow));
    //     } else{
    //       emit(ResepNowNotSuccess('Tidak ada data'));
    //     }
    //   } catch (e) {
    //     emit(ResepNowError(e.toString()));
    //   }
    // }
    
  }
}
