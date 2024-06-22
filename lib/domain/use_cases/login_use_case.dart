import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/failure.dart';
import '../repos/auth_repo.dart';

@injectable
class LoginUseCase {
  AuthRepo authRepo;

  LoginUseCase(this.authRepo);

  Future<Either<Failure, bool>> executeLogin(
      {required email, required password}) {
    return authRepo.login(email: email, password: password);
  }
}
