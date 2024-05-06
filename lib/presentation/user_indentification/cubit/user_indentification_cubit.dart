import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kelechek/app/service_locators.dart';
import 'package:kelechek/core/utils/hive_service.dart';
import 'package:kelechek/presentation/home_cart/data/order/orders_model.dart';
import 'package:kelechek/presentation/user_indentification/data/user_data/user_model.dart';

part 'user_indentification_state.dart';

class UserProfileCubit extends Cubit<UserIndentificationState> {
  UserProfileCubit() : super(const UserIndentificationState()) {
    loadUser();
  }
  final locator = getIt.get<HiveService>();
  UserMoodel? get user => locator.getUser;
  List<OrdersModel> get orders => locator.orders;

  Future<void> loadUser() async {
    emit(
      state.copyWith(
        user: user,
        orders: orders,
        isUserVerified: user != null,
      ),
    );
  }

  Future<void> addUser(UserMoodel userMoodel) async {
    await locator.addUser(userMoodel);
    emit(
      state.copyWith(
        user: userMoodel,
        isUserVerified: true,
      ),
    );
  }

  Future<void> addOrder(OrdersModel order) async {
    await locator.addOrder(order);
    emit(
      state.copyWith(
        orders: orders,
      ),
    );
  }

  Future<void> removeOrder(OrdersModel order) async {
    final newOrders = orders.where((element) => element != order).toList();
    await locator.addOrder(order);
    emit(
      state.copyWith(
        orders: newOrders,
      ),
    );
  }

  void clear() {
    emit(
      const UserIndentificationState(),
    );
  }
}
