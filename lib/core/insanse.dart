import 'package:fl3/featchera/login/data/repo.dart';
import 'package:fl3/featchera/login/data/repoimp.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setup()
{
  getIt.registerSingleton<Loginrep>(Loginimp());
}