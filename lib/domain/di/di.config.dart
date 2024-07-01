// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repos/auth_repo_impl.dart' as _i9;
import '../../data/repos/home_repo/data_sources/home_online_ds_impl.dart'
    as _i7;
import '../../data/repos/home_repo/home_repo_impl.dart' as _i11;
import '../../presentation/view_model/auth_view_models/login_view_model.dart'
    as _i17;
import '../../presentation/view_model/auth_view_models/register_view_model.dart'
    as _i14;
import '../../presentation/view_model/get_all_categories_view_model.dart'
    as _i18;
import '../../presentation/view_model/get_all_products_view_model.dart' as _i19;
import '../../utils/networking/api_factory.dart' as _i4;
import '../../utils/networking/dio_factory.dart' as _i5;
import '../repos/auth_repo.dart' as _i8;
import '../repos/home_repo/data_sources/home_online_ds.dart' as _i6;
import '../repos/home_repo/home_repo.dart' as _i10;
import '../use_cases/auth_use_cases/login_use_case.dart' as _i12;
import '../use_cases/auth_use_cases/register_use_case.dart' as _i13;
import '../use_cases/get_all_categories_use_case.dart' as _i16;
import '../use_cases/get_all_products_use_case.dart' as _i15;
import 'third_party_module.dart' as _i20;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final thirdPartyModule = _$ThirdPartyModule();
    gh.factory<_i3.Dio>(() => thirdPartyModule.getDio());
    gh.factory<_i4.ApiFactory>(() => _i5.DioFactory(dio: gh<_i3.Dio>()));
    gh.factory<_i6.HomeOnlineDs>(
        () => _i7.HomeOnlineDSImpl(gh<_i4.ApiFactory>()));
    gh.factory<_i8.AuthRepo>(() => _i9.AuthRepoImpl(gh<_i4.ApiFactory>()));
    gh.factory<_i10.HomeRepo>(() => _i11.HomeRepoImpl(gh<_i6.HomeOnlineDs>()));
    gh.factory<_i12.LoginUseCase>(() => _i12.LoginUseCase(gh<_i8.AuthRepo>()));
    gh.factory<_i13.RegisterUseCase>(
        () => _i13.RegisterUseCase(gh<_i8.AuthRepo>()));
    gh.factory<_i14.RegisterViewModel>(
        () => _i14.RegisterViewModel(gh<_i13.RegisterUseCase>()));
    gh.factory<_i15.GetAllProductsUseCase>(
        () => _i15.GetAllProductsUseCase(gh<_i10.HomeRepo>()));
    gh.factory<_i16.GetAllCategoriesUseCase>(
        () => _i16.GetAllCategoriesUseCase(gh<_i10.HomeRepo>()));
    gh.factory<_i17.LoginViewModel>(
        () => _i17.LoginViewModel(gh<_i12.LoginUseCase>()));
    gh.factory<_i18.GetAllCategoriesViewModel>(() =>
        _i18.GetAllCategoriesViewModel(gh<_i16.GetAllCategoriesUseCase>()));
    gh.factory<_i19.GetAllProductsViewModel>(
        () => _i19.GetAllProductsViewModel(gh<_i15.GetAllProductsUseCase>()));
    return this;
  }
}

class _$ThirdPartyModule extends _i20.ThirdPartyModule {}
