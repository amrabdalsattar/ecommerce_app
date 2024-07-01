import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/failure.dart';
import 'package:ecommerce_app/data/models/responses/home_responses/categories_response.dart';
import 'package:ecommerce_app/data/models/responses/home_responses/products_response.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../domain/repos/home_repo/data_sources/home_online_ds.dart';
import '../../../domain/repos/home_repo/home_repo.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl extends HomeRepo {
  final HomeOnlineDs ds;

  HomeRepoImpl(this.ds);

  @override
  Future<Either<Failure, List<CategoryDM>>> getCategories() async {
    bool isConnectedToInternet =
        await InternetConnectionChecker().hasConnection;
    if (isConnectedToInternet) {
      return ds.getCategories();
    } else {
      return Left(Failure("Check your Internet Connection !"));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProducts() async{
    bool isConnectedToInternet =
        await InternetConnectionChecker().hasConnection;
    if (isConnectedToInternet) {
      return ds.getProducts();
    } else {
      return Left(Failure("Check your Internet Connection !"));
    }
  }
}
