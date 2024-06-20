import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/failure.dart';
import 'package:ecommerce_app/data/models/requests/register_request.dart';
import 'package:ecommerce_app/domain/repos/auth_repo.dart';

class RegisterUseCase {
  AuthRepo authRepo;

  RegisterUseCase(this.authRepo);

  Future<Either<Failure, bool>> executeRegister(RegisterRequest data) {
    return authRepo.register(data: data);
  }
}
