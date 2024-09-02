// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/api_manager.dart' as _i704;
import '../data/data_sources/auth_remote_data_source.dart' as _i1038;
import '../data/data_sources/auth_remote_data_source_impl.dart' as _i946;
import '../data/repositories/auth_repository_impl.dart' as _i74;
import '../domain/repositories/auth_repository.dart' as _i800;
import '../domain/use_cases/sign_in_use_case.dart' as _i1069;
import '../domain/use_cases/sign_up_use_case.dart' as _i857;
import '../features/auth/sign_in/sign_in_cubit/sign_in_cubit.dart' as _i1011;
import '../features/auth/sign_in/sign_in_screen.dart' as _i137;
import '../features/auth/sign_up/sign_up_cubit/sign_up_cubit.dart' as _i32;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i137.SignInScreen>(() => _i137.SignInScreen());
    gh.singleton<_i704.ApiManager>(() => _i704.ApiManager());
    gh.factory<_i1038.AuthRemoteDataSource>(() =>
        _i946.AuthRemoteDataSourceImpl(apiManager: gh<_i704.ApiManager>()));
    gh.factory<_i800.AuthRepository>(() => _i74.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i1038.AuthRemoteDataSource>()));
    gh.factory<_i857.SignUpUseCase>(() =>
        _i857.SignUpUseCase(signUpRepository: gh<_i800.AuthRepository>()));
    gh.factory<_i1069.SignInUseCase>(() =>
        _i1069.SignInUseCase(signInRepository: gh<_i800.AuthRepository>()));
    gh.factory<_i32.SignUpViewModel>(
        () => _i32.SignUpViewModel(signUpUseCase: gh<_i857.SignUpUseCase>()));
    gh.factory<_i1011.SignInViewModel>(() =>
        _i1011.SignInViewModel(signInUseCase: gh<_i1069.SignInUseCase>()));
    return this;
  }
}
