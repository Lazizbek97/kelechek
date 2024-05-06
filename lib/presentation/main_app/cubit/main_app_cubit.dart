import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelechek/presentation/home/data/rental_option.dart';
import 'package:kelechek/presentation/home_cart/data/order/orders_model.dart';
import 'package:kelechek/presentation/main_app/cubit/main_app_state.dart';

class MainAppCubit extends Cubit<MainAppState> {
  MainAppCubit()
      : super(
          const MainAppState(index: 0),
        );

  void changeIndex(int index) {
    emit(
      state.copyWith(
        index: index,
      ),
    );
  }

  void setRentalOption(RentalOption rentalOption) {
    emit(
      state.copyWith(
        index: state.index,
        rentalOption: rentalOption,
      ),
    );
  }

  void setCurrentPage(String currentPage) {
    emit(
      state.copyWith(
        currentPage: currentPage,
      ),
    );
  }

  void setCurrentOrder(OrdersModel currentOrder) {
    emit(
      state.copyWith(
        currentOrder: currentOrder,
      ),
    );
  }

  void clear() {
    emit(
      const MainAppState(index: 0),
    );
  }
}
