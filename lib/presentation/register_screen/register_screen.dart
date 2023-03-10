
import 'package:bosala/business_logic/App_cubit/app_cubit.dart';
import 'package:bosala/styles/color_manager.dart';
import 'package:bosala/widget/default_text_field.dart';
import 'package:bosala/widget/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../business_logic/App_cubit/app_states.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  var formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
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

        if(state is UserRegisterSuccessStates){

          Navigator.pop(context);

        }

        if(state is UserRegisterErrorStates){

          customToast(title: 'حدث خطا رجاء اعاده انشاء حساب', color: ColorManager.red);

        }


      },
      builder: (context,state){
        var cubit=AppCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: ColorManager.primaryColor,
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                          top: 0, left: 30, right: 30),
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: MediaQuery.of(context).size.height * .32,
                      ),
                    ),



                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * .02),
                      child: DefaultTextField(
                        hintText: 'الاسم',
                        controller: name,
                        isPass: false,
                        prefixIcon: Icons.person,
                        textInputType: TextInputType.text,
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * .025,),

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

                    SizedBox(height: MediaQuery.of(context).size.height * .025,),

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

                    SizedBox(height: MediaQuery.of(context).size.height * .025,),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * .02),
                      child: DefaultTextField(
                        hintText:'رقم الهاتف',
                        controller: phone,
                        prefixIcon: Icons.phone,
                        isPass: false,
                        textInputType: TextInputType.phone,
                      ),
                    ),

                    SizedBox(
                      height: size.height * .04,
                    ),

                    state is SaveUserLoadingStates|| state is UserRegisterLoadingStates?
                    const Center(
                      child: CircularProgressIndicator(color: ColorManager.white,),
                    ):
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.height*.155,
                        vertical: MediaQuery.of(context).size.height*.018,
                      ),
                      color: ColorManager.textColor,
                      onPressed: (){


                        if(formKey.currentState!.validate()){

                          cubit.userRegister(
                              email: email.text,
                              password: password.text,
                              name: name.text,
                              phone: phone.text,
                          );

                        }

                      },
                      child:Text('انشاء حساب',style: GoogleFonts.almarai(
                          fontWeight: FontWeight.w600,
                          fontSize: MediaQuery.of(context).size.height*.022,
                          color: ColorManager.white
                      ),),
                    ),

                    SizedBox(
                      height: size.height * .04,
                    ),



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