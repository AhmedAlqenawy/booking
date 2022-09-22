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

class UserLoginSuccessState extends AppStates {}
class GetProfileSuccessState extends AppStates {}
