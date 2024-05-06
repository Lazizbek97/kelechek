// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'office_premises_home_cubit.dart';

enum OfficeHomeStatus {
  initial,
  loading,
  loaded,
  error,
  networkError,
}

class OfficePremisesHomeState extends Equatable {
  const OfficePremisesHomeState({
    required this.status,
    this.index = 0,
    this.kiyalList  = const [],
    this.filterPayload,
  });
  final OfficeHomeStatus status;
  final int index;
  final List<ProductsListModel> kiyalList;
  final OfficeFilterPayload ?filterPayload;

  OfficePremisesHomeState copyWith({
    OfficeHomeStatus? status,
    int? index,
    List<ProductsListModel>? kiyalList,
    OfficeFilterPayload? filterPayload,
  }) {
    return OfficePremisesHomeState(
      status: status ?? this.status,
      index: index ?? this.index,
      kiyalList: kiyalList ?? this.kiyalList,
      filterPayload: filterPayload ?? this.filterPayload,
    );
  }

  @override
  List<Object?> get props => [
        status,
        index,
        kiyalList,
        filterPayload,
      ];
}
