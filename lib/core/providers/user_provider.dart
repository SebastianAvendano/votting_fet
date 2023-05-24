import 'package:votting/core/providers/disposable_provider.dart';
import 'package:votting/data/models/user/user_model.dart';

class UserProvider extends DisposableProvider {
  UserModel _user = const UserModel();

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  @override
  void disposeValues() {
    _user = const UserModel();
  }
}
