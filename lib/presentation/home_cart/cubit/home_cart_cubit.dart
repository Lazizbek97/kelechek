import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kelechek/app/service_locators.dart';
import 'package:kelechek/core/utils/hive_service.dart';
import 'package:kelechek/presentation/home_cart/utils/orders_helpers.dart';
import 'package:kelechek/presentation/rent_office_premises/domain/model/user_order_model.dart';
import 'package:kelechek/presentation/rent_office_premises/domain/repository/office_premesis_repository.dart';

part 'home_cart_state.dart';

class HomeCartCubit extends Cubit<HomeCartState> {
  HomeCartCubit() : super(const HomeCartState()) {
    getOrders();
  }

  OfficePremesisRepository officePremesisRepository =
      OfficePremesisRepository();
  final hiveSerice = getIt.get<HiveService>();

  Future<void> getOrders() async {
    emit(state.copyWith(isLoading: true));
    final response = await officePremesisRepository.getAllOrders();
   response.fold(
      (l) {
        emit(state.copyWith(isLoading: false));
      },
      (r) {
        emit(state.copyWith(isLoading: false, orders: r));
      },
    );
  }

  void clear() {
    emit(
      state.copyWith(
        orders: [],
      ),
    );
  }

  void selectOrderStatus(OrderStatus orderStatus) {
    emit(
      state.copyWith(
        orderStatus: orderStatus,
      ),
    );
  }
}
