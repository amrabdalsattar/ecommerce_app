// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/data_utils/cache_helper.dart' as _i3;
import '../../data/repos/auth_repo_impl.dart' as _i10;
import '../../data/repos/cart_repo_impl.dart' as _i16;
import '../../data/repos/data_sources/cart_data_source_impl.dart' as _i12;
import '../../data/repos/data_sources/home_online_ds_impl.dart' as _i8;
import '../../data/repos/home_repo_impl.dart' as _i18;
import '../../presentation/view_model/auth_view_models/login_view_model.dart'
    as _i26;
import '../../presentation/view_model/auth_view_models/register_view_model.dart'
    as _i23;
import '../../presentation/view_model/cart_view_model.dart' as _i22;
import '../../presentation/view_model/get_all_categories_view_model.dart'
    as _i27;
import '../../presentation/view_model/get_all_products_view_model.dart' as _i28;
import '../../utils/networking/api_factory.dart' as _i5;
import '../../utils/networking/dio_factory.dart' as _i6;
import '../repos/auth_repo.dart' as _i9;
import '../repos/cart_repo.dart' as _i15;
import '../repos/data_sources/cart_data_source.dart' as _i11;
import '../repos/data_sources/home_online_ds.dart' as _i7;
import '../repos/home_repo.dart' as _i17;
import '../use_cases/auth_use_cases/login_use_case.dart' as _i13;
import '../use_cases/auth_use_cases/register_use_case.dart' as _i14;
import '../use_cases/cart_use_cases/add_to_cart_use_case.dart' as _i19;
import '../use_cases/cart_use_cases/get_logged_user_cart_use_case.dart' as _i20;
import '../use_cases/cart_use_cases/remove_from_cart_use_case.dart' as _i21;
import '../use_cases/get_all_categories_use_case.dart' as _i25;
import '../use_cases/get_all_products_use_case.dart' as _i24;
import 'third_party_module.dart' as _i29;

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
    gh.factory<_i3.CacheData>(() => _i3.CacheData());
    gh.factory<_i4.Dio>(() => thirdPartyModule.getDio());
    gh.factory<_i5.ApiFactory>(() => _i6.DioFactory(dio: gh<_i4.Dio>()));
    gh.factory<_i7.HomeOnlineDs>(
        () => _i8.HomeOnlineDSImpl(gh<_i5.ApiFactory>()));
    gh.factory<_i9.AuthRepo>(() => _i10.AuthRepoImpl(gh<_i5.ApiFactory>()));
    gh.factory<_i11.CartDataSource>(
        () => _i12.CartDataSourceImpl(gh<_i5.ApiFactory>()));
    gh.factory<_i13.LoginUseCase>(() => _i13.LoginUseCase(gh<_i9.AuthRepo>()));
    gh.factory<_i14.RegisterUseCase>(
        () => _i14.RegisterUseCase(gh<_i9.AuthRepo>()));
    gh.factory<_i15.CartRepo>(
        () => _i16.CartRepoImpl(gh<_i11.CartDataSource>()));
    gh.factory<_i17.HomeRepo>(() => _i18.HomeRepoImpl(gh<_i7.HomeOnlineDs>()));
    gh.factory<_i19.AddToCartUseCase>(
        () => _i19.AddToCartUseCase(gh<_i15.CartRepo>()));
    gh.factory<_i20.GetLoggedUserCartUseCase>(
        () => _i20.GetLoggedUserCartUseCase(gh<_i15.CartRepo>()));
    gh.factory<_i21.RemoveFromCartUseCase>(
        () => _i21.RemoveFromCartUseCase(gh<_i15.CartRepo>()));
    gh.factory<_i22.CartViewModel>(() => _i22.CartViewModel(
          gh<_i19.AddToCartUseCase>(),
          gh<_i20.GetLoggedUserCartUseCase>(),
          gh<_i21.RemoveFromCartUseCase>(),
        ));
    gh.factory<_i23.RegisterViewModel>(
        () => _i23.RegisterViewModel(gh<_i14.RegisterUseCase>()));
    gh.factory<_i24.GetAllProductsUseCase>(
        () => _i24.GetAllProductsUseCase(gh<_i17.HomeRepo>()));
    gh.factory<_i25.GetAllCategoriesUseCase>(
        () => _i25.GetAllCategoriesUseCase(gh<_i17.HomeRepo>()));
    gh.factory<_i26.LoginViewModel>(
        () => _i26.LoginViewModel(gh<_i13.LoginUseCase>()));
    gh.factory<_i27.GetAllCategoriesViewModel>(() =>
        _i27.GetAllCategoriesViewModel(gh<_i25.GetAllCategoriesUseCase>()));
    gh.factory<_i28.GetAllProductsViewModel>(
        () => _i28.GetAllProductsViewModel(gh<_i24.GetAllProductsUseCase>()));
    return this;
  }
}

class _$ThirdPartyModule extends _i29.ThirdPartyModule {}
