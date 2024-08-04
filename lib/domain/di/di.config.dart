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
import '../../data/repos/auth_repo_impl.dart' as _i11;
import '../../data/repos/cart_repo_impl.dart' as _i17;
import '../../data/repos/data_sources/cart_data_source_impl.dart' as _i13;
import '../../data/repos/data_sources/home_online_ds_impl.dart' as _i9;
import '../../data/repos/home_repo_impl.dart' as _i19;
import '../../presentation/view_model/auth_view_models/login_view_model.dart'
    as _i28;
import '../../presentation/view_model/auth_view_models/register_view_model.dart'
    as _i24;
import '../../presentation/view_model/cart_view_model.dart' as _i23;
import '../../presentation/view_model/categories_view_model.dart' as _i29;
import '../../presentation/view_model/product_view_models/product_details_view_model.dart'
    as _i5;
import '../../presentation/view_model/product_view_models/products_view_model.dart'
    as _i30;
import '../../utils/networking/api_factory.dart' as _i6;
import '../../utils/networking/dio_factory.dart' as _i7;
import '../repos/auth_repo.dart' as _i10;
import '../repos/cart_repo.dart' as _i16;
import '../repos/data_sources/cart_data_source.dart' as _i12;
import '../repos/data_sources/home_online_ds.dart' as _i8;
import '../repos/home_repo.dart' as _i18;
import '../use_cases/auth_use_cases/login_use_case.dart' as _i14;
import '../use_cases/auth_use_cases/register_use_case.dart' as _i15;
import '../use_cases/cart_use_cases/add_to_cart_use_case.dart' as _i20;
import '../use_cases/cart_use_cases/get_logged_user_cart_use_case.dart' as _i21;
import '../use_cases/cart_use_cases/remove_from_cart_use_case.dart' as _i22;
import '../use_cases/get_all_categories_use_case.dart' as _i25;
import '../use_cases/get_all_products_use_case.dart' as _i26;
import '../use_cases/get_products_by_category_use_case.dart' as _i27;
import 'third_party_module.dart' as _i31;

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
    gh.factory<_i5.ProductDetailsViewModel>(
        () => _i5.ProductDetailsViewModel());
    gh.factory<_i6.ApiFactory>(() => _i7.DioFactory(dio: gh<_i4.Dio>()));
    gh.factory<_i8.HomeOnlineDs>(
        () => _i9.HomeOnlineDSImpl(gh<_i6.ApiFactory>()));
    gh.factory<_i10.AuthRepo>(() => _i11.AuthRepoImpl(gh<_i6.ApiFactory>()));
    gh.factory<_i12.CartDataSource>(
        () => _i13.CartDataSourceImpl(gh<_i6.ApiFactory>()));
    gh.factory<_i14.LoginUseCase>(() => _i14.LoginUseCase(gh<_i10.AuthRepo>()));
    gh.factory<_i15.RegisterUseCase>(
        () => _i15.RegisterUseCase(gh<_i10.AuthRepo>()));
    gh.factory<_i16.CartRepo>(
        () => _i17.CartRepoImpl(gh<_i12.CartDataSource>()));
    gh.factory<_i18.HomeRepo>(() => _i19.HomeRepoImpl(gh<_i8.HomeOnlineDs>()));
    gh.factory<_i20.AddToCartUseCase>(
        () => _i20.AddToCartUseCase(gh<_i16.CartRepo>()));
    gh.factory<_i21.GetLoggedUserCartUseCase>(
        () => _i21.GetLoggedUserCartUseCase(gh<_i16.CartRepo>()));
    gh.factory<_i22.RemoveFromCartUseCase>(
        () => _i22.RemoveFromCartUseCase(gh<_i16.CartRepo>()));
    gh.factory<_i23.CartViewModel>(() => _i23.CartViewModel(
          gh<_i20.AddToCartUseCase>(),
          gh<_i21.GetLoggedUserCartUseCase>(),
          gh<_i22.RemoveFromCartUseCase>(),
        ));
    gh.factory<_i24.RegisterViewModel>(
        () => _i24.RegisterViewModel(gh<_i15.RegisterUseCase>()));
    gh.factory<_i25.GetAllCategoriesUseCase>(
        () => _i25.GetAllCategoriesUseCase(gh<_i18.HomeRepo>()));
    gh.factory<_i26.GetAllProductsUseCase>(
        () => _i26.GetAllProductsUseCase(gh<_i18.HomeRepo>()));
    gh.factory<_i27.GetProductsByCategoryUseCase>(
        () => _i27.GetProductsByCategoryUseCase(gh<_i18.HomeRepo>()));
    gh.factory<_i28.LoginViewModel>(
        () => _i28.LoginViewModel(gh<_i14.LoginUseCase>()));
    gh.factory<_i29.CategoriesViewModel>(() => _i29.CategoriesViewModel(
          gh<_i25.GetAllCategoriesUseCase>(),
          gh<_i27.GetProductsByCategoryUseCase>(),
        ));
    gh.factory<_i30.ProductsViewModel>(
        () => _i30.ProductsViewModel(gh<_i26.GetAllProductsUseCase>()));
    return this;
  }
}

class _$ThirdPartyModule extends _i31.ThirdPartyModule {}
