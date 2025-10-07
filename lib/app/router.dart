import 'package:bites/features/auth/presentation/pages/forgot_password.dart';
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
    //GoRoute(path: '/', builder: (context, state) => const HomePage()),
  ],
);
