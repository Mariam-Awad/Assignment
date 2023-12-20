import 'package:assignment/cache/app_cache.dart';
import 'package:assignment/screens/person_details/person_details_cubit/person_details_cubit.dart';
import 'package:assignment/screens/popular_home/popular_home_cubit/popular_home_cubit.dart';
import 'package:assignment/screens/popular_home/view/popular_people_screen.dart';
import 'package:assignment/utils/app_colors_util.dart';
import 'package:assignment/utils/app_routes.dart';
import 'package:assignment/utils/route_manager.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppCache.instance.init().then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          BlocProvider<PopularPeopleCubit>(
            create: (BuildContext context) => PopularPeopleCubit(),
          ),
          BlocProvider<PersonDetailsCubit>(
            create: (BuildContext context) => PersonDetailsCubit(),
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => MaterialApp(
            builder: BotToastInit(),
            navigatorObservers: [BotToastNavigatorObserver()],
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.homeRouteName,
            onGenerateRoute: AppRouteManager.generateRoute,
            title: "T M D B",
            theme: ThemeData(
              colorScheme:
                  ColorScheme.fromSeed(seedColor: AppColorUtil.blueGrey),
              useMaterial3: true,
            ),
          ),
        ));
  }
}
