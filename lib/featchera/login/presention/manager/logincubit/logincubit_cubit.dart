import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repoimp.dart';

part 'logincubit_state.dart';

class LogincubitCubit extends Cubit<LogincubitState> {
  LogincubitCubit({ required this.loginrep}) : super(LogincubitInitial());
   Loginimp loginrep;
  Future <void> log(email ,pass) async {
    emit(Logincubitloding());
   try {
  await loginrep.login(email, pass);
  emit(Logincubitsucess());
} on Exception catch (e) {
 emit(Logincubitfauiler(errr: e.toString()));
}
  }
}
