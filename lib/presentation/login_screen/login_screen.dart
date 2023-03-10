
import 'package:bosala/business_logic/App_cubit/app_cubit.dart';
import 'package:bosala/presentation/register_screen/register_screen.dart';
import 'package:bosala/presentation/services_screen/services_screen.dart';
import 'package:bosala/styles/color_manager.dart';
import 'package:bosala/utiles/local/cash_helper.dart';
import 'package:bosala/widget/default_text_field.dart';
import 'package:bosala/widget/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../business_logic/App_cubit/app_states.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isPassword=false;
  late String phoneNumber;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){

        if(state is UserLoginSuccessStates){

            CashHelper.saveData(key: 'uId',value: state.uId);

            Navigator.push(context, MaterialPageRoute(builder: (_){

              return const ServicesScreen();

            }));
        }

        if(state is UserLoginErrorStates){

          customToast(title: 'البريد الالكتروني او كلمه المرور غير صحيحه', color: ColorManager.red);

        }




      },
      builder: (context,state){
        var cubit=AppCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: ColorManager.primaryColor,
            appBar: AppBar(
              toolbarHeight: 0.0,
              elevation: 0.0,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light,
                statusBarColor: ColorManager.primaryColor,
              ),
            ),
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SizedBox(height: MediaQuery.of(context).size.height * .035,),

                    Padding(
                      padding: const EdgeInsets.only(
                          top: 0, left: 30, right: 30),
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: MediaQuery.of(context).size.height * .35,
                      ),
                    ),


                    SizedBox(height: MediaQuery.of(context).size.height * .01,),


                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * .02),
                      child: DefaultTextField(
                        hintText: 'البريد الالكتروني',
                        controller: email,
                        isPass: false,
                        prefixIcon: Icons.person,
                        textInputType: TextInputType.text,
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * .035,),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * .02),
                      child: DefaultTextField(
                        hintText: 'كلمه المرور',
                        controller: password,
                        prefixIcon: Icons.lock,
                        isPass: true,
                        textInputType: TextInputType.text,
                      ),
                    ),

                    SizedBox(
                      height: size.height * .04,
                    ),

                    state is UserLoginLoadingStates?
                    const Center(
                      child: CircularProgressIndicator(color: ColorManager.white,),
                    ):
                    Container(
                      margin: EdgeInsets.all(MediaQuery.of(context).size.height*.02),
                      width: MediaQuery.of(context).size.width,
                      child: MaterialButton(
                        padding: const EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)
                        ),

                        color: ColorManager.textColor,
                        onPressed: (){

                          if(formKey.currentState!.validate()){

                            cubit.userLogin(
                                email: email.text,
                                password: password.text
                            );

                          }


                        },
                        child:Text('تسجيل الدخول',style: GoogleFonts.almarai(
                            fontWeight: FontWeight.w600,
                            fontSize: MediaQuery.of(context).size.height*.022,
                            color: ColorManager.white
                        ),),
                      ),
                    ),


                    SizedBox(
                      height: size.height * .04,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('لا تملك حسابا.؟',style: GoogleFonts.almarai(
                            fontWeight: FontWeight.w300,
                            fontSize: CashHelper.getData(key: CashHelper.languageKey).toString() == 'en'?MediaQuery.of(context).size.height*.022:MediaQuery.of(context).size.height*.025,
                            color: ColorManager.textColor),
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(
                          width: size.height * .007,
                        ),

                        GestureDetector(
                          onTap: (){

                            Navigator.push(context, MaterialPageRoute(builder: (_){

                              return const RegisterScreen();

                            }));

                          },
                          child: Text('انشاء حساب',style: GoogleFonts.almarai(
                              fontWeight: FontWeight.w700,
                              fontSize: MediaQuery.of(context).size.height*.022,
                              color: ColorManager.white
                          ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: size.height *.02),


                    TextButton(
                      onPressed: (){
                        // cubit.getUser(id: 'HtjmznoitMXJuRoNeDviXhMkh7A3');
                        // Navigator.push(context, MaterialPageRoute(builder: (_){
                        //
                        //   return const DriverScreen();
                        //
                        // }));
                        //
                        // print(cubit.driverModel!.name);
                        // print(cubit.driverModel!.isVerified);
                        // if (cubit.isCheckBoxTrue == true) {
                        //
                        //
                        //
                        // } else{
                        //   customToast(title:AppLocalizations.of(context)!.translate('privacyToast').toString(), color: Colors.red);
                        // }
                      },
                      child: Text(
                        'بوصلة -لمشاريع اعادة التدوير والمنتجات الصديقة للبيئة',
                        style: GoogleFonts.almarai(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w700,
                            color: ColorManager.textColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),


                    // GestureDetector(
                    //   onTap: (){
                    //
                    //     Navigator.push(context, MaterialPageRoute(builder: (_){
                    //
                    //       return const ViewDriverRequestScreen();
                    //
                    //     }));
                    //
                    //   },
                    //   child: Text(AppLocalizations.of(context)!.translate('admin').toString(),style: GoogleFonts.almarai(
                    //       fontWeight: FontWeight.w700,
                    //       fontSize: CashHelper.getData(key: CashHelper.languageKey).toString() == 'en'?MediaQuery.of(context).size.height*.022:MediaQuery.of(context).size.height*.025,
                    //       color: ColorManager.textColor
                    //   ),
                    //     textAlign: TextAlign.center,
                    //   ),
                    // ),






                  ],
                ),
              ),
            ),
          ),
        );

      },

    );
  }

}