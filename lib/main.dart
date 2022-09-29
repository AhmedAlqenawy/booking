import 'package:easy_localization/easy_localization.dart';

import 'package:booking/core/util/mangerLang/manger_languge.dart';
import 'package:booking/core/util/network/local/Cach_Helper.dart';
import 'package:booking/feature/hotels/presentation/cubit/hotels_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/injection.dart';
import 'core/util/blocs/app/cubit.dart';
import 'core/util/routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await CacheHelper.init();
  // late String accsestoken = CacheHelper.getData(key: 'token');
  await EasyLocalization.ensureInitialized();
  // CacheHelper.init();

  init();
  runApp(EasyLocalization(
            supportedLocales: const [
              Locale('en'),
              Locale('ar'),
            ],
            fallbackLocale: const Locale('en'),
            //assetLoader: const CodegenLoader(),

      path: Assets_Localization,
      child: Phoenix(child: const MyApp())));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  CacheHelper cache = CacheHelper();


  @override
  void didChangeDependencies() {

    cache.getLocal().then((local) => {context.setLocale(local)});
    print(cache.getAppLanguage().toString());

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AppBloc>(
            create: (context) => sl<AppBloc>()..getLocation()..getAllHotels(),
          ),
          BlocProvider<HotelsCubit>(
            create: (context) => sl<HotelsCubit>()..getAllUpcommingBooking(),
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => MaterialApp(
         localizationsDelegates: context.localizationDelegates,
                    supportedLocales: context.supportedLocales,
                    locale: context.locale,
                    localeResolutionCallback: (locale, supportedLocales) {
                      for (var supportedLocale in supportedLocales) {
                        if (supportedLocale.languageCode == locale?.languageCode) {
                          return supportedLocale;
                        }
                      }
                      return supportedLocales.first;
                    },

            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
            //  primarySwatch: Colors.blue,
            ),
            routes: Routes.routes,
            initialRoute: Routes.splash,
          ),
        ));
  }
}

extension NavigationContext on BuildContext {
  get pop => Navigator.pop(this);

  set push(String page) => Navigator.pushNamed(this, page);
}
