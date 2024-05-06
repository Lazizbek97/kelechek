import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kelechek/core/api_client/app_exceptions.dart';
import 'package:kelechek/core/network/connection_checker.dart';
import 'package:kelechek/presentation/home/data/rental_option.dart';
import 'package:kelechek/presentation/rent_office_premises/domain/model/products_list_model.dart';
import 'package:kelechek/presentation/rent_office_premises/domain/repository/office_premesis_repository.dart';
import 'package:kelechek/presentation/rent_office_premises/utils/office_filter_payload.dart';

part 'office_premises_home_state.dart';

class OfficePremisesHomeCubit extends Cubit<OfficePremisesHomeState> {
  OfficePremisesHomeCubit({
    required ConnectionChecker connectionChecker,
    required RentalOption rentalOption,
    required OfficePremesisRepository repository,
  })  : _connectionChecker = connectionChecker,
        _rentalOption = rentalOption,
        _repository = repository,
        super(
          const OfficePremisesHomeState(
            status: OfficeHomeStatus.initial,
          ),
        );

  @override
  Future<void> onChange(Change<OfficePremisesHomeState> change) async {
    super.onChange(change);
    // final hasConnection = await _connectionChecker.isConnected;
    // if (!hasConnection) {
    //   emit(
    //     const OfficePremisesHomeState(
    //       status: OfficeHomeStatus.error,
    //     ),
    //   );
    // }
  }

  // ignore: unused_field
  final ConnectionChecker _connectionChecker;
  final RentalOption _rentalOption;
  final OfficePremesisRepository _repository;

  RentalOption get rentalOption => _rentalOption;

  Future<void> load() async {
    emit(
      const OfficePremisesHomeState(status: OfficeHomeStatus.loading),
    );
    final response = await _repository.getOfficePremesisList();
    response.fold(
      (l) {
        log('error loading office premises ->>>> ${(l as ApiException).message}');
        emit(
          const OfficePremisesHomeState(
            status: OfficeHomeStatus.error,
          ),
        );
      },
      (r) {
        emit(
          OfficePremisesHomeState(
            status: OfficeHomeStatus.loaded,
            kiyalList: r,
          ),
        );
      },
    );
  }

  void changeTap(int index) {
    emit(
      OfficePremisesHomeState(
        status: OfficeHomeStatus.loaded,
        index: index,
      ),
    );
  }

  @override
  void emit(OfficePremisesHomeState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  // Future<void> filter(OfficeFilterPayload filterPayload) async {
  //   if (filterPayload == OfficeFilterPayload.initial()) {
  //     await clearFilter();
  //     return;
  //   }
  //   var filteredList = await _repository.getOfficePremesisList();

  //   // rental period filter
  //   if (filterPayload.rentalFrom != null && filterPayload.rentalTo != null) {
  //     filteredList = filteredList.where((element) {
  //       // check if this period insidee check in and check out period
  //       return filterPayload.rentalFrom!.isAfter(element.checkIn!) &&
  //           filterPayload.rentalTo!.isBefore(element.checkOut!);
  //     }).toList();
  //   }

  //   // check for floor
  //   if (filterPayload.floor != null) {
  //     filteredList = filteredList
  //         .where((element) => element.occupancy == filterPayload.floor)
  //         .toList();
  //   }

  //   // check for price
  //   if (filterPayload.priceFrom != null && filterPayload.priceTo != null) {
  //     filteredList = filteredList.where((element) {
  //       return element.price! >= (filterPayload.priceFrom ?? 0) &&
  //           element.price! <= (filterPayload.priceTo ?? element.price!);
  //     }).toList();
  //   }

  //   // check for size
  //   if (filterPayload.size != null) {
  //     filteredList = filteredList.where((element) {
  //       final intervalFrom = (element.roomSize ?? 0) - 3;
  //       final intervalTo = (element.roomSize ?? 0) + 3;

  //       return filterPayload.size! >= intervalFrom &&
  //           filterPayload.size! <= intervalTo;
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

  //   emit(
  //     state.copyWith(
  //       filterPayload: filterPayload,
  //       kiyalList: filteredList,
  //     ),
  //   );
  // }

  // Future<void> clearFilter() async {
  //   emit(
  //     state.copyWith(
  //       status: OfficeHomeStatus.loading,
  //       kiyalList: [],
  //     ),
  //   );
  //   final premesises = await _repository.getOfficePremesisList();
  //   log(premesises.toString());
  //   emit(
  //     state.copyWith(
  //       kiyalList: premesises,
  //       status: OfficeHomeStatus.loaded,
  //       filterPayload: OfficeFilterPayload.initial(),
  //     ),
  //   );
  // }
}
