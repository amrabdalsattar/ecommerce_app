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
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i5;

import '../../data/data_utils/cache_helper.dart' as _i3;
import '../../data/repos/auth_repo_impl.dart' as _i18;
import '../../data/repos/cart_repo_impl.dart' as _i20;
import '../../data/repos/data_sources/cart_data_source_impl.dart' as _i14;
import '../../data/repos/data_sources/home_online_ds_impl.dart' as _i10;
import '../../data/repos/data_sources/wishlist_data_source_impl.dart' as _i12;
import '../../data/repos/home_repo_impl.dart' as _i22;
import '../../data/repos/wishlist_repo_impl.dart' as _i16;
import '../../presentation/view_model/auth_view_models/login_view_model.dart'
    as _i38;
import '../../presentation/view_model/auth_view_models/register_view_model.dart'
    as _i37;
import '../../presentation/view_model/cart_view_model.dart' as _i26;
import '../../presentation/view_model/categories_view_model.dart' as _i35;
import '../../presentation/view_model/product_view_models/product_details_view_model.dart'
    as _i6;
import '../../presentation/view_model/product_view_models/products_view_model.dart'
    as _i36;
import '../../utils/networking/api_factory.dart' as _i7;
import '../../utils/networking/dio_factory.dart' as _i8;
import '../repos/auth_repo.dart' as _i17;
import '../repos/cart_repo.dart' as _i19;
import '../repos/data_sources/cart_data_source.dart' as _i13;
import '../repos/data_sources/home_online_ds.dart' as _i9;
import '../repos/data_sources/wishlist_data_source.dart' as _i11;
import '../repos/home_repo.dart' as _i21;
import '../repos/wishlist_repo.dart' as _i15;
import '../use_cases/auth_use_cases/login_use_case.dart' as _i33;
import '../use_cases/auth_use_cases/register_use_case.dart' as _i34;
import '../use_cases/cart_use_cases/add_to_cart_use_case.dart' as _i23;
import '../use_cases/cart_use_cases/get_logged_user_cart_use_case.dart' as _i24;
import '../use_cases/cart_use_cases/remove_from_cart_use_case.dart' as _i25;
import '../use_cases/get_all_categories_use_case.dart' as _i30;
import '../use_cases/get_all_products_use_case.dart' as _i31;
import '../use_cases/get_products_by_category_use_case.dart' as _i32;
import '../use_cases/wishlist_use_cases/add_to_wishlist_use_case.dart' as _i27;
import '../use_cases/wishlist_use_cases/get_wishlist_items_use__case.dart'
    as _i28;
import '../use_cases/wishlist_use_cases/remove_from_wishlist_use_case.dart'
    as _i29;
import 'third_party_module.dart' as _i39;

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
    gh.factory<_i5.InternetConnectionChecker>(
        () => thirdPartyModule.getInternetConnectionChecker());
    gh.factory<_i6.ProductDetailsViewModel>(
        () => _i6.ProductDetailsViewModel());
    gh.factory<_i7.ApiFactory>(() => _i8.DioFactory(dio: gh<_i4.Dio>()));
    gh.factory<_i9.HomeOnlineDs>(
        () => _i10.HomeOnlineDSImpl(gh<_i7.ApiFactory>()));
    gh.factory<_i11.WishlistDataSource>(
        () => _i12.WishlistDataSourceImpl(gh<_i7.ApiFactory>()));
    gh.factory<_i13.CartDataSource>(
        () => _i14.CartDataSourceImpl(gh<_i7.ApiFactory>()));
    gh.factory<_i15.WishlistRepo>(() => _i16.WishlistRepoImpl(
          gh<_i11.WishlistDataSource>(),
          gh<_i5.InternetConnectionChecker>(),
        ));
    gh.factory<_i17.AuthRepo>(() => _i18.AuthRepoImpl(
          gh<_i7.ApiFactory>(),
          gh<_i5.InternetConnectionChecker>(),
        ));
    gh.factory<_i19.CartRepo>(() => _i20.CartRepoImpl(
          gh<_i13.CartDataSource>(),
          gh<_i5.InternetConnectionChecker>(),
        ));
    gh.factory<_i21.HomeRepo>(() => _i22.HomeRepoImpl(
          gh<_i9.HomeOnlineDs>(),
          gh<_i5.InternetConnectionChecker>(),
        ));
    gh.factory<_i23.AddToCartUseCase>(
        () => _i23.AddToCartUseCase(gh<_i19.CartRepo>()));
    gh.factory<_i24.GetLoggedUserCartUseCase>(
        () => _i24.GetLoggedUserCartUseCase(gh<_i19.CartRepo>()));
    gh.factory<_i25.RemoveFromCartUseCase>(
        () => _i25.RemoveFromCartUseCase(gh<_i19.CartRepo>()));
    gh.factory<_i26.CartViewModel>(() => _i26.CartViewModel(
          gh<_i23.AddToCartUseCase>(),
          gh<_i24.GetLoggedUserCartUseCase>(),
          gh<_i25.RemoveFromCartUseCase>(),
        ));
    gh.factory<_i27.AddToWishlistUseCase>(
        () => _i27.AddToWishlistUseCase(gh<_i15.WishlistRepo>()));
    gh.factory<_i28.GetWishlistItemsUseCase>(
        () => _i28.GetWishlistItemsUseCase(gh<_i15.WishlistRepo>()));
    gh.factory<_i29.RemoveFromWishlistUseCase>(
        () => _i29.RemoveFromWishlistUseCase(gh<_i15.WishlistRepo>()));
    gh.factory<_i30.GetAllCategoriesUseCase>(
        () => _i30.GetAllCategoriesUseCase(gh<_i21.HomeRepo>()));
    gh.factory<_i31.GetAllProductsUseCase>(
        () => _i31.GetAllProductsUseCase(gh<_i21.HomeRepo>()));
    gh.factory<_i32.GetProductsByCategoryUseCase>(
        () => _i32.GetProductsByCategoryUseCase(gh<_i21.HomeRepo>()));
    gh.factory<_i33.LoginUseCase>(() => _i33.LoginUseCase(gh<_i17.AuthRepo>()));
    gh.factory<_i34.RegisterUseCase>(
        () => _i34.RegisterUseCase(gh<_i17.AuthRepo>()));
    gh.factory<_i35.CategoriesViewModel>(() => _i35.CategoriesViewModel(
          gh<_i30.GetAllCategoriesUseCase>(),
          gh<_i32.GetProductsByCategoryUseCase>(),
        ));
    gh.factory<_i36.ProductsViewModel>(
        () => _i36.ProductsViewModel(gh<_i31.GetAllProductsUseCase>()));
    gh.factory<_i37.RegisterViewModel>(
        () => _i37.RegisterViewModel(gh<_i34.RegisterUseCase>()));
    gh.factory<_i38.LoginViewModel>(
        () => _i38.LoginViewModel(gh<_i33.LoginUseCase>()));
    return this;
  }
}

class _$ThirdPartyModule extends _i39.ThirdPartyModule {}
