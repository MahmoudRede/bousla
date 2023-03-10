import 'package:bosala/business_logic/App_cubit/app_cubit.dart';
import 'package:bosala/business_logic/App_cubit/app_states.dart';
import 'package:bosala/presentation/my_product_screen/my_product_screen.dart';
import 'package:bosala/styles/color_manager.dart';
import 'package:bosala/utiles/local/cash_helper.dart';
import 'package:bosala/widget/default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AddProductScreen extends StatelessWidget {

  static TextEditingController name=TextEditingController();
  static TextEditingController price=TextEditingController();
  static TextEditingController describtion=TextEditingController();
  
   @override
  var formKey=GlobalKey<FormState>();

   AddProductScreen({Key? key}) : super(key: key);

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
                // actions: [
                //   IconButton(
                //       onPressed: (){
                //
                //         Navigator.push(context, MaterialPageRoute(builder: (_){
                //           return const MyProductScreen();
                //         }));
                //
                //       },
                //       icon: const Icon(
                //           Icons.menu
                //       )
                //   )
                // ],
                elevation: 0.0,
                centerTitle: true,
                backgroundColor: ColorManager.primaryColor,
                title: Text('اضافه المنتج',style:GoogleFonts.cairo(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: ColorManager.textColor,
                ),),

              ),
              body: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('اضافه صوره المنتج :',style:GoogleFonts.almarai(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: ColorManager.textColor,
                        ),),

                        SizedBox(height: MediaQuery.of(context).size.height*.03,),

                        GestureDetector(
                          onTap: (){
                             cubit.getProductImage();
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              padding: EdgeInsets.all(11),
                              height: MediaQuery.of(context).size.height*.35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(
                                      color: ColorManager.textColor
                                  )
                              ),
                              child: cubit.productImage ==null?const Image(
                                  image: AssetImage('assets/images/recycle1.png')
                              ):
                              Image(
                                image: FileImage(cubit.productImage!),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: MediaQuery.of(context).size.height*.05,),
                        Text('ادخل اسم المنتج',style:GoogleFonts.almarai(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: ColorManager.textColor,
                        ),),
                        SizedBox(height: MediaQuery.of(context).size.height*.02,),

                        DefaultTextField(
                            hintText: 'اسم المنتج',
                            controller: name,
                            textInputType: TextInputType.text,
                            prefixIcon: Icons.recycling
                        ),

                        SizedBox(height: MediaQuery.of(context).size.height*.05,),
                        Text('ادخل سعر المنتج',style:GoogleFonts.almarai(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: ColorManager.textColor,
                        ),),
                        SizedBox(height: MediaQuery.of(context).size.height*.02,),

                        DefaultTextField(
                            hintText: 'سعر المنتج',
                            controller: price,
                            textInputType: TextInputType.text,
                            prefixIcon: Icons.money
                        ),


                        SizedBox(height: MediaQuery.of(context).size.height*.035,),
                        Text('ادخل وصف المنتج',style:GoogleFonts.almarai(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: ColorManager.textColor,
                        ),),
                        SizedBox(height: MediaQuery.of(context).size.height*.02,),

                        DefaultTextField(
                          hintText: 'وصف المنتج',
                          controller: describtion,
                          lines: 5,
                          textInputType: TextInputType.text,
                        ),

                        SizedBox(height: MediaQuery.of(context).size.height*.02,),



                        state is AddProductLoadingStates || state is UploadProductImageLoadingState?
                        const Center(
                          child: CircularProgressIndicator(color: ColorManager.white,),
                        ):
                        Container(
                          margin: EdgeInsets.all(MediaQuery.of(context).size.height*.02),
                          width: MediaQuery.of(context).size.width,
                          child: MaterialButton(
                            padding: EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7)
                            ),

                            color: ColorManager.textColor,
                            onPressed: (){

                              if(formKey.currentState!.validate()){
                                 
                                cubit.uploadProductImage(
                                    productName: name.text,
                                    productPrice: price.text,
                                    productDescription: describtion.text,
                                    productCategory: CashHelper.getData(key: 'Category')
                                );
                               

                              }

                              // Navigator.push(context, MaterialPageRoute(builder: (_){
                              //
                              //   return const ServicesScreen();
                              //
                              // }));


                            },
                            child:Text('اضافه المنتج',style: GoogleFonts.almarai(
                                fontWeight: FontWeight.w600,
                                fontSize: MediaQuery.of(context).size.height*.022,
                                color: ColorManager.white
                            ),),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
    );
  }
}
