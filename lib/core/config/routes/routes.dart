import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:investynn/core/config/routes/route_name.dart';
import 'package:investynn/core/helper/bottom_nav_bar.dart';
import 'package:investynn/presentation/getting_started_screen/page/getting_started_screen.dart';
import 'package:investynn/presentation/home_screen/page/home_screen.dart';
import 'package:investynn/presentation/login_signup_screen/login/login_screen.dart';
import 'package:investynn/presentation/login_signup_screen/signup/signup_screen.dart';
import 'package:investynn/presentation/market_screen/page/market_screen.dart';
import 'package:investynn/presentation/more_services_screen/page/more_services_screen.dart';
import 'package:investynn/presentation/portfolio_screen/page/portfolio_screen.dart';
import 'package:investynn/presentation/splash_screen/page/splash_screen.dart';
import 'package:investynn/presentation/stocks_screen/page/stocks_screen.dart';

class Routes {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter appRouter = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: RouteName.splashScreen,
    routes: [
      GoRoute(
        path: RouteName.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RouteName.getStarted,
        builder: (context, state) => const GettingStartedScreen(),
      ),
      GoRoute(
        path: RouteName.login,
        name: RouteName.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RouteName.register,
        name: RouteName.register,
        builder: (context, state) => const SignupScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return BottomNavBar(navigationShell: navigationShell);
        },
        branches: [
          // Home Branch
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(),
            routes: [
              GoRoute(
                path: RouteName.home,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          // Portfolio Branch
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(),
            routes: [
              GoRoute(
                path: RouteName.portfolio,
                builder: (context, state) => const PortfolioScreen(),
              ),
            ],
          ),
          // Market Branch
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(),
            routes: [
              GoRoute(
                path: RouteName.market,
                builder: (context, state) => const MarketScreen(),
              ),
            ],
          ),
          // Profile Branch
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(),
            routes: [
              GoRoute(
                path: RouteName.stocks,
                builder: (context, state) => const StocksScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(),
            routes: [
              GoRoute(
                path: RouteName.moreServices,
                builder: (context, state) => const MoreServicesScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
