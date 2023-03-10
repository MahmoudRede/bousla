import 'package:bosala/business_logic/App_cubit/app_cubit.dart';
import 'package:bosala/presentation/add_product_screen/add_product_screen.dart';
import 'package:bosala/presentation/login_screen/login_screen.dart';
import 'package:bosala/presentation/register_screen/register_screen.dart';
import 'package:bosala/presentation/services_screen/services_screen.dart';
import 'package:bosala/presentation/splash_screen/splash_screen.dart';
import 'package:bosala/presentation/start_screen/start_screen.dart';
import 'package:bosala/utiles/local/cash_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();

  await CashHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) =>AppCubit()..getUser()..getProduct(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
