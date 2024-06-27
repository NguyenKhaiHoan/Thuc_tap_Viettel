import 'package:day_25_26_06_2024/injection_container.dart';
import 'package:day_25_26_06_2024/src/config/theme/color.dart';
import 'package:day_25_26_06_2024/src/features/auth/presentation/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'src/config/routes/routes.dart';
import 'src/config/theme/theme.dart';
import 'src/features/auth/presentation/bloc/auth/auth_bloc.dart';

Future<void> main() async {
  // Bloc.observer = const AppBlocObserver();
  await dotenv.load(fileName: ".env");
  await initializeDependencies();
  runApp(const MyApp());
}

// class AppBlocObserver extends BlocObserver {
//   /// {@macro app_bloc_observer}
//   const AppBlocObserver();

//   @override
//   void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
//     super.onChange(bloc, change);
//     if (bloc is Cubit) print(change);
//   }

//   @override
//   void onTransition(
//     Bloc<dynamic, dynamic> bloc,
//     Transition<dynamic, dynamic> transition,
//   ) {
//     super.onTransition(bloc, transition);
//     print(transition);
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => sl(),
      child: GlobalLoaderOverlay(
        overlayColor: HAppColor.otherColor.withOpacity(0.8),
        useDefaultLoading: false,
        overlayWidgetBuilder: (_) {
          //ignored progress for the moment
          return Center(
            child: LoadingAnimationWidget.flickr(
                leftDotColor: HAppColor.bluePrimaryColor,
                rightDotColor: HAppColor.blueSecondaryColor,
                size: 50),
          );
        },
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Movie app',
            theme: HAppTheme().theme,
            initialRoute: '/',
            onGenerateRoute: AppRoutes.onGenerateRoutes,
            home: const WelcomePage()),
      ),
    );
  }
}
