part of 'home_rental_cubit.dart';

class HomeRentalState extends Equatable {
  const HomeRentalState({
    required this.isLoading,
    this.rentalHousesMdList = const [],
    this.errorMassage = '',
     this.filter,
  });
  final bool isLoading;
  final List<RentalHousesMd> rentalHousesMdList;
  final String errorMassage;
  final RentalHomeFilterPayload? filter;

  HomeRentalState copyWith({
    bool? isLoading,
    List<RentalHousesMd>? rentalHousesMdList,
    String? errorMassage,
    RentalHomeFilterPayload? filter,
  }) {
    return HomeRentalState(
      isLoading: isLoading ?? this.isLoading,
      rentalHousesMdList: rentalHousesMdList ?? this.rentalHousesMdList,
      errorMassage: errorMassage ?? this.errorMassage,
      filter: filter ?? this.filter,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        rentalHousesMdList,
        errorMassage,
        filter,
      ];
}
