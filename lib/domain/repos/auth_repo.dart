import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/failure.dart';
import 'package:ecommerce_app/data/models/requests/register_request.dart';

abstract class AuthRepo {
  Future<Either<Failure, bool>> login(
      {required String email, required String password});

  Future<Either<Failure, bool>> register({required RegisterRequest data});
}
