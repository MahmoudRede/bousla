import 'dart:io';

import 'package:bosala/business_logic/App_cubit/app_cubit.dart';
import 'package:bosala/business_logic/App_cubit/app_states.dart';
import 'package:bosala/presentation/profile_screen/open_profile_image.dart';
import 'package:bosala/styles/color_manager.dart';
import 'package:bosala/utiles/local/cash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';



class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){

        if(state is PickProfileImageSuccessState){

          Navigator.push(context, MaterialPageRoute(builder: (_){
             return OpenProfileImage();
          }));
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
              title: Text('الصفحه الشخصيه',
                style: GoogleFonts.almarai(
                    color: ColorManager.primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.of(context).size.height*.025
                ),),
              titleSpacing: 0,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: ColorManager.primaryColor,
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
                color: Colors.white,
                child: Stack(
                  children: [

                    Container(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.height*.02),
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*.15),
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: ColorManager.primaryColor.withOpacity(.9),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(MediaQuery.of(context).size.height*.03),
                            topLeft:  Radius.circular(MediaQuery.of(context).size.height*.03),
                          )
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height*.06,),

                          // personal information
                          Text('المعلومات الشخصيه',
                              style: GoogleFonts.almarai(
                                  color: ColorManager.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: MediaQuery.of(context).size.height*.025
                              ),
                          ),

                          SizedBox(height: MediaQuery.of(context).size.height*.01,),

                          const Divider(color: Colors.white,),

                          SizedBox(height: MediaQuery.of(context).size.height*.02,),

                          // name
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Text('الاسم :',
                                  style: GoogleFonts.almarai(
                                      color: ColorManager.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: MediaQuery.of(context).size.height*.022
                                  ),                              ),

                              SizedBox(width: MediaQuery.of(context).size.height*.01,),

                              Expanded(
                                child: Text('${cubit.userModel!.name}',
                                  style: GoogleFonts.almarai(
                                      color: ColorManager.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: MediaQuery.of(context).size.height*.022
                                  ),
                                  overflow: TextOverflow.ellipsis,

                                ),
                              ),

                            ],
                          ),

                          SizedBox(height: MediaQuery.of(context).size.height*.02,),

                          // email
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Text('البريد الالكتروني :',
                                  style: GoogleFonts.almarai(
                                      color: ColorManager.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: MediaQuery.of(context).size.height*.022
                                  ),
                              ),

                              SizedBox(width: MediaQuery.of(context).size.height*.01,),

                              Expanded(
                                child: Text('${cubit.userModel!.email}',
                                  style: GoogleFonts.almarai(
                                      color: ColorManager.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: MediaQuery.of(context).size.height*.022
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),

                            ],
                          ),

                          SizedBox(height:  MediaQuery.of(context).size.height*.02,),

                          // phone
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Text('رقم الهاتف :',
                                  style: GoogleFonts.almarai(
                                      color: ColorManager.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: MediaQuery.of(context).size.height*.022
                                  ),
                              ),

                              SizedBox(width:  MediaQuery.of(context).size.height*.01,),

                              Expanded(
                                child: Text('${cubit.userModel!.phoneNumber}',
                                  style:GoogleFonts.almarai(
                                      color: ColorManager.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: MediaQuery.of(context).size.height*.022
                                  ),
                                  overflow: TextOverflow.ellipsis,

                                ),
                              ),
                            ],
                          ),

                          SizedBox(height:  MediaQuery.of(context).size.height*.02,),


                          SizedBox(height:  MediaQuery.of(context).size.height*.02,),

                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Divider(color: Colors.white,),
                          ),

                          SizedBox(height:  MediaQuery.of(context).size.height*.02,),

                          // call center
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Text('خدمه الدعم الفني :',
                                  style: GoogleFonts.almarai(
                                      color: ColorManager.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: MediaQuery.of(context).size.height*.022
                                  ),
                              ),

                              SizedBox(width:  MediaQuery.of(context).size.height*.02,),

                              Text('01277556432',style: GoogleFonts.almarai(
                                  color: ColorManager.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: MediaQuery.of(context).size.height*.022
                              ),  ),
                            ],
                          ),

                          SizedBox(height:  MediaQuery.of(context).size.height*.02,),

                        ],

                      ),
                    ),

                    // profile image
                    Positioned(
                      top:  MediaQuery.of(context).size.height*.04,
                      left:  MediaQuery.of(context).size.height*.02,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius:  MediaQuery.of(context).size.height*.08,
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.height*.078,
                              backgroundImage:NetworkImage(cubit.userModel!.image!),
                            ),
                          ),
                          Positioned(
                            right:  MediaQuery.of(context).size.height*.00,
                            bottom:  MediaQuery.of(context).size.height*.00,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                  onPressed: (){
                                    cubit.getProfileImage();
                                  },
                                  icon: const Icon(Icons.camera_alt)
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
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