import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/util/widget_functions.dart';
import '../../domain/entities/trip.dart';
import '../../domain/use_cases/create_booking_usecase.dart';
import '../../domain/use_cases/get_canceled_usecase.dart';
import '../../domain/use_cases/get_completed_usecase.dart';
import '../../domain/use_cases/get_upcoming_usecase.dart';
import '../../domain/use_cases/update_booking_state_usecase.dart';
import '../screens/get_booking_screen.dart';

part 'hotels_state.dart';

class HotelsCubit extends Cubit<HotelsState> {
  HotelsCubit(
      this.getCancelledUseCase,
      this.getCompletedUseCase,
      this.getUpCommingUseCase,
      this.createBookingUseCase,
      this.updateBookingUsecase)
      : super(HotelsInitial());
  final GetCancelledUseCase getCancelledUseCase;
  final GetCompletedUseCase getCompletedUseCase;
  final GetUpCommingUseCase getUpCommingUseCase;
  final CreateBookingUseCase createBookingUseCase;
  final UpdateBookingUsecase updateBookingUsecase;

  List<Data> upCommingBooking = [];
  List<Data> completedBooking = [];
  List<Data> canceledBooking = [];

  getAllCanceledBooking() async {
    canceledBooking = [];
    emit(GetCompletedBookingLoadingState());
    final Either<Failure, Trip> tripList = await getCancelledUseCase();
    tripList.fold(
        (failure) => GetBookingErrorState(_getFailureErrorMessage(failure)),
        (bookings) {
      canceledBooking.addAll(bookings.data!);
      print(canceledBooking);
      emit(GetBookingLoadedState(trip: bookings));
    });
  }

  getAllCompletedBooking() async {
    completedBooking = [];
    emit(GetCompletedBookingLoadingState());
    final Either<Failure, Trip> tripList = await getCompletedUseCase();
    tripList.fold(
        (failure) => GetBookingErrorState(_getFailureErrorMessage(failure)),
        (bookings) {
      completedBooking.addAll(bookings.data!);

      emit(GetCompletedBookingLoadedState(trip: bookings));
    });
  }

  getAllUpcommingBooking() async {
    upCommingBooking = [];
    emit(GetCompletedBookingLoadingState());
    final Either<Failure, Trip> tripList = await getUpCommingUseCase();
    tripList.fold(
        (failure) => GetBookingErrorState(_getFailureErrorMessage(failure)),
        (bookings) {
      upCommingBooking.addAll(bookings.data!);

      emit(GetCompletedBookingLoadedState(trip: bookings));
    });
  }

  String _getFailureErrorMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'AppStrings.serverError';
      case EmptyCasheFailure:
        return 'AppStrings.cashError';
      case OfflineFailure:
        return 'AppStrings.offlineErrpr';
      default:
        return 'AppStrings.unexpectedError';
    }
  }

  createBooking({required int hotelId, required int userId}) async {
    final Either<Failure, Unit> response =
        await createBookingUseCase(hotelId: hotelId, userId: userId);
    response.fold(
        (failure) => CreateBookingErrorState(_getFailureErrorMessage(failure)),
        (message) {
      emit(CreateBookingSuccessState());
    });
  }

  int? tabIndex;
  TabController? tabController;

  updateBookingStatus(
      {required int bookingId,
      required String type,
      required int index,
      required BuildContext context}) async {
    tabController!.animateTo(index);
    final Either<Failure, Unit> response =
        await updateBookingUsecase(bookingId: bookingId, type: type);

    response.fold(
        (failure) => UpdateBookingErrorState(_getFailureErrorMessage(failure)),
        (message) {
      emit(UpdateBookingSuccessState());
      if (index == 1) {
        getAllCompletedBooking();
      } else if (index == 2) {
        getAllCanceledBooking();
      }
      changeTabIndex(index: index, context: context);
    });
  }

  changeTabIndex({required int index, required BuildContext context}) {
    //tabIndex = index;
    //print('tabIndex'+tabIndex.toString());
    Navigator.of(context).pop();
    //emit(ChangeTabIndexState());
  }
}
