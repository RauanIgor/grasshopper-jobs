import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grasshopper_jobs/firebase_options.dart';
import 'package:grasshopper_jobs/src/routes.dart' as routes;

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState(){
    initializeFirebase();
    super.initState();
  }

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    Navigator.pushReplacementNamed(context, routes.authPrefix);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF006276),
              Color(0xFF004356),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 170,
                height: 170,
              ),
              const Text(
                'GrasshopperJobs',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
