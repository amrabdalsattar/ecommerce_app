import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/failure.dart';
import 'package:ecommerce_app/domain/repos/auth_repo.dart';

class LoginUseCase {
  AuthRepo authRepo;

  LoginUseCase(this.authRepo);

  Future<Either<Failure, bool>> executeLogin(
      {required email, required password}) {
    return authRepo.login(email: email, password: password);
  }
}
