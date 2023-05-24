// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:firebase_messaging/firebase_messaging.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i7;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../../ui/views/edit_profile_view/edit_profile_controller.dart' as _i12;
import '../../ui/views/forgot_password_view/forgot_password_controller.dart'
    as _i13;
import '../../ui/views/list_elections_view/list_elections_controller.dart'
    as _i14;
import '../../ui/views/login_view/login_controller.dart' as _i15;
import '../../ui/views/main_view/main_controller.dart' as _i16;
import '../../ui/views/profile_view/profile_controller.dart' as _i17;
import '../../ui/views/splash_view/splash_controller.dart' as _i18;
import '../repositories/auth_repository/auth_impl.dart' as _i11;
import '../repositories/user_repository/user_impl.dart' as _i9;
import '../repositories/votting_repository/votting_impl.dart' as _i10;
import 'di_config.dart' as _i19;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.factory<_i3.FirebaseAuth>(() => appModule.auth);
  gh.factory<_i4.FirebaseFirestore>(() => appModule.store);
  gh.factory<_i5.FirebaseMessaging>(() => appModule.messaging);
  gh.factory<_i6.GoogleSignIn>(() => appModule.sigIn);
  gh.lazySingleton<_i7.Logger>(() => appModule.logger);
  await gh.factoryAsync<_i8.SharedPreferences>(
    () => appModule.prefs,
    preResolve: true,
  );
  gh.factory<_i9.UserInterfaceImpl>(() => _i9.UserInterfaceImpl(
        gh<_i4.FirebaseFirestore>(),
        gh<_i7.Logger>(),
      ));
  gh.factory<_i10.VottingInterfaceImpl>(() => _i10.VottingInterfaceImpl(
        gh<_i4.FirebaseFirestore>(),
        gh<_i7.Logger>(),
      ));
  gh.factory<_i11.AuthInterfaceImpl>(() => _i11.AuthInterfaceImpl(
        gh<_i3.FirebaseAuth>(),
        gh<_i7.Logger>(),
        gh<_i6.GoogleSignIn>(),
        gh<_i5.FirebaseMessaging>(),
      ));
  gh.singleton<_i12.EditProfileController>(
      _i12.EditProfileController(gh<_i9.UserInterfaceImpl>()));
  gh.singleton<_i13.ForgotPasswordController>(
      _i13.ForgotPasswordController(gh<_i11.AuthInterfaceImpl>()));
  gh.singleton<_i14.ListElectionsController>(
      _i14.ListElectionsController(gh<_i10.VottingInterfaceImpl>()));
  gh.singleton<_i15.LoginController>(_i15.LoginController(
    gh<_i11.AuthInterfaceImpl>(),
    gh<_i9.UserInterfaceImpl>(),
  ));
  gh.singleton<_i16.MainController>(_i16.MainController(
    gh<_i9.UserInterfaceImpl>(),
    gh<_i3.FirebaseAuth>(),
  ));
  gh.singleton<_i17.ProfileController>(
      _i17.ProfileController(gh<_i11.AuthInterfaceImpl>()));
  gh.singleton<_i18.SplashController>(_i18.SplashController(
    gh<_i11.AuthInterfaceImpl>(),
    gh<_i9.UserInterfaceImpl>(),
  ));
  return getIt;
}

class _$AppModule extends _i19.AppModule {}
