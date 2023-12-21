part of 'loadpro_cubit.dart';

@immutable
sealed class LoadproState {}

final class LoadproInitial extends LoadproState {}
final class Loadproloading extends LoadproState {}
final class Loadprosucess extends LoadproState {
Stream<QuerySnapshot> querySnapshot;
  Loadprosucess({required this.querySnapshot});
}
final class Loadprofauiler extends LoadproState {
  final String errmass;
  Loadprofauiler({required this.errmass}); 
}
