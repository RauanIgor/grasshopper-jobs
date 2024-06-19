import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grasshopper_jobs/firebase_options.dart';
import 'package:grasshopper_jobs/src/features/authentication/presentation/singin_page.dart';
import 'package:grasshopper_jobs/src/features/home/presentation/home_page.dart';
import 'package:grasshopper_jobs/src/features/splash/presentation/splash_page.dart';
import 'package:grasshopper_jobs/src/routes.dart' as routes;

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grasshopper Jobs',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          primary: Color(0xFF004356),
          inversePrimary: Color(0xFF005366),
          secondary: Color(0xFF006276),
          surface: Color(0xFFF2F2F2),
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Color(0xFF262626),
          onError: Colors.white,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      initialRoute: routes.root,
      onGenerateRoute: (settings) {
        late Widget page;
        if (settings.name == routes.root) {
          page = const SplashPage();
        } else if (settings.name!.startsWith(routes.authPrefix)) {
          final subRoute = settings.name!.substring(routes.authPrefix.length);
          page = SingInForm(route: subRoute);
        } else if (settings.name!.startsWith(routes.home)) {
          final subRoute = settings.name!.substring(routes.home.length);
          page = HomePage(route: subRoute);
        } else {
          // Route not found
          page = const Center(child: Text("Error!"));
        }

         return MaterialPageRoute(
          builder: (context) {
            return page;
          },
          settings: settings,
        );
      },
    );
  }
}

