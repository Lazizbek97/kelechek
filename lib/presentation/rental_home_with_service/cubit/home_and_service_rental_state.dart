part of 'home_and_service_rental_cubit.dart';

class HomeAndServiceRentalState extends Equatable {
  const HomeAndServiceRentalState({
    required this.isLoading,
    this.rentalHomeAndServiceMdList = const [],
    this.errorMassage = '',
    this.filter,
  });
  final bool isLoading;
  final List<RentalHomeAndServiceMd> rentalHomeAndServiceMdList ;
  final String errorMassage ;
  final RentalHomeServiceFilterPayload? filter;

  HomeAndServiceRentalState copyWith({
    bool? isLoading,
    List<RentalHomeAndServiceMd>? rentalHomeAndServiceMdList,
    String? errorMassage,
    RentalHomeServiceFilterPayload? filter,

  }) {
    return HomeAndServiceRentalState(
      isLoading: isLoading ?? this.isLoading,
      rentalHomeAndServiceMdList: rentalHomeAndServiceMdList ?? this.rentalHomeAndServiceMdList,
      errorMassage: errorMassage ?? this.errorMassage,
      filter: filter ?? this.filter,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        rentalHomeAndServiceMdList,
        errorMassage,
        filter,
      ];
}
