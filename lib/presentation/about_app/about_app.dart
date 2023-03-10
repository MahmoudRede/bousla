import 'package:bosala/business_logic/App_cubit/app_cubit.dart';
import 'package:bosala/business_logic/App_cubit/app_states.dart';
import 'package:bosala/styles/color_manager.dart';
import 'package:bosala/widget/default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({Key? key}) : super(key: key);

  static TextEditingController observation=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        Size size = MediaQuery.of(context).size;
        var cubit=AppCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(

            // title
            appBar: AppBar(
              elevation: 5.0,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light,
                statusBarColor: ColorManager.primaryColor,
              ),
              backgroundColor: ColorManager.primaryColor,
              title: Text('من نحن',
                style: GoogleFonts.almarai(
                    color: ColorManager.white,
                    fontWeight: FontWeight.w500,
                    fontSize: size.height*.030
                ),),
              titleSpacing: 0,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: ColorManager.white,
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),

            ),


            body: Container(
              color: ColorManager.primaryColor,
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height*.01,
                left: MediaQuery.of(context).size.height*.02,
                right: MediaQuery.of(context).size.height*.02,
                bottom: MediaQuery.of(context).size.height*.02,
              ),
              child: ListView(
                children: [

                  Text(
                    'فريق بيئي من مدرسة المعمورة للتعليم الأساسي ، مشارك بمشروع بوصلة( ادارة النفايات ) ضمن مسابقة نمط للمدارس الحكومية والتي تنظمها جمعية البيئة العمانية',
                    style: GoogleFonts.almarai(
                        color: ColorManager.white,
                        height: 2,
                        fontWeight: FontWeight.w500,
                        fontSize: MediaQuery.of(context).size.height*.022
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*.06,),

                  Text('للملاحظات :',style:GoogleFonts.almarai(
                    fontSize: MediaQuery.of(context).size.height*.025,
                    fontWeight: FontWeight.w700,
                    color: ColorManager.white,
                  ),),
                  SizedBox(height: MediaQuery.of(context).size.height*.03,),

                  DefaultTextField(
                    hintText: 'ادخل هنا الملاحظه...',
                    controller: observation,
                    lines: 5,
                    textInputType: TextInputType.text,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*.06,),

                  Text('للتواصل :',style:GoogleFonts.almarai(
                    fontSize: MediaQuery.of(context).size.height*.025,
                    fontWeight: FontWeight.w700,
                    color: ColorManager.white,
                  ),),

                  SizedBox(height: MediaQuery.of(context).size.height*.01,),

                  Text('busla.almamora@gmail.com',style:GoogleFonts.almarai(
                    fontSize: MediaQuery.of(context).size.height*.025,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.white,
                  ),),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
