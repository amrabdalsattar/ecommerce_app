import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/failure.dart';
import '../../../domain/use_cases/auth_use_cases/login_use_case.dart';
import '../states/base_states.dart';

@injectable
class LoginViewModel extends Cubit<BaseState> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  LoginViewModel(this.useCase) : super(BaseInitialState());

  LoginUseCase useCase;

  void login() async {
    if (!formKey.currentState!.validate()) return;
    emit(BaseLoadingState());
    Either<Failure, bool> response =
        await useCase.executeLogin(email: email.text, password: password.text);

    response.fold((error) => emit(BaseErrorState(error.errorMessage)),
        (success) => emit(BaseSuccessState()));
  }
}
