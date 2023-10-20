import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:noon_demo/modal/product.dart';
import 'package:noon_demo/pages/account_page/account_page.dart';
import 'package:noon_demo/pages/favorites_page/favorites_page.dart';
import 'package:noon_demo/pages/product_page/product_page.dart';
import 'package:noon_demo/pages/products_page/products_page.dart';
import 'package:noon_demo/pages/scaffold_with_navbar/scaffold_with_navbar.dart';
import 'package:noon_demo/pages/shopping_cart_page.dart/shopping_cart_page.dart';

// Create keys for `root` & `section` navigator avoiding unnecessary rebuilds

class AppRouterNames {
  /// path "/home"
  static String home = "home";

  /// path "/favorites"
  static String favorites = "favorites";

  /// path "/account"
  static String account = "account";

  /// path "/shopping-cart"
  static String shoppingCart = "shopping-cart";

  /// path "/products/:productId"
  /// required [Product] object
  static String product = "product";
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  routes: <RouteBase>[
    GoRoute(
      name: AppRouterNames.product,
      path: '/products/:productId',
      builder: (context, state) {
        return ProductPage(
          product: state.extra as Product,
        );
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // Return the widget that implements the custom shell (e.g a BottomNavigationBar).
        // The [StatefulNavigationShell] is passed to be able to navigate to other branches in a stateful way.
        return ScaffoldWithNavbar(navigationShell);
      },
      branches: [
        // The route branch for the 1º Tab
        StatefulShellBranch(
          navigatorKey: _navigatorKey,
          // Add this branch routes
          // each routes with its sub routes if available e.g feed/uuid/details
          routes: <RouteBase>[
            GoRoute(
              name: AppRouterNames.home,
              path: '/home',
              builder: (context, state) => const ProductsPage(),
              // routes: <RouteBase>[],
            ),
          ],
        ),

        // The route branch for 2º Tab
        StatefulShellBranch(
          routes: <RouteBase>[
            // Add this branch routes
            // each routes with its sub routes if available e.g shope/uuid/details
            GoRoute(
              name: AppRouterNames.favorites,
              path: '/favorites',
              builder: (context, state) {
                return const FavoritesPage();
              },
            ),
          ],
        ),

        StatefulShellBranch(
          routes: <RouteBase>[
            // Add this branch routes
            // each routes with its sub routes if available e.g shope/uuid/details
            GoRoute(
              name: AppRouterNames.account,
              path: '/account',
              builder: (context, state) {
                return const AccountPage();
              },
            ),
          ],
        ),

        StatefulShellBranch(
          routes: <RouteBase>[
            // Add this branch routes
            // each routes with its sub routes if available e.g shope/uuid/details
            GoRoute(
              name: AppRouterNames.shoppingCart,
              path: '/shopping-cart',
              builder: (context, state) {
                return const ShoppingCartPage();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
