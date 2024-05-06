part of 'home_cubit.dart';

enum HomeStatus { initial, loading, loaded, error, empty, networkError }

@immutable
sealed class HomeState {
  const HomeState(this.status);
  final HomeStatus status;
}

final class HomeInitial extends HomeState {
  const HomeInitial() : super(HomeStatus.initial);
}

final class HomeLoading extends HomeState {
  const HomeLoading() : super(HomeStatus.loading);
}

final class HomeLoaded extends HomeState {
  const HomeLoaded(this.data) : super(HomeStatus.loaded);

  final List<String> data;
}

final class HomeError extends HomeState {
  const HomeError(this.message) : super(HomeStatus.error);

  final String message;
}

final class HomeEmpty extends HomeState {
  const HomeEmpty() : super(HomeStatus.empty);
}

final class HomeNetworkError extends HomeState {
  const HomeNetworkError() : super(HomeStatus.networkError);
}
