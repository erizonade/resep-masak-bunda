part of 'kategori_detail_bloc.dart';

abstract class KategoriDetailEvent extends Equatable {
  const KategoriDetailEvent();

  @override
  List<Object> get props => [];
}

class GetKategoriDetailByIdEvent extends KategoriDetailEvent {
  final String keyDetail;
  final String nameKey;
  GetKategoriDetailByIdEvent({required this.keyDetail, required this.nameKey});

  @override
  List<Object> get props => [keyDetail];
}
