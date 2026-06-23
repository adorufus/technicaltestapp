import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:technicaltest/modules/auth/controller/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Task Tracker App", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateColor.resolveWith(
                  (state) => Colors.blue,
                ),
                foregroundColor: WidgetStateColor.resolveWith((state) => Colors.white)
              ),
              onPressed: () {
                controller.onLogin();
              },
              child: Text("Sign in with google"),
            ),
          ],
        ),
      ),
    );
  }
}
