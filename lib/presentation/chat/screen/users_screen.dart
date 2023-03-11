import 'package:bosala/business_logic/App_cubit/app_cubit.dart';
import 'package:bosala/business_logic/App_cubit/app_states.dart';
import 'package:bosala/presentation/chat/screen/chat_screen.dart';
import 'package:bosala/styles/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){

      },
      builder: (context,state){
        var cubit=AppCubit.get(context);
        return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: ColorManager.primaryColor,
              appBar: AppBar(
                  systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarIconBrightness: Brightness.light,
                    statusBarColor: ColorManager.primaryColor,
                  ),
                  elevation: 0.0,
                  backgroundColor: ColorManager.primaryColor,
                  title: Text('المحادثات',style:GoogleFonts.almarai(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.textColor,
                  ),)
              ),

              body: Container(
                padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context,index){
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_){
                                return ChatScreen(receiverModel: cubit.users[index]);
                              }));
                            },
                            child: Row(
                              children: [

                                Container(
                                  height: MediaQuery.of(context).size.height*0.06,
                                  width: MediaQuery.of(context).size.height*0.06,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(1000),
                                    color: ColorManager.white,
                                  ),

                                  child: Image(
                                    image: NetworkImage(cubit.users[index].image.toString()),
                                    fit: BoxFit.fill,
                                  ),
                                ),

                                SizedBox(width: MediaQuery.of(context).size.height*0.02,),

                                Text(
                                  '${cubit.users[index].name}',
                                  style:GoogleFonts.almarai(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: ColorManager.white,
                                  ),
                                ),

                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context,index){
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*0.02, vertical: MediaQuery.of(context).size.height*0.01),
                            child: const Divider(
                              thickness: 1,
                              color: ColorManager.textColor,
                            ),
                          );
                        },
                        itemCount: cubit.users.length,
                      ),
                    ),
                  ],
                ),
              ),
            )
        );
      },
    );
  }
}
