part of 'home_cart_cubit.dart';

class HomeCartState extends Equatable {
  const HomeCartState({
    this.isLoading = false,
    this.orders = const [],
    this.errorMessage = '',
    this.orderStatus = OrderStatus.all,
  });
  final bool isLoading;
  final List<UserOrderModel> orders;
  final String errorMessage;
  final OrderStatus orderStatus;

  HomeCartState copyWith({
    bool? isLoading,
    List<UserOrderModel>? orders,
    String? errorMessage,
    OrderStatus? orderStatus,
  }) {
    return HomeCartState(
      isLoading: isLoading ?? this.isLoading,
      orders: orders ?? this.orders,
      errorMessage: errorMessage ?? this.errorMessage,
      orderStatus: orderStatus ?? this.orderStatus,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        orders,
        orderStatus,
        errorMessage,
      ];
}
