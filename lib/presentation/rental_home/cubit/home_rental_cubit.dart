import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kelechek/presentation/rental_home/domain/models/rental_homes_list.dart';
import 'package:kelechek/presentation/rental_home/domain/repository/rental_home_repository.dart';
import 'package:kelechek/presentation/rental_home/rental_home_filter_payload.dart';

part 'home_rental_state.dart';

class HomeRentalCubit extends Cubit<HomeRentalState> {
  HomeRentalCubit({
    required RentalHomeRepository rentalHomeRepository,
  })  : _rentalHomeRepository = rentalHomeRepository,
        super(
          const HomeRentalState(
            isLoading: false,
          ),
        );

  final RentalHomeRepository _rentalHomeRepository;

  Future<void> fetchInitialData() async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    try {
      final response = await _rentalHomeRepository.getRentalHomesList();
      emit(
        state.copyWith(
          isLoading: false,
          rentalHousesMdList: response,
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

  Future<void> filter(RentalHomeFilterPayload filterPayload) async {
    if (filterPayload == RentalHomeFilterPayload.initial()) {
      await clearFilter();
      return;
    }
    var filteredList = await _rentalHomeRepository.getRentalHomesList();

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
    // check for nutritions
    if (filterPayload.nutritions != null &&
        filterPayload.nutritions!.isNotEmpty) {
      filteredList = filteredList.where((element) {
        return (element.nutritions ?? []).any((amenity) {
          return filterPayload.nutritions!.contains(amenity.id);
        });
      }).toList();
    }
    emit(
      state.copyWith(
        filter: filterPayload,
        rentalHousesMdList: filteredList,
      ),
    );
  }

  Future<void> clearFilter() async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    final premesises = await _rentalHomeRepository.getRentalHomesList();

    emit(
      state.copyWith(
        isLoading: false,
        rentalHousesMdList: premesises,
        filter: RentalHomeFilterPayload.initial(),
      ),
    );
  }
}
