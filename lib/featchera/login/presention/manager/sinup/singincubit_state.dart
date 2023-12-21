part of 'singincubit_cubit.dart';

@immutable
sealed class SingincubitState {}

final class SingincubitInitial extends SingincubitState {}

final class Singincubitloading extends SingincubitState {}

final class Singincubitsucess extends SingincubitState {

}

// ignore: must_be_immutable
final class Singincubitfauiler extends SingincubitState {
  String errr;
  Singincubitfauiler({required this.errr});
  
}