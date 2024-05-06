part of 'home_search_cubit.dart';

abstract class HomeSearchState {}

@freezed
class HomeSearchBuildable extends HomeSearchState with _$HomeSearchBuildable {
  const factory HomeSearchBuildable({
    @Default(false) bool loading,
    @Default(false) bool success,
    @Default(false) bool failure,
    @Default(false) bool isfocused,
    @Default([]) List<RentalHousesMd> officePremesisList,
    @Default([]) List<KindergardenMd> kindergarden,
    @Default([]) List<RentalHuntingMd> rentalhunting,
    @Default([]) List<KiyalListMd> kyal,
    @Default([]) List<SearchModel> data,
    @Default({}) Map<String, List<SearchModel>> groupedData,
  }) = _HomeSearchBuildable;
}
