import 'package:dartz/dartz.dart';

import '../../data/models/failure.dart';
import '../../data/models/requests/register_request.dart';
import '../repos/auth_repo.dart';

class RegisterUseCase {
  final AuthRepo authRepo;

  const RegisterUseCase(this.authRepo);

  Future<Either<Failure, bool>> executeRegister(RegisterRequest data) {
    return authRepo.register(data: data);
  }
}
