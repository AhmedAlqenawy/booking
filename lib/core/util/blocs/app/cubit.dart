import 'package:booking/core/util/blocs/app/states.dart';
import 'package:booking/feature/about/model/profile_model.dart';
import 'package:booking/feature/allhotels/domian/entity/hotel_model.dart';
import 'package:booking/feature/allhotels/domian/repository/auth_repository.dart';
import 'package:booking/feature/filtter/domian/entity/filtter_hotel_model.dart';
import 'package:booking/feature/filtter/domian/repository/filtter_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../feature/models/login_model.dart';
import '../../network/repository.dart';

class AppBloc extends Cubit<AppStates> {
  final Repository repository;
  final HotelsRepository hotelsRepository;
  final FiltterRepository filtterRepository;
  String? token =
      "mEbHlHnNAvI6mB15T4ZBzN19Y8Un5GxChAfLkYzugI2GhEXUcKiogp6BxLuH";
  AppBloc({
    required this.repository,
    required this.hotelsRepository,
    required this.filtterRepository,
  }) : super(AppInitialState());

  static AppBloc get(context) => BlocProvider.of<AppBloc>(context);

  LoginModel? loginModel;

  ProfileModel? profileModel;

  void getProfileDate() async {
    emit(GetProfileLoadingState());

    final response = await repository.getProfile(token: token);

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

  void userLogin(email, password) async {
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

  void changemin({required double min}) {
    start = min;
    emit(LocationSuccessState());
  }

  void changemaxPrice({required double max}) {
    end = max;
    emit(LocationSuccessState());
  }

  double end = 5000;
  double start = 100;
  double startDistanc = 100;
  List<HotelModel> hotel = [];
  void getAllHotels() async {
    emit(HotelsLoadingState());
    final response = await hotelsRepository.getHotels(page: 1);

    response.fold((l) {
      emit(ErrorState(exception: l));
    }, (r) {
      hotel = r.data!.data;
      emit(HotelsSuccessState());
    });
  }

  List<FiltterHotelModel> filtterHotel = [];
  void getfiltterHotel({
    required double start,
    required double end,
    required int startDistanc,
  }) async {
    emit(FiltterLoadingState());
    final response = await filtterRepository.filtter(
      latitude: lat,
      longitude: long,
      facilities0: 3,
      facilities1: 2,
      page: 1,
      maxPrice: end,
      minPrice: start,
      distance: startDistanc,
    );

    response.fold((l) {
      emit(ErrorState(exception: l));
    }, (r) {
      filtterHotel = r.data!.data;
      emit(FiltterSuccessState());
    });
  }

  int rooms = 0;
  int people = 0;
  void sumRooms() {
    rooms++;
    emit(AddCounterSuccessState(counter: rooms));
  }

  void subtraRooms() {
    rooms--;
    emit(RemoveCounterSuccessState(counter: rooms));
  }

  // void sumPeople() {
  //   people++;
  //   emit(AddCounterSuccessState());
  // }

  // void subtraPeople() {
  //   people--;
  //   emit(RemoveCounterSuccessState());
  // }

  late double lat;
  late double long;
  void getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: 'Please enable Your Location Service');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(
          msg:
              'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    lat = position.latitude;
    long = position.longitude;
    print('my lat' + lat.toString());
    print('my long' + long.toString());
    emit(LocationSuccessState());
  }
}
