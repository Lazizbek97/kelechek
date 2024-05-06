import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kelechek/core/network/connection_checker.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required ConnectionChecker connectionState,
  })  : _connectionChecker = connectionState,
        super(const HomeInitial()) {
    // _connectionChecker.onConnectivityChanged.listen((event) {
    //   if (event == InternetStatus.disconnected) {
    //     emit(const HomeNetworkError());
    //   } else {
    //     fetchData();
    //   }
    // });
  } 

  // ignore: unused_field
  final ConnectionChecker _connectionChecker;

  Future<void> fetchData() async {
    emit(const HomeLoading());
    // emit(const HomeLoaded([]));
    try {
      // ignore: inference_failure_on_instance_creation
      await Future.delayed(const Duration());
      // final data = await repository.getData();
      emit(const HomeLoaded(['data']));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
