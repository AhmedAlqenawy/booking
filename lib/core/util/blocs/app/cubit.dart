import 'package:booking/core/util/blocs/app/states.dart';
import 'package:booking/feature/about/model/profile_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

 import '../../../../feature/models/login_model.dart';
import '../../network/repository.dart';

class AppBloc extends Cubit<AppStates> {
  final Repository repository;
  String ? token="mEbHlHnNAvI6mB15T4ZBzN19Y8Un5GxChAfLkYzugI2GhEXUcKiogp6BxLuH";
  AppBloc({
    required this.repository,
  }) : super(AppInitialState());

  static AppBloc get(context) => BlocProvider.of<AppBloc>(context);

  LoginModel? loginModel;

  ProfileModel? profileModel;

  void getProfileDate()async{
    emit(GetProfileLoadingState());

    final response = await repository.getProfile(token:token);

    response.fold(
          (l) {
        emit(ErrorState(exception: l));
      },
          (r) {
        profileModel = r;

        emit(GetProfileSuccessState());
      },
    );
  }

  void userLogin( email, password) async {
    emit(UserLoginLoadingState());
    print('$email + omniaaaaaaa');
    final response = await repository.login(
      email: email.text,
      password: password.text,
    );

    response.fold(
          (l) {
        emit(ErrorState(exception: l));
      },
          (r) {
        loginModel = r;

        emit(UserLoginSuccessState());
      },
    );
  }
}
