import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:kelechek/presentation/hunting_farm/domain/models/hunting_rental_list.dart';
import 'package:kelechek/presentation/hunting_farm/domain/repository/hunting_rental_repository.dart';
import 'package:kelechek/presentation/hunting_farm/utils/hunting_filter_payload.dart';

part 'hunting_rental_state.dart';

class HuntingRentalCubit extends Cubit<HuntingRentalState> {
  HuntingRentalCubit({
    required RentalHuntingRepository rentalHuntingRepository,
  })  : _rentalHuntingRepository = rentalHuntingRepository,
        super(
          const HuntingRentalState(
            isLoading: false,
          ),
        );

  final RentalHuntingRepository _rentalHuntingRepository;

  Future<void> fetchInitialData() async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    try {
     // final response = await _rentalHuntingRepository.getOfficePremesisList();
      final data = await _rentalHuntingRepository.getRentalHuntingData();
      print("<><><><><><><><><>successss-----------");
      emit(
        state.copyWith(
          isLoading: false,
          //rentalHuntingMdList: response,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMassage: e.toString(),
          isLoading: false,
        ),
      );
    }
  }

  // Future<void> filter(HuntingFilterPayload filterPayload) async {
  //   if (filterPayload == HuntingFilterPayload.initial()) {
  //     await clearFilter();
  //     return;
  //   }
  //   var filteredList = await _rentalHuntingRepository.getOfficePremesisList();

  //   // rental period filter
  //   if (filterPayload.rentalFrom != null && filterPayload.rentalTo != null) {
  //     filteredList = filteredList.where((element) {
  //       // check if this period insidee check in and check out period
  //       return filterPayload.rentalFrom!.isAfter(element.checkIn!) &&
  //           filterPayload.rentalTo!.isBefore(element.checkOut!);
  //     }).toList();
  //   }

  //   // check for price
  //   if (filterPayload.priceFrom != null || filterPayload.priceTo != null) {
  //     filteredList = filteredList.where((element) {
  //       log('price from ${filterPayload.priceFrom} price to ${filterPayload.priceTo}');
  //       return element.price! >= (filterPayload.priceFrom ?? 0) &&
  //           element.price! <= (filterPayload.priceTo ?? element.price!);
  //     }).toList();
  //   }

  //   // check for amenities
  //   if (filterPayload.amenities != null &&
  //       filterPayload.amenities!.isNotEmpty) {
  //     filteredList = filteredList.where((element) {
  //       final amenities = element.amenities?.map((e) => e.id).toList();
  //       return filterPayload.amenities?.every((amenity) {
  //             return amenities?.contains(amenity) ?? false;
  //           }) ??
  //           false;
  //     }).toList();
  //   }

  //   // check for nutritions
  //   if (filterPayload.nutritions != null &&
  //       filterPayload.nutritions!.isNotEmpty) {
  //     filteredList = filteredList.where((element) {
  //       return (element.nutritions ?? []).any((amenity) {
  //         return filterPayload.nutritions!.contains(amenity.id);
  //       });
  //     }).toList();
  //   }

  //   // check for tips
  //   if (filterPayload.tip != null && filterPayload.tip!.isNotEmpty) {
  //     filteredList = filteredList.where((element) {
  //       return (element.tips ?? []).any((amenity) {
  //         return filterPayload.tip!.contains(amenity.id);
  //       });
  //     }).toList();
  //   }

  //   emit(
  //     state.copyWith(
  //       huntingFilterPayload: filterPayload,
  //       rentalHuntingMdList: filteredList,
  //     ),
  //   );
  // }

  // Future<void> clearFilter() async {
  //   final premesises = await _rentalHuntingRepository.getOfficePremesisList();

  //   emit(
  //     state.copyWith(
  //       rentalHuntingMdList: premesises,
  //       huntingFilterPayload: HuntingFilterPayload.initial(),
  //     ),
  //   );
  // }
}
