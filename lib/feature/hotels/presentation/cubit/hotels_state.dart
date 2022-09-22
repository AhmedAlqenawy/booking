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
