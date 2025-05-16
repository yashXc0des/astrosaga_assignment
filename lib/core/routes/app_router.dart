import 'package:astrosagga_assignment/features/astrologers/presentation/screens/astrologer_details_screen.dart';
  import 'package:go_router/go_router.dart';
import '../../features/astrologers/presentation/screens/home_screen.dart';


class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/astrologer/:id',
        builder: (context, state) {
          final astrologerId = state.pathParameters['id'] ?? '';
          return AstrologerDetailScreen(astrologerId: astrologerId);
        },
      ),
    ],
  );
}
