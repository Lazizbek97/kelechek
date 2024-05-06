import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:kelechek/presentation/kindergardens/domain/models/kindergarden_list_md.dart';
import 'package:kelechek/presentation/kindergardens/domain/repository/kindergarden_repository.dart';

import 'package:kelechek/presentation/kindergardens/utils/kindergarder_filter_options.dart';

part 'kindergarden_state.dart';

class KindergardenCubit extends Cubit<KindergardenState> {
  KindergardenCubit({
    required KindergardenRepository kindergardenRepository,
  })  : _kindergardenRepository = kindergardenRepository,
        super(
          const KindergardenState(
            isLoading: false,
          ),
        );

  final KindergardenRepository _kindergardenRepository;

  Future<void> fetchInitialData(
    KindergardenFilterOption filter,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
        filter1: filter,
      ),
    );
    try {
      final response = await _kindergardenRepository.getOfficePremesisList();
      emit(
        state.copyWith(
          isLoading: false,
          kindergardenMdList: response,
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

  Future<void> filter(
    KindergardenFilterOption filter, {
    required bool remove,
    bool isYearFilter = true,
  }) async {
    var yearfilter = state.filter1;
    var seasonFilter = state.filter2;
    if (isYearFilter) {
      yearfilter = filter;
    } else {
      seasonFilter = filter;
    }

    final response = await _kindergardenRepository.getOfficePremesisList();

    if (filter.id == 'all') {
      seasonFilter = null;
    }

    var filteredList = yearfilter?.id == 'all'
        ? response
        : response.where((element) {
            return (element.groups?.keys ?? [])
                .any((element) => element == yearfilter?.id);
          }).toList();

    log(filteredList.length.toString());

    filteredList = seasonFilter == null
        ? filteredList
        : filteredList.where((element) {
            return (element.seasonFilters ?? [])
                .any((element) => element == seasonFilter?.id);
          }).toList();

    emit(
      state.copyWith(
        kindergardenMdList: filteredList,
        filter1: yearfilter,
        filter2: seasonFilter,
      ),
    );
  }

  Future<void> clearFilter() async {
    final response = await _kindergardenRepository.getOfficePremesisList();
    emit(
      state.copyWith(
        kindergardenMdList: response,
      ),
    );
  }
}
