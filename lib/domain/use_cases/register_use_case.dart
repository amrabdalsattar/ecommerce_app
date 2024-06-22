import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/failure.dart';
import '../../data/models/requests/register_request.dart';
import '../repos/auth_repo.dart';

@injectable
class RegisterUseCase {
  final AuthRepo authRepo;

  const RegisterUseCase(this.authRepo);

  Future<Either<Failure, bool>> executeRegister(RegisterRequest data) {
    return authRepo.register(data: data);
  }
}
