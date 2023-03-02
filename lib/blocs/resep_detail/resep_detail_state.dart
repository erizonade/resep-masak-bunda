part of 'resep_detail_bloc.dart';

abstract class ResepDetailState extends Equatable {
  const ResepDetailState();
  
  @override
  List<Object> get props => [];
}

class ResepDetailInitial extends ResepDetailState {}

class ResepDetailLoading extends ResepDetailState {}

class ResepDetailSuccess extends ResepDetailState {
  ResepDetailModel resepDetailModel;
  ResepDetailSuccess(this.resepDetailModel);
  
  @override
  List<Object> get props => [];
}

class ResepDetailError extends ResepDetailState {
  String message;
  ResepDetailError(this.message);
  
  @override
  List<Object> get props => [];
}