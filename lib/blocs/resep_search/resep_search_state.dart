part of 'resep_search_bloc.dart';

abstract class ResepSearchState extends Equatable {
  const ResepSearchState();
  
  @override
  List<Object> get props => [];
}

class ResepSearchInitial extends ResepSearchState {}

class ResepSearchLoading extends ResepSearchState {}

class ResepSearchSuccess extends ResepSearchState {
  ResepNowModel resepNowModel;
  ResepSearchSuccess(this.resepNowModel);
  
  @override
  List<Object> get props => [];
}

class ResepSearchError extends ResepSearchState {
  String message;
  ResepSearchError(this.message);
  
  @override
  List<Object> get props => [];
}