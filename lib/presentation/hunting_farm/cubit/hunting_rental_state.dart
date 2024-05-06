part of 'hunting_rental_cubit.dart';

class HuntingRentalState extends Equatable {
  const HuntingRentalState({
    required this.isLoading,
    this.rentalHuntingMdList = const [],
    this.errorMassage = '',
    this.huntingFilterPayload,
  });

  final bool isLoading;
  final List<RentalHuntingMd> rentalHuntingMdList;
  final String errorMassage;
  final HuntingFilterPayload? huntingFilterPayload;

  HuntingRentalState copyWith({
    bool? isLoading,
    List<RentalHuntingMd>? rentalHuntingMdList,
    String? errorMassage,
    HuntingFilterPayload? huntingFilterPayload,
  }) {
    return HuntingRentalState(
      isLoading: isLoading ?? this.isLoading,
      rentalHuntingMdList: rentalHuntingMdList ?? this.rentalHuntingMdList,
      errorMassage: errorMassage ?? this.errorMassage,
      huntingFilterPayload: huntingFilterPayload ?? this.huntingFilterPayload,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        rentalHuntingMdList,
        errorMassage,
        huntingFilterPayload,
      ];
}
