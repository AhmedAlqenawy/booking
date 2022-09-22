import 'package:booking/feature/allhotels/data/repository/hotel_repo_impl.dart';
import 'package:booking/feature/allhotels/domian/repository/auth_repository.dart';
import 'package:booking/feature/filtter/data/repository/filtter_repo_impl.dart';
import 'package:booking/feature/filtter/domian/repository/filtter_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../feature/hotels/data/data_sources/remote_datasource.dart';
import '../../feature/hotels/data/repositories/booking_repository_imp.dart';
import '../../feature/hotels/domain/repositories/booking_repository.dart';
import '../../feature/hotels/domain/use_cases/get_canceled_usecase.dart';
import '../../feature/hotels/domain/use_cases/get_completed_usecase.dart';
import '../../feature/hotels/domain/use_cases/get_upcoming_usecase.dart';
import '../../feature/hotels/presentation/cubit/hotels_cubit.dart';
import '../util/blocs/app/cubit.dart';
import '../util/network/network_info.dart';
import '../util/network/remote/dio_helper.dart';
import '../util/network/repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => AppBloc(
        filtterRepository: sl(),
        hotelsRepository: sl(),
        repository: sl(),
      ));

  sl.registerLazySingleton<DioHelper>(
    () => DioImpl(),
  );

  sl.registerLazySingleton<Repository>(
    () => RepositoryImplementation(
      dioHelper: sl(),
    ),
  );

  //*  features booking
  // bloc
  sl.registerFactory(() => HotelsCubit(sl(), sl(), sl()));
  // usecases
  sl.registerLazySingleton<GetUpCommingUseCase>(
      () => GetUpCommingUseCase(sl()));
  sl.registerLazySingleton<GetCancelledUseCase>(
      () => GetCancelledUseCase(sl()));
  sl.registerLazySingleton<GetCompletedUseCase>(
      () => GetCompletedUseCase(sl()));
  // repositories
  sl.registerLazySingleton<BookingRepository>(
      () => BookingRepositoryImp(sl(), sl()));
  // datasources
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(sl()));

  //* core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImplement(sl()));
  //* external

  sl.registerLazySingleton(() => InternetConnectionChecker());

  sl.registerLazySingleton<HotelsRepository>(
      () => HotelsRepositoryImplementation(dioHelper: sl()));

  sl.registerLazySingleton<FiltterRepository>(
      () => FiltterRepositoryImplementation(dioHelper: sl()));
}
