import 'package:bosala/presentation/add_product_screen/add_product_screen.dart';
import 'package:bosala/presentation/login_screen/login_screen.dart';
import 'package:bosala/presentation/services_screen/services_screen.dart';
import 'package:bosala/styles/color_manager.dart';
import 'package:bosala/widget/defualtButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      appBar: AppBar(
        toolbarHeight: 0.0,
        elevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: ColorManager.primaryColor,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [

          SizedBox(height: MediaQuery.of(context).size.height*.03,),

          const Image(
            image: AssetImage(
              'assets/images/logo.png',
            ),
          ),

          SizedBox(height: MediaQuery.of(context).size.height*.08,),

          Padding(
            padding:  EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height*.04
            ),
            child: DefaultButton(
                buttonText: 'صاحب منتج',
                color: ColorManager.textColor,
                color2: ColorManager.textColor,
                onPressed: (){

                  Navigator.push(context, MaterialPageRoute(builder: (_){
                    return  AddProductScreen();
                  }));

                }
            ),
          ),

          SizedBox(height: MediaQuery.of(context).size.height*.05,),

          Padding(
            padding:  EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height*.04
            ),
            child: DefaultButton(
                buttonText: 'مشتري',
                color: ColorManager.darkGrey,
                color2: ColorManager.darkGrey,
                onPressed: (){

                  Navigator.push(context, MaterialPageRoute(builder: (_){
                    return const ServicesScreen();
                  }));

                }
            ),
          ),
        ],
      ),
    );
  }
}
