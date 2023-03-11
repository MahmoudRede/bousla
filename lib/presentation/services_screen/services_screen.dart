import 'package:bosala/business_logic/App_cubit/app_cubit.dart';
import 'package:bosala/business_logic/App_cubit/app_states.dart';
import 'package:bosala/presentation/about_app/about_app.dart';
import 'package:bosala/presentation/chat/screen/users_screen.dart';
import 'package:bosala/presentation/favorite/favorite_screen.dart';
import 'package:bosala/presentation/profile_screen/profile_screen.dart';
import 'package:bosala/presentation/start_screen/start_screen.dart';
import 'package:bosala/styles/color_manager.dart';
import 'package:bosala/utiles/local/cash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({Key? key}) : super(key: key);

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
                    title: Text('المعروضات',style:GoogleFonts.almarai(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: ColorManager.textColor,
                    ),)

                ),
                drawer: Drawer(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height*.05,
                            color: ColorManager.primaryColor
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height*.3,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/logo.png'),
                              ),
                              color: ColorManager.primaryColor
                          ),
                        ),

                        SizedBox(height: MediaQuery.of(context).size.height*.015,),

                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_){
                              return const ProfileScreen();
                            }));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Text('الحساب الشخصي',style: GoogleFonts.almarai(
                                    fontWeight: FontWeight.w600,
                                    fontSize: MediaQuery.of(context).size.height*.024,
                                    color: ColorManager.textColor
                                ),),
                                const Spacer(),
                                const Icon(Icons.arrow_back_ios,color: ColorManager.primaryColor)
                              ],
                            ),
                          ),
                        ),

                        // favorite
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_){
                              return const FavoriteScreen();
                            }));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Text('المفضلة',style: GoogleFonts.almarai(
                                    fontWeight: FontWeight.w600,
                                    fontSize: MediaQuery.of(context).size.height*.024,
                                    color: ColorManager.textColor
                                ),),
                                const Spacer(),
                                const Icon(Icons.arrow_back_ios,color: ColorManager.primaryColor)
                              ],
                            ),
                          ),
                        ),


                        // chat
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_){
                              return const UsersScreen();
                            }));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Text('المحادثات',style: GoogleFonts.almarai(
                                    fontWeight: FontWeight.w600,
                                    fontSize: MediaQuery.of(context).size.height*.024,
                                    color: ColorManager.textColor
                                ),),
                                const Spacer(),
                                const Icon(Icons.arrow_back_ios,color: ColorManager.primaryColor)
                              ],
                            ),
                          ),
                        ),

                        // منتجات مُعاد تدويرها
                        GestureDetector(
                          onTap: (){
                            CashHelper.saveData(key: 'Category',value: 'منتجات مُعاد تدويرها');
                            Navigator.push(context, MaterialPageRoute(builder: (_){

                              return const StartScreen();

                            }));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Text('منتجات مُعاد تدويرها',style: GoogleFonts.almarai(
                                    fontWeight: FontWeight.w600,
                                    fontSize: MediaQuery.of(context).size.height*.024,
                                    color: ColorManager.textColor
                                ),),
                                const Spacer(),
                                const Icon(Icons.arrow_back_ios,color: ColorManager.primaryColor)
                              ],
                            ),
                          ),
                        ),


                        // منتجات صديقة للبيئة
                        GestureDetector(
                          onTap: (){
                            CashHelper.saveData(key: 'Category',value: 'منتجات صديقة للبيئة');

                            Navigator.push(context, MaterialPageRoute(builder: (_){

                              return const StartScreen();

                            }));

                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Text('منتجات صديقة للبيئة',style: GoogleFonts.almarai(
                                    fontWeight: FontWeight.w600,
                                    fontSize: MediaQuery.of(context).size.height*.024,
                                    color: ColorManager.textColor
                                ),),
                                const Spacer(),
                                const Icon(Icons.arrow_back_ios,color: ColorManager.primaryColor)
                              ],
                            ),
                          ),
                        ),

                        // تجارة صناعية-زراعية
                        GestureDetector(
                          onTap: (){

                            CashHelper.saveData(key: 'Category',value: 'تجارة صناعية-زراعية');

                            Navigator.push(context, MaterialPageRoute(builder: (_){

                              return const StartScreen();

                            }));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Text('تجارة صناعية-زراعية',style: GoogleFonts.almarai(
                                    fontWeight: FontWeight.w600,
                                    fontSize: MediaQuery.of(context).size.height*.024,
                                    color: ColorManager.textColor
                                ),),
                                const Spacer(),
                                const Icon(Icons.arrow_back_ios,color: ColorManager.primaryColor)
                              ],
                            ),
                          ),
                        ),


                        // خدمات
                        GestureDetector(
                          onTap: (){

                            CashHelper.saveData(key: 'Category',value: 'خدمات');

                            Navigator.push(context, MaterialPageRoute(builder: (_){

                              return const StartScreen();

                            }));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Text('خدمات',style: GoogleFonts.almarai(
                                    fontWeight: FontWeight.w600,
                                    fontSize: MediaQuery.of(context).size.height*.024,
                                    color: ColorManager.textColor
                                ),),
                                const Spacer(),
                                const Icon(Icons.arrow_back_ios,color: ColorManager.primaryColor)
                              ],
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_){
                              return const AboutApp();
                            }));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Text('من نحن',style: GoogleFonts.almarai(
                                    fontWeight: FontWeight.w600,
                                    fontSize: MediaQuery.of(context).size.height*.024,
                                    color: ColorManager.textColor
                                ),),
                                const Spacer(),
                                const Icon(Icons.arrow_back_ios,color: ColorManager.primaryColor)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                        children: List.generate(cubit.allProducts.length, (index) => Container(
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
                        cubit.addToFavorite(
                            name: cubit.allProducts[index].productName.toString(),
                            distance: cubit.allProducts[index].productPrice.toString(),
                            image: cubit.allProducts[index].productImage.toString(),
                            context: context,
                        );
                        cubit.switchFavorites(index);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: cubit.isFavorites[index]==true?
                        const Icon(Icons.favorite,color: Colors.red,):
                        const Icon(Icons.favorite_border,color: Colors.red,),
                      ),
                    ),
                     Image(
                      image: NetworkImage(cubit.allProducts[index].productImage!),
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
                            child: Text(cubit.allProducts[index].productName!,style:GoogleFonts.almarai(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: ColorManager.white,
                            )),
                          ),
                          Text('${cubit.allProducts[index].productPrice!} Om',style:GoogleFonts.almarai(
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
