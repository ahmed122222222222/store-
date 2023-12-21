

part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}

final class OrderLoad extends OrderState {}

final class Ordersucee extends OrderState {
  List<product>pro;
  Ordersucee({required this.pro});
}

final class Orderfailuer extends OrderState {
  String errmas;
  Orderfailuer({required this.errmas});
}