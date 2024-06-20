abstract class BaseState{}
class BaseInitialState extends BaseState{}
class BaseLoadingState extends BaseState{}
class BaseErrorState extends BaseState{
  String errorMessage;
  BaseErrorState(this.errorMessage);
}
class BaseSuccessState extends BaseState{}