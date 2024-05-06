import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kelechek/app/service_locators.dart';
import 'package:kelechek/core/common/cubits/app_settings/app_settings_cubit.dart';
import 'package:kelechek/core/theme/app_theme.dart';
import 'package:kelechek/di/injection.dart';
import 'package:kelechek/l10n/l10n.dart';
import 'package:kelechek/presentation/home/view/home_screen.dart';
import 'package:kelechek/presentation/rent_office_premises/cubit/cubit/calendar_cubit.dart';
import 'package:kelechek/presentation/home_cart/cubit/home_cart_cubit.dart';
import 'package:kelechek/presentation/home_chat/cubit/home_chat_cubit.dart';
import 'package:kelechek/presentation/main_app/cubit/main_app_cubit.dart';
import 'package:kelechek/presentation/user_indentification/cubit/user_indentification_cubit.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AppSettingsCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<UserProfileCubit>(),
        ),
        BlocProvider(
          create: (context) => locator<CalendarCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<HomeCartCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<MainAppCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<HomeChatCubit>(),
        ),
      ],
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final settings = context.select((AppSettingsCubit cubit) => cubit.state);
    return KeyboardDismisser(
      gestures: const [
        GestureType.onTap,
        GestureType.onPanUpdateDownDirection,
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        child: MaterialApp(
          theme: AppTheme.lightThemeMode,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: settings.locale,
          home: const HomeScreen(),
          // const SplashScreen(),
        ),
      ),
    );
  }
}
