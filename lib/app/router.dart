import 'package:go_router/go_router.dart';
import '../features/auth/presentation/pages/login_page.dart';

final router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
    //GoRoute(path: '/', builder: (context, state) => const HomePage()),
  ],
);
