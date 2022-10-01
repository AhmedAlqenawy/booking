import 'dart:io';

import 'package:booking/core/util/blocs/app/states.dart';
import 'package:booking/core/util/network/local/Cach_Helper.dart';
import 'package:booking/feature/about/model/profile_model.dart';
import 'package:booking/feature/allhotels/domian/entity/hotel_model.dart';
import 'package:booking/feature/allhotels/domian/repository/auth_repository.dart';
import 'package:booking/feature/filtter/domian/entity/filtter_hotel_model.dart';
import 'package:booking/feature/filtter/domian/repository/filtter_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../feature/filtter/data/models/facilities.dart';
import '../../../../feature/login/models/login_model.dart';
import '../../../../feature/login/models/register_model.dart';
import '../../constants/constants.dart' as constants;
import '../../network/repository.dart';

class AppBloc extends Cubit<AppStates> {
  final Repository repository;
  final HotelsRepository hotelsRepository;
  final FiltterRepository filtterRepository;
  String? token = CacheHelper.getData(key: 'token');

  AppBloc({
    required this.repository,
    required this.hotelsRepository,
    required this.filtterRepository,
  }) : super(AppInitialState());

  static AppBloc get(context) => BlocProvider.of<AppBloc>(context);

  LoginModel? loginModel;

  RegisterModel? registerModel;

  ProfileModel? profileModel;

  Facilities? allFacilities;

  List<int> facilitiesIds = [];

  addFacilitiesToFilter(int id) {
    facilitiesIds.add(id);
  }

  removeFacilitiesToFilter(int id) {
    facilitiesIds.removeWhere((element) => element == id);
  }

  void getAllFacilities() async {
    emit(FacilitiesLoadingState());
    final response = await filtterRepository.getFacilities();

    response.fold((l) {
      emit(ErrorState(exception: l));
    }, (r) {
      allFacilities = r;
      print("allFacilities ${r.data!.length}");
      emit(FacilitiesSuccessState());
    });
  }

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

  void updateProfile(String name, String email, File? file) async {
    emit(UpdateProfileLoadingState());
    final response = await repository.updateProfile(
        token: token, name: name, email: email, file: file);

    response.fold(
      (l) {
        emit(ErrorState(exception: l));
      },
      (r) {
        profileModel = r;
        emit(UserUpdateProfileSuccessState());
      },
    );
  }

  void userLogin(email, password) async {
    emit(UserLoginLoadingState());
    final response = await repository.login(
      email: email,
      password: password,
    );
    response.fold(
      (l) {
        emit(ErrorState(exception: l));
      },
      (r) {
        loginModel = r;
        token = r.data!.apiToken;
        constants.token = token!;
        CacheHelper.saveData(key: 'fristLogin', value: false);
        CacheHelper.saveData(key: 'token', value: token);
        CacheHelper.saveData(key: 'userId', value: r.data!.id!);

        emit(UserLoginSuccessState());
      },
    );
  }

  void userSignUp(email, password, Fname, ConfirmPassword) async {
    emit(UserRegisterLoadingState());
    print('$email + Omniaaaaaaa');
    print('$password + Omniaaaaaaa');
    print('$Fname + Omniaaaaaaa');
    print('$ConfirmPassword + Omniaaaaaaa');
    final response = await repository.register(
      name: Fname,
      email: email,
      password: password,
      configPassword: ConfirmPassword,
    );

    response.fold(
      (l) {
        emit(ErrorState(exception: l));
      },
      (s) {
        registerModel = s;
        CacheHelper.saveData(key: 'userId', value: s.data!.id!);

        emit(UserRegisterSuccessState());
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

  double end = 1000;
  double start = 10;
  double startDistanc = 150;
  List<HotelModel> hotel = [];

  void getAllHotels() async {
    emit(HotelsLoadingState());
    final response = await hotelsRepository.getHotels(page: 1);

    print("response response 1");
    print("response $response");
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
      facilitiesIds: facilitiesIds,
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

  List<FiltterHotelModel> search = [];

  void searchHotel({
    required String name,
  }) async {
    emit(SearchLoadingState());
    final response = await filtterRepository.search(
      name: name,
      page: 1,
    );

    response.fold((l) {
      emit(ErrorState(exception: l));
    }, (r) {
      search = r.data!.data;
      emit(SearchSuccessState());
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

  bool isDark = false;

  // void changeAppMode() {
  //   isDark = !isDark;
  //   emit(AppChangeModeState());
  // }

  bool? getMode() {
    if (CacheHelper.getData(key: 'isDark') == null) {
      CacheHelper.saveData(key: 'isDark', value: isDark);
    }
    isDark = CacheHelper.getData(key: 'isDark');
    return isDark;
  }

  void changeAppTheme({bool? sharedValue}) {
    isDark = sharedValue!;
    print(isDark);
emit(AppChangeModeState());
    CacheHelper.saveData(key: 'isDark', value: isDark)
        .then((value) => emit(AppChangeModeState()));
  }

}
