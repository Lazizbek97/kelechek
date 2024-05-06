import 'package:equatable/equatable.dart';
import 'package:kelechek/presentation/home/data/rental_option.dart';
import 'package:kelechek/presentation/home_cart/data/order/orders_model.dart';

class MainAppState extends Equatable {
  const MainAppState({
    required this.index,
    this.rentalOption,
    this.currentPage ='',
    this.currentOrder,
  });
  final int index;
  final RentalOption? rentalOption;
  final String currentPage;
  final OrdersModel? currentOrder;

  MainAppState copyWith({
    int? index,
    RentalOption? rentalOption,
    String? currentPage,
    OrdersModel? currentOrder
  }) {
    return MainAppState(
      index: index ?? this.index,
      rentalOption: rentalOption ?? this.rentalOption,
      currentPage: currentPage ?? this.currentPage,
      currentOrder: currentOrder ?? this.currentOrder,
    );
  }

  @override
  List<Object?> get props => [
        index,
        rentalOption,
        currentPage,
        currentOrder,
      ];
}
