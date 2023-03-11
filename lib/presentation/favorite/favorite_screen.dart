import 'package:bosala/business_logic/App_cubit/app_cubit.dart';
import 'package:bosala/business_logic/App_cubit/app_states.dart';
import 'package:bosala/styles/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
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
                  title: Text('المفضلة',style:GoogleFonts.almarai(
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
                      child: GridView.count(
                        crossAxisSpacing: MediaQuery.of(context).size.height*0.01,
                        mainAxisSpacing: MediaQuery.of(context).size.height*0.01,
                        childAspectRatio: 1/1.6,
                        crossAxisCount: 2,
                        children: List.generate(cubit.allFavorite.length, (index) => Container(
                          padding: EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*0.01),
                          decoration: BoxDecoration(
                              border: Border.all(color: ColorManager.textColor),
                              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.012)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  cubit.deleteFromFavorite(name: cubit.allFavorite[index]['name'], context: context);
                                  // cubit.switchFavorites(index);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.favorite,color: Colors.red,)
                                ),
                              ),
                              Image(
                                image: NetworkImage(cubit.allFavorite[index]['image'].toString()),
                                height: MediaQuery.of(context).size.height*.15,
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                              ),

                              const SizedBox(height: 15,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(cubit.allFavorite[index]['name'].toString(),style:GoogleFonts.almarai(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: ColorManager.white,
                                      )),
                                    ),
                                    Text('${cubit.allFavorite[index]['distance'].toString()} Om',style:GoogleFonts.almarai(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: ColorManager.red,
                                    )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                        ),
                      ),
                    )],
                ),
              ),
            )
        );
      },
    );
  }
}
