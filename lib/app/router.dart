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
          name: 'signup',
          path: 'signup',
          builder: (context, state) => const SignUpPage(),
        ),
      ],
    ),
    //GoRoute(path: '/', builder: (context, state) => const HomePage()),
  ],
);
