part of 'resep_now_bloc.dart';

abstract class ResepNowEvent extends Equatable {
  const ResepNowEvent();
}


class GetResepNowEvent extends ResepNowEvent {
  @override
  List<Object> get props => [];
}
