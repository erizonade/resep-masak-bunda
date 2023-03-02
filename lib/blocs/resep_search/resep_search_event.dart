part of 'resep_search_bloc.dart';

abstract class ResepSearchEvent extends Equatable {
  const ResepSearchEvent();

  @override
  List<Object> get props => [];
}

class GetResepSearchEvent extends ResepSearchEvent {
  final String keySearch;

  GetResepSearchEvent({required this.keySearch});
  
  @override
  List<Object> get props => [keySearch];
}
