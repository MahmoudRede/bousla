import 'package:bosala/business_logic/App_cubit/app_cubit.dart';
import 'package:bosala/business_logic/App_cubit/app_states.dart';
import 'package:bosala/styles/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';


class OpenProfileImage extends StatelessWidget {
  const OpenProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){

         if(state is UploadProfileImageSuccessState){

           // customToast(title: AppLocalizations.of(context)!.translate('profileImageSave').toString(), color: ColorManager.primary);
           // Navigator.pop(context);

         }

      },
      builder: (context,state){
        var cubit=AppCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(

              // title
              appBar: AppBar(
                backgroundColor: ColorManager.white,
                elevation: 0.0,
                title: Text('الصوره الشخصيه',
                  style: GoogleFonts.almarai(
                      color: ColorManager.black,
                      fontWeight: FontWeight.w500,
                      fontSize: MediaQuery.of(context).size.height*.03
                  ),),
                titleSpacing: 0,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: ColorManager.black,
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarIconBrightness: Brightness.dark,
                    statusBarColor: Colors.white
                ),
              ),

              body: SafeArea(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 10
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      SizedBox(height: MediaQuery.of(context).size.height*.02,),


                      // profile image
                      GestureDetector(
                        onTap: (){
                          cubit.getProfileImage();
                        },
                        child: Container(
                            height: MediaQuery.of(context).size.height*.6,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: ColorManager.primaryColor,
                              ),
                              image:DecorationImage(
                                image:  FileImage(cubit.profileImage!)
                              )
                          ),
                        ),
                      ),

                      const Spacer(),

                      // upload profile image
                      state is UploadProfileImageLoadingState ?
                      const Align(
                        alignment: Alignment.topRight,
                        child: CircularProgressIndicator(
                          color: ColorManager.primaryColor,
                        ),
                      ):
                      Align(
                        alignment: Alignment.topRight,
                        child: FloatingActionButton(
                          backgroundColor: ColorManager.primaryColor,
                          onPressed: (){
                            cubit.uploadUserImage().then((value) {
                              Navigator.pop(context);
                            });
                          },
                          child: const Icon(
                              Icons.arrow_back_ios
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.02,)

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
