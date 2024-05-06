import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:kelechek/core/common/cubits/app_settings/app_settings_cubit.dart';
import 'package:kelechek/core/network/connection_checker.dart';
import 'package:kelechek/core/utils/hive_service.dart';
import 'package:kelechek/core/utils/shared_prefer_service.dart';
import 'package:kelechek/presentation/home_cart/cubit/home_cart_cubit.dart';
import 'package:kelechek/presentation/home_chat/cubit/home_chat_cubit.dart';
import 'package:kelechek/presentation/main_app/cubit/main_app_cubit.dart';
import 'package:kelechek/presentation/user_indentification/cubit/user_indentification_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupLocators() async {
  getIt
    ..registerSingletonAsync<SharedPreferService>(
      () async => SharedPreferService().init(),
    )
    ..registerSingletonAsync<HiveService>(
      () async => HiveService().init(),
    );
  await GetIt.instance.isReady<SharedPreferService>();
  await GetIt.instance.isReady<HiveService>();

  // Register services
  getIt

    // register settings cubit
    ..registerFactory<AppSettingsCubit>(
      AppSettingsCubit.new,
    )
    ..registerFactory<HomeCartCubit>(
      HomeCartCubit.new,
    )
    ..registerSingleton<InternetConnection>(InternetConnection())
    ..registerSingleton<ConnectionCheckerImpl>(
      ConnectionCheckerImpl(getIt.get<InternetConnection>()),
    )
    ..registerFactory(UserProfileCubit.new)
    ..registerFactory<MainAppCubit>(
      MainAppCubit.new,
    )
    ..registerFactory<HomeChatCubit>(
      HomeChatCubit.new,
    );
}
