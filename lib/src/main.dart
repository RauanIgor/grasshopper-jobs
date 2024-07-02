import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grasshopper_jobs/app/shared/services/push_notification_service.dart';
import 'package:grasshopper_jobs/src/features/authentication/presentation/singin_page.dart';
import 'package:grasshopper_jobs/src/features/home/presentation/home_page.dart';
import 'package:grasshopper_jobs/src/features/splash/presentation/splash_page.dart';
import 'package:grasshopper_jobs/src/routes.dart' as routes;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  

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
          surface: Color(0xFF005366),
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Color(0xFF004356),
          onError: Colors.white,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.robotoSlabTextTheme(
          const TextTheme(
            bodyLarge: TextStyle(color: Colors.black),
            bodyMedium: TextStyle(color: Colors.black),
            bodySmall: TextStyle(color: Colors.black),
            titleLarge: TextStyle(color: Colors.black),
            titleMedium: TextStyle(color: Colors.black),
            titleSmall: TextStyle(color: Colors.black),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(3),
            ),
          ),
        ),
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
          page = const Scaffold(body: Center(child: Text("Error!")));
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
