part of '../logincubit/logincubit_cubit.dart';

@immutable
sealed class LogincubitState {}

final class LogincubitInitial extends LogincubitState {}
final class Logincubitloding extends LogincubitState {}
final class Logincubitsucess extends LogincubitState {

}

// ignore: must_be_immutable
final class Logincubitfauiler extends LogincubitState {
  String errr;
  Logincubitfauiler({required this.errr});
  
}