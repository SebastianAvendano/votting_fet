import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final injector = GetIt.instance;

class UserPreferences {
  static SharedPreferences get _preferences =>
      injector.get<SharedPreferences>();

  static bool get theme => _preferences.getBool('theme') ?? false;
  static set theme(bool theme) => _preferences.getBool('theme');
}
