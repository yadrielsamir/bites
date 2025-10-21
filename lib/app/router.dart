import 'package:bites/features/auth/presentation/pages/forgot_password.dart';
import 'package:bites/features/menu/presentation/home.dart';
import 'package:bites/features/orders/presentation/customize_item.dart';
import 'package:bites/features/orders/presentation/ordering_options.dart';
import 'package:go_router/go_router.dart';
import '../features/auth/presentation/pages/sign_in.dart';
import '../features/auth/presentation/pages/sign_up.dart';

final router = GoRouter(
  initialLocation: '/signin',
  routes: [
    GoRoute(
      name: 'signin',
      path: '/signin',
      builder: (context, state) => const SignInPage(),
      routes: [
        GoRoute(
          name: 'forgot_password',
          path: 'forgot_password',
          builder: (context, state) => const ForgotPasswordPage(),
        ),
        GoRoute(
          name: 'signup',
          path: 'signup',
          builder: (context, state) => const SignUpPage(),
        ),
      ],
    ),
    GoRoute(
      name: 'home',
      path: '/home',
      builder: (context, state) => const Home(),
      routes: [
        GoRoute(
          name: 'ordering_options',
          path: 'ordering_options',
          builder: (context, state) => OrderingOptions(),
        ),
        GoRoute(
          name: 'customize_item',
          path: 'customize_item',
          builder: (context, state) {
            final item = state.extra as Map<String, dynamic>;
            final price = item['price'];
            return CustomizeItem(item: item['item'], price: price);
          },
        ),
      ],
    ),
  ],
);
