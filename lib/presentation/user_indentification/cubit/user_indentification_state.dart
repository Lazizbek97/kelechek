part of 'user_indentification_cubit.dart';

class UserIndentificationState extends Equatable {
  const UserIndentificationState({
     this.user,
     this.orders,
     this.isUserVerified,
     this.error,
     this.isLoading,
     this.image,
     this.currentOrder,
     this.totalPrice,
     this.paymentMethod,
  });

  final UserMoodel? user;
  final List<OrdersModel>? orders;
  final bool ?isUserVerified;
  final String? error;
  final bool? isLoading;
  final List<String>? image;
  final OrdersModel? currentOrder;
  final num? totalPrice;
  final String ?paymentMethod;

  UserIndentificationState copyWith({
    UserMoodel? user,
    List<OrdersModel>? orders,
    bool? isUserVerified,
    String? error,
    bool? isLoading,
    List<String>? image,
    OrdersModel? currentOrder,
    num? totalPrice,
    String? paymentMethod,
  }) {
    return UserIndentificationState(
      user: user ?? this.user,
      orders: orders ?? this.orders,
      isUserVerified: isUserVerified ?? this.isUserVerified,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      image: image ?? this.image,
      currentOrder: currentOrder ?? this.currentOrder,
      totalPrice: totalPrice ?? this.totalPrice,
      paymentMethod: paymentMethod ?? this.paymentMethod,
    );
  }

  @override
  List<Object?> get props => [
        user,
        orders,
        isUserVerified,
        error ?? '',
        isLoading,
        image,
        currentOrder,
        totalPrice,
        paymentMethod,
      ];
}
