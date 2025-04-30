import 'package:demo_app/routes/error_screen.dart';
import 'package:demo_app/screens/other_screen/no_network_screen.dart';
import 'package:demo_app/screens/second_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:demo_app/screens/home_screen.dart';
import 'package:demo_app/screens/login_screen.dart';
import '../screens/abou_screen.dart';
import 'app_routes.dart';
import 'transitions.dart'; // import transitions

final class RouterManager {
  RouterManager._();
  static GoRouter get router => _routes;

  static final GoRouter _routes = GoRouter(
    initialLocation: AppRoutes.login,
    errorBuilder: (context, state) => ErrorPage(error: state.error.toString()),
    routes: [
      GoRoute(
        path: AppRoutes.login,
        name: AppRoutesNames.login,
        pageBuilder:
            (context, state) =>
                AppTransitions.fadeTransition(child: LoginScreen()),
      ),
      GoRoute(
        path: AppRoutes.noNetwork,
        name: AppRoutesNames.noNetwork,
        pageBuilder:
            (context, state) =>
                AppTransitions.fadeTransition(child: NoNetworkPage()),
      ),
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutesNames.home,
        pageBuilder:
            (context, state) =>
                AppTransitions.slideTransition(child: HomeScreen()),
      ),
      GoRoute(
        path: AppRoutes.about,
        name: AppRoutesNames.about,
        pageBuilder:
            (context, state) =>
                AppTransitions.fadeTransition(child: AboutScreen()),
      ),
      GoRoute(
        path: AppRoutes.second,
        name: AppRoutesNames.second,
        pageBuilder:
            (context, state) =>
                AppTransitions.slideTransition(child: SecondScreen()),
      ),
    ],
  );
}
