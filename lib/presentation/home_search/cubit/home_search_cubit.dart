import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kelechek/l10n/l10n.dart';
import 'package:kelechek/presentation/home_search/domain/model/search_model.dart';
import 'package:kelechek/presentation/rental_home_with_service/domain/models/rental_homes_and_service_list.dart';

import '../../hunting_farm/domain/models/hunting_rental_list.dart';
import '../../kindergardens/domain/models/kindergarden_list_md.dart';
import '../../rent_office_premises/domain/model/office_premesis_md.dart';
import '../../rental_home/domain/models/rental_homes_list.dart';
import '../../rental_home/domain/repository/rental_home_repository.dart';
import '../../widgets/buildable_cubit.dart';

part 'home_search_state.dart';
part 'home_search_cubit.freezed.dart';

@Injectable()
class HomeSearchCubit
    extends BuildableCubit<HomeSearchState, HomeSearchBuildable> {
  final RentalHomeRepository repository;
  HomeSearchCubit(this.repository) : super(const HomeSearchBuildable());

  Future<(Map<String, List<SearchModel>>, List<SearchModel>)?> fetchData(
      String query, BuildContext context) async {
    print('fetchData');
    build((buildable) =>
        buildable.copyWith(loading: true, failure: false, success: false));
    try {
      List<SearchModel> searchs = [];
      final List<KiyalListMd> officePremesisList =
          await repository.getrentalKyalList();

      for (var element in officePremesisList) {
        if (element.name!.toLowerCase().contains(query.toLowerCase())) {
          searchs.add(
            SearchModel(
              element.description ?? "",
              context.l10n.kiyal,
              element.images!.isNotEmpty ? element.images!.first : "",
              element.name,
              'kiyal',
              data: element,
            ),
          );
        }
      }

      final List<RentalHomeAndServiceMd> homeservices =
          await repository.getrentalHomeServices();

      for (var element in homeservices) {
        if (element.name!.toLowerCase().contains(query.toLowerCase())) {
          searchs.add(
            SearchModel(
                element.description ?? "",
                context.l10n.vityaz,
                element.images!.isNotEmpty ? element.images!.first : "",
                element.name,
                'vityaz',
                data: element),
          );
        }
      }

      final List<RentalHousesMd> rentalHomes =
          await repository.getRentalHomesList();

      for (var element in rentalHomes) {
        if (element.name!.toLowerCase().contains(query.toLowerCase())) {
          searchs.add(
            SearchModel(
                element.description ?? "",
                context.l10n.vzmore,
                element.images!.isNotEmpty ? element.images!.first : "",
                element.name,
                'vzmore',
                data: element),
          );
        }
      }

      final List<KindergardenMd> kindergarden =
          await repository.getkindergardenList();

      for (var element in kindergarden) {
        if (element.name!.toLowerCase().contains(query.toLowerCase())) {
          searchs.add(
            SearchModel(
              element.description ?? "",
              context.l10n.kindergarden,
              element.images!.isNotEmpty ? element.images!.first : "",
              element.name,
              'kindergarden',
              data: element,
            ),
          );
        }
      }
      final List<RentalHuntingMd> rentalhunting =
          await repository.getrentalHuntingList();
      for (var element in rentalhunting) {
        if (element.name!.toLowerCase().contains(query.toLowerCase())) {
          searchs.add(
            SearchModel(
              element.description ?? "",
              context.l10n.hunting_farm,
              element.images!.isNotEmpty ? element.images!.first : "",
              element.name,
              'hunting_farm',
              data: element,
            ),
          );
        }
      }

      Map<String, List<SearchModel>> grouped = groupSearchResult(searchs, [
        context.l10n.kiyal,
        context.l10n.vityaz,
        context.l10n.vzmore,
        context.l10n.kindergarden,
        context.l10n.hunting_farm,
      ]);

      build(
        (buildable) => buildable.copyWith(
          loading: false,
          success: true,
          // officePremesisList: officePremesisList,
          kindergarden: kindergarden,
          rentalhunting: rentalhunting,
          // kyal: kyal,
          groupedData: grouped,
          data: searchs,
        ),
      );
      return (grouped, searchs);
    } catch (e) {
      build(
        (buildable) => buildable.copyWith(loading: false, failure: true),
      );
      return null;
    }
  }

  chooseFocus(bool focusNode) {
    build(
      (buildable) => buildable.copyWith(isfocused: focusNode),
    );
  }

  Map<String, List<SearchModel>> groupSearchResult(
      List<SearchModel> searches, List<String> keys) {
    Map<String, List<SearchModel>> groupedData = {};
    for (var key in keys) {
      List<SearchModel> searchs = [];
      for (var element in searches) {
        if (element.id == key) {
          searchs.add(element);
        }
      }
      groupedData[key] = searchs;
    }
    return groupedData;
  }
}
