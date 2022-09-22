import 'package:bloc/bloc.dart';
import 'package:booking/feature/hotels/domain/entities/trip.dart';
import 'package:booking/feature/hotels/domain/use_cases/get_canceled_usecase.dart';
import 'package:booking/feature/hotels/domain/use_cases/get_completed_usecase.dart';
import 'package:booking/feature/hotels/domain/use_cases/get_upcoming_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';

part 'hotels_state.dart';

class HotelsCubit extends Cubit<HotelsState> {
  HotelsCubit(this.getCancelledUseCase, this.getCompletedUseCase,
      this.getUpCommingUseCase)
      : super(HotelsInitial());
  final GetCancelledUseCase getCancelledUseCase;
  final GetCompletedUseCase getCompletedUseCase;
  final GetUpCommingUseCase getUpCommingUseCase;
  List<Data> upCommingBooking = [];
  List<Data>? completedBooking ;
  List<Data> canceledBooking = [];
  getAllCanceledBooking() async {
     canceledBooking = [];
    emit(GetBookingLoadingState());
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
     completedBooking =[];
    emit(GetCompletedBookingLoadingState());
    final Either<Failure, Trip> tripList = await getCompletedUseCase();
    tripList.fold(
        (failure) => GetBookingErrorState(_getFailureErrorMessage(failure)),
        (bookings) {
      completedBooking!.addAll(bookings.data!);
     
print(completedBooking!.length);
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

  HotelsState _mapFailureOrHotelBookingToState(Either<Failure, Trip> either) {
    // upCommingBooking =[];
    return either.fold(
        (failure) => GetBookingErrorState(_getFailureErrorMessage(failure)),
        (bookings) {
      if (bookings.data![0].type == 'upcomming') {
        upCommingBooking.addAll(bookings.data!);
      } else if (bookings.data![0].type == 'completed') {
        completedBooking!.addAll(bookings.data!);
      } else if (bookings.data![0].type == 'cancelled') {
        canceledBooking.addAll(bookings.data!);
      }

      return GetBookingLoadedState(trip: bookings);
    });
  }
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
