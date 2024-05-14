import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/Notifications/notifications.dart';
import 'package:news_app/models/articles_model.dart';
import 'screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Notifications().configuration();
  runApp(const MyApp());
  await Notifications().createInstantNotification();
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/discover',
      name: 'discover',
      builder: (BuildContext context, GoRouterState state) {
        return const DiscoverScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'article',
          name: 'article',
          builder: (BuildContext context, GoRouterState state) {
            final article = state.extra! as Article;
            return ArticleScreen(
              article: article,
            );
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Notifications notifications = Notifications();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: _router,
          );
        });
  }

  @override
  void initState() {
    notifications.checkingPermissionsNotification(context);
    notifications.startListeningNotificationEvents();
    super.initState();
  }
}
