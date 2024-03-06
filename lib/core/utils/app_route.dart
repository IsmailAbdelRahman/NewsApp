import 'package:go_router/go_router.dart';
import 'package:newsappnew/core/widget/bottom_app.dart';
import 'package:newsappnew/feature/business/presetation/views/widget/body_business.dart';
import 'package:newsappnew/feature/science/presetation/views/home_view_science_app.dart';
import 'package:newsappnew/feature/sports/presetation/views/sports_view.dart';

class AppRoute {
  static const String science = "/sin";
  static const String bodyBussines = "/BodyBussines";
  static const String sportView = "/SportView";

  static final GoRouter goRouter = GoRouter(routes: [
    GoRoute(path: "/", builder: (context, state) => const BottomApp()),
    GoRoute(path: science, builder: (context, state) => const ScienceView()),
    GoRoute(
        path: bodyBussines, builder: (context, state) => const BodyBussines()),
    GoRoute(
      path: sportView,
      builder: (context, state) => const SportView(),
    )
  ]);
}
