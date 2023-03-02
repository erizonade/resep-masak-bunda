part of 'kategori_bloc.dart';

abstract class KategoriState extends Equatable {
  const KategoriState();
  
  @override
  List<Object> get props => [];
}

class KategoriInitial extends KategoriState {}

class KategoriLoading extends KategoriState {

  @override
  List<Object> get props => [];
}

class KategoriSuccess extends KategoriState {
  KategoriModel kategoriModel;
  KategoriSuccess(this.kategoriModel);

  @override
  List<Object> get props => [];
}

class KategoriError extends KategoriState {
  String message;
  KategoriError(this.message);
  
  @override
  List<Object> get props => [];
}
