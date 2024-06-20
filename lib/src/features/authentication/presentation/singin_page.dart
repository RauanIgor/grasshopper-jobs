import 'package:flutter/material.dart';

class SingInForm extends StatelessWidget {
  SingInForm({required this.route, super.key});

  final String route;

  final GlobalKey<FormState> _signInFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Login",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Form(
          key: _signInFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 350,
                child: TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person_2_rounded),
                    hintText: "Email",
                  ),
                  validator: (value) {},
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 350,
                child: TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.key),
                    hintText: "Senha",
                  ),
                  validator: (value) {},
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot your password?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
