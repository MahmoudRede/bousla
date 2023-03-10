import 'package:bosala/presentation/login_screen/login_screen.dart';
import 'package:bosala/presentation/start_screen/start_screen.dart';
import 'package:bosala/styles/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    Future.delayed(const Duration(seconds: 2),(){

      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
      const LoginScreen()
      ), (Route<dynamic> route) => false);

    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      appBar: AppBar(
        toolbarHeight: 0.0,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: ColorManager.primaryColor,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
           Image(
            image: AssetImage(
              'assets/images/logo.png',
            ),
          )
        ],
      ),
    );
  }
}
