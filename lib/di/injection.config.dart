// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import '../presentation/home_search/cubit/home_search_cubit.dart' as _i6;
import '../presentation/rent_office_premises/cubit/cubit/calendar_cubit.dart'
    as _i4;
import '../presentation/rental_home/domain/repository/rental_home_repository.dart'
    as _i5;
import 'data_module.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dataModule = _$DataModule();
    await gh.factoryAsync<_i3.SharedPreferences>(
      () => dataModule.prefs,
      preResolve: true,
    );
    gh.factory<_i4.CalendarCubit>(() => _i4.CalendarCubit());
    gh.factory<_i5.RentalHomeRepository>(() => _i5.RentalHomeRepository());
    gh.factory<_i6.HomeSearchCubit>(
        () => _i6.HomeSearchCubit(gh<_i5.RentalHomeRepository>()));
    return this;
  }
}

class _$DataModule extends _i7.DataModule {}
