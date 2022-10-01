import 'package:booking/core/util/style/thems.dart';
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
import 'core/util/blocs/app/states.dart';
import 'core/util/constants.dart';
import 'core/util/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  // late String accsestoken = CacheHelper.getData(key: 'token');
  await EasyLocalization.ensureInitialized();
  // CacheHelper.init();

  init();

  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
        Locale.fromSubtags(languageCode: 'ar')
      ],
      //assetLoader: const CodegenLoader(),

      path: "assets/lang",
      child: Phoenix(child: const MyApp())));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // CacheHelper cache = CacheHelper();
  //
  // @override
  // void didChangeDependencies() {
  //   cache.getLocal().then((local) => {context.setLocale(local)});
  //   print(cache.getAppLanguage().toString());
  //
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
 
    return MultiBlocProvider(
        providers: [
          BlocProvider<AppBloc>(
            create: (context) => sl<AppBloc>()
              ..getLocation()
              ..getAllHotels(),
          ),
          BlocProvider<HotelsCubit>(
            create: (context) => sl<HotelsCubit>(),
          ),
        ],
        child: BlocConsumer<AppBloc, AppStates>(
            listener: (context, state) {},
            builder: (context, state) {
                 if (CacheHelper.getData(key: "isDark") == null) {
         BlocProvider.of<AppBloc>(context).isDark = false;
    } else {
     BlocProvider.of<AppBloc>(context).isDark = CacheHelper.getData(key: "isDark");
    }
              return ScreenUtilInit(
                designSize: const Size(375, 812),
                builder: (context, child) => MaterialApp(
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  title: 'Flutter Demo',
                  debugShowCheckedModeBanner: false,
                  darkTheme: darkTheme,
                  theme: lightTheme,
                  themeMode: AppBloc.get(context).isDark
                      ? ThemeMode.dark
                      : ThemeMode.light,
                  routes: Routes.routes,
                  initialRoute: Routes.splash,
                ),
              );
            }));
  }
}

extension NavigationContext on BuildContext {
  get pop => Navigator.pop(this);

  set push(String page) => Navigator.pushNamed(this, page);
}
