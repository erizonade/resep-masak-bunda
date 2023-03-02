part of 'kategori_detail_bloc.dart';

abstract class KategoriDetailState extends Equatable {
  const KategoriDetailState();
  
  @override
  List<Object> get props => [];
}

class KategoriDetailInitial extends KategoriDetailState {}

class KategoriDetailLoading extends KategoriDetailState {

  @override
  List<Object> get props => [];
}

class KategoriDetailSuccess extends KategoriDetailState {
  ResepNowModel resepNowModel;
  KategoriDetailSuccess(this.resepNowModel);

  @override
  List<Object> get props => [];
}

class KategoriDetailError extends KategoriDetailState {
  String message;
  KategoriDetailError(this.message);
  
  @override
  List<Object> get props => [];
}
