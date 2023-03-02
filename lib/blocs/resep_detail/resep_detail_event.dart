part of 'resep_detail_bloc.dart';

abstract class ResepDetailEvent extends Equatable {
  const ResepDetailEvent();

  @override
  List<Object> get props => [];
}

class GetResepDetailEvent extends ResepDetailEvent {
  final String keyResepDetail;

  GetResepDetailEvent({required this.keyResepDetail});
  
  @override
  List<Object> get props => [keyResepDetail];
}
