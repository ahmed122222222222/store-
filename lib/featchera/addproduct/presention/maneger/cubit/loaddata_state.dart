part of 'loaddata_cubit.dart';

@immutable
sealed class LoaddataState {}

final class LoaddataInitial extends LoaddataState {}
final class Loaddataloding extends LoaddataState {}
// ignore: must_be_immutable
final class Loaddatasucee extends LoaddataState {
 List<product>pro;
  Loaddatasucee({required this.pro});
}
// ignore: must_be_immutable
final class Loaddatafauiler extends LoaddataState {
  String errmas;
  Loaddatafauiler({required this.errmas});
}
