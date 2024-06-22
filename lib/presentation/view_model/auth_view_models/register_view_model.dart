import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/failure.dart';
import 'package:ecommerce_app/data/models/requests/register_request.dart';
import 'package:ecommerce_app/domain/use_cases/register_use_case.dart';
import 'package:ecommerce_app/presentation/view_model/base_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<BaseState> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  TextEditingController phone = TextEditingController();

  RegisterViewModel(this.useCase) : super(BaseInitialState());

  RegisterUseCase useCase;

  void register() async {
    if (!formKey.currentState!.validate()) return;
    emit(BaseLoadingState());

    Either<Failure, bool> response = await useCase.executeRegister(
        RegisterRequest(
            email: email.text,
            name: name.text,
            password: password.text,
            phone: phone.text,
            rePassword: rePassword.text));

    response.fold((error) => emit(BaseErrorState(error.errorMessage)),
            (success) => emit(BaseSuccessState()));
  }
}
