part of 'hotels_cubit.dart';

abstract class HotelsState extends Equatable {
  const HotelsState();

  @override
  List<Object> get props => [];
}

class HotelsInitial extends HotelsState {}
class GetBookingLoadingState extends HotelsState {}
class GetBookingErrorState extends HotelsState {
    final String message;

  GetBookingErrorState(this.message);

}
class GetBookingLoadedState extends HotelsState {
  final Trip trip;

  const GetBookingLoadedState({required this.trip});
  @override
  List<Object> get props => [trip];
}

class GetCompletedBookingLoadingState extends HotelsState {}
class GetCompletedBookingErrorState extends HotelsState {
    final String message;

  const GetCompletedBookingErrorState(this.message);

}
class GetCompletedBookingLoadedState extends HotelsState {
  final Trip trip;

  const GetCompletedBookingLoadedState({required this.trip});
  @override
  List<Object> get props => [trip];
}
class GetUpcommingBookingLoadingState extends HotelsState {}
class GetUpcommingBookingErrorState extends HotelsState {
    final String message;

  const GetUpcommingBookingErrorState(this.message);

}
class GetUpcommingBookingLoadedState extends HotelsState {
  final Trip trip;

  const GetUpcommingBookingLoadedState({required this.trip});
  @override
  List<Object> get props => [trip];
}
class GetCancelledBookingLoadingState extends HotelsState {}
class GetCancelledBookingErrorState extends HotelsState {
    final String message;

  const GetCancelledBookingErrorState(this.message);

}
class GetCancelledBookingLoadedState extends HotelsState {
  final Trip trip;

  const GetCancelledBookingLoadedState({required this.trip});
  @override
  List<Object> get props => [trip];
}
class CreateBookingSuccessState extends HotelsState {

}

class CreateBookingErrorState extends HotelsState {
  final String message;

  const CreateBookingErrorState(this.message);
}

class UpdateBookingSuccessState extends HotelsState {

  const UpdateBookingSuccessState();
}

class UpdateBookingErrorState extends HotelsState {
  final String message;

  const UpdateBookingErrorState(this.message);
}
class ChangeTabIndexState extends HotelsState {

}