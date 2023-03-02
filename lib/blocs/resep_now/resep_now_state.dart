part of 'resep_now_bloc.dart';

abstract class ResepNowState extends Equatable {
  const ResepNowState();

  @override
  List<Object> get props => [];
}

class ResepNowInitial extends ResepNowState {
  @override
  List<Object> get props => [];
}

class ResepNowLoading extends ResepNowState {
  @override
  List<Object> get props => [];
}

class ResepNowSuccess extends ResepNowState {
  // final List<ListResults> resepNowModel;
  ResepNowModel resepNowModel;
  ResepNowSuccess(this.resepNowModel);

  @override
  List<Object> get props => [];
}

class ResepNowNotSuccess extends ResepNowState {
  String message;
  ResepNowNotSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class ResepNowError extends ResepNowState {
  String message;
  ResepNowError(this.message);

  @override
  List<Object> get props => [message];
}
