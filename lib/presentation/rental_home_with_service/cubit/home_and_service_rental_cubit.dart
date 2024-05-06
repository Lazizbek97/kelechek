import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kelechek/presentation/rental_home_with_service/domain/models/rental_homes_and_service_list.dart';

import 'package:kelechek/presentation/rental_home_with_service/domain/repository/rental_home_and_service_repository.dart';
import 'package:kelechek/presentation/rental_home_with_service/utils/rental_home_and_service_fitler_payload.dart';

part 'home_and_service_rental_state.dart';

class HomeAndServiceRentalCubit extends Cubit<HomeAndServiceRentalState> {
  HomeAndServiceRentalCubit({
    required RentalHomeAndServiceRepository rentalHomeRepository,
  })  : _rentalHomeRepository = rentalHomeRepository,
        super(
          const HomeAndServiceRentalState(
            isLoading: false,
          ),
        );

  final RentalHomeAndServiceRepository _rentalHomeRepository;

  Future<void> fetchInitialData() async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    try {
      final response = await _rentalHomeRepository.getOfficePremesisList();
      emit(
        state.copyWith(
          isLoading: false,
          rentalHomeAndServiceMdList: response,
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

  Future<void> filter(RentalHomeServiceFilterPayload filterPayload) async {
    if (filterPayload == RentalHomeServiceFilterPayload.initial()) {
      await clearFilter();
      return;
    }
    var filteredList = await _rentalHomeRepository.getOfficePremesisList();

    // rental period filter
    if (filterPayload.rentalFrom != null && filterPayload.rentalTo != null) {
      filteredList = filteredList.where((element) {
        // check if this period insidee check in and check out period
        return filterPayload.rentalFrom!.isAfter(element.checkIn!) &&
            filterPayload.rentalTo!.isBefore(element.checkOut!);
      }).toList();
    }

    // check for floor
    if (filterPayload.floor != null) {
      filteredList = filteredList
          .where((element) => element.occupancy == filterPayload.floor)
          .toList();
    }

    // check for price
    if (filterPayload.priceFrom != null && filterPayload.priceTo != null) {
      filteredList = filteredList.where((element) {
        return element.price! >= (filterPayload.priceFrom ?? 0) &&
            element.price! <= (filterPayload.priceTo ?? element.price!);
      }).toList();
    }

    // check for size
    if (filterPayload.size != null) {
      filteredList = filteredList.where((element) {
        final intervalFrom = (element.roomSize ?? 0) - 3;
        final intervalTo = (element.roomSize ?? 0) + 3;

        return filterPayload.size! >= intervalFrom &&
            filterPayload.size! <= intervalTo;
      }).toList();
    }

    // check for amenities
    if (filterPayload.amenities != null &&
        filterPayload.amenities!.isNotEmpty) {
      filteredList = filteredList.where((element) {
        final amenities = element.amenities?.map((e) => e.id).toList();
        return filterPayload.amenities?.every((amenity) {
              return amenities?.contains(amenity) ?? false;
            }) ??
            false;
      }).toList();
    }
    
    // check for room level
    if (filterPayload.roomLevel != null) {
      filteredList = filteredList.where((element) {
        return element.roomLevel == filterPayload.roomLevel;
      }).toList();
    }

    emit(
      state.copyWith(
        filter: filterPayload,
        rentalHomeAndServiceMdList: filteredList,
      ),
    );
  }

  Future<void> clearFilter() async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    final premesises = await _rentalHomeRepository.getOfficePremesisList();

    emit(
      state.copyWith(
        isLoading: false,
        rentalHomeAndServiceMdList: premesises,
        filter: RentalHomeServiceFilterPayload.initial(),
      ),
    );
  }
}
