import '../../../error/exceptions.dart';

abstract class AppStates {}

class AppInitialState extends AppStates {}

class ErrorState extends AppStates {
  final PrimaryServerException exception;

  ErrorState({
    required this.exception,
  });
}

class UserLoginLoadingState extends AppStates {}

class GetProfileLoadingState extends AppStates {}

class UpdateProfileLoadingState extends AppStates {}

class UserLoginSuccessState extends AppStates {}

class UserRegisterSuccessState extends AppStates {}

class UserRegisterLoadingState extends AppStates {}

class UserUpdateProfileSuccessState extends AppStates {}

class GetProfileSuccessState extends AppStates {}

class HotelsLoadingState extends AppStates {}

class HotelsSuccessState extends AppStates {}

class FiltterLoadingState extends AppStates {}

class FiltterSuccessState extends AppStates {}

class SearchLoadingState extends AppStates {}

class SearchSuccessState extends AppStates {}

class LocationSuccessState extends AppStates {}

class AppChangeModeState extends AppStates {}

class AddCounterSuccessState extends AppStates {
  final int counter;

  AddCounterSuccessState({required this.counter});
}

class RemoveCounterSuccessState extends AppStates {
  final int counter;

  RemoveCounterSuccessState({required this.counter});
}
