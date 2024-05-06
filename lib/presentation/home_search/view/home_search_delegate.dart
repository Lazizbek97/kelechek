import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelechek/app/service_locators.dart';
import 'package:kelechek/core/common/widgets/app_back_button.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/constants/app_colors.dart';
import 'package:kelechek/core/constants/app_images.dart';
import 'package:kelechek/core/constants/app_text_style.dart';
import 'package:kelechek/l10n/l10n.dart';
import 'package:kelechek/presentation/home_search/domain/model/search_model.dart';
import 'package:kelechek/presentation/home_search/widgets/cst_search_delegate/cst_search_delegate.dart';
import 'package:kelechek/presentation/home_search/widgets/list_of_search_products.dart';
import 'package:kelechek/presentation/hunting_farm/domain/models/hunting_rental_list.dart';
import 'package:kelechek/presentation/kindergardens/domain/models/kindergarden_list_md.dart';
import 'package:kelechek/presentation/rent_office_premises/domain/model/office_premesis_md.dart';
import 'package:kelechek/presentation/rental_home/domain/models/rental_homes_list.dart';
import 'package:kelechek/presentation/rental_home/domain/repository/rental_home_repository.dart';
import 'package:kelechek/presentation/rental_home_with_service/domain/models/rental_homes_and_service_list.dart';

class HomeSearchDelegate extends CustomSearchDelegate<
    (Map<String, List<SearchModel>>, List<SearchModel>)> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Theme.of(context).copyWith(
      scaffoldBackgroundColor: AppColors.A7A7A7,
      inputDecorationTheme: theme.inputDecorationTheme.copyWith(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      appBarTheme: theme.appBarTheme.copyWith(
        titleSpacing: 0,
        backgroundColor: AppColors.A7A7A7,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [SizedBox(width: 16)];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return AppBackButton(
      color: AppColors.lightGray,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: _fetchData(query, context),
      builder: (c, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text('Error'),
          );
        }
        if (snapshot.data == null) {
          return const SizedBox();
        }
        if (snapshot.hasData) {
          if ((snapshot.data?.$2 ?? []).isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomImageView(
                    imagePath: AppImagePaths.search,
                  ),
                  SizedBox(height: 50),
                  Text(
                    context.l10n.unfortunately_nothing_found,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.s16.copyWith(
                      color: Color(0XFFC5C4C6),
                    ),
                  ),
                ],
              ),
            );
          }
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              ...(snapshot.data?.$1 ?? {}).entries.map(
                    (e) => e.value.isEmpty
                        ? SizedBox()
                        : ListOfSearchProducts(
                            data: e.value,
                            typeText: e.key,
                          ),
                  )
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}

Future<(Map<String, List<SearchModel>>, List<SearchModel>)?> _fetchData(
    String query, BuildContext context) async {
  RentalHomeRepository repository = getIt.get<RentalHomeRepository>();
  await Future.delayed(const Duration(milliseconds: 500));
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
            data: element,
            price: element.price,
          ),
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
            data: element,
            price: element.price,
          ),
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
            price: element.price,
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
            price: element.price,
            data: element,
          ),
        );
      }
    }

    Map<String, List<SearchModel>> grouped = _groupSearchResult(searchs, [
      context.l10n.kiyal,
      context.l10n.vityaz,
      context.l10n.vzmore,
      context.l10n.kindergarden,
      context.l10n.hunting_farm,
    ]);

    return (grouped, searchs);
  } catch (e) {
    return null;
  }
}

Map<String, List<SearchModel>> _groupSearchResult(
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
