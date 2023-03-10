import 'package:bosala/styles/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProductScreen extends StatelessWidget {
  const MyProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorManager.primaryColor,
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: ColorManager.primaryColor,
            title: Text('معروضاتي',style:GoogleFonts.almarai(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: ColorManager.textColor,
            ),)

        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1/1.1,
                  crossAxisCount: 2,
                  children: List.generate(5, (index) => Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorManager.textColor),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      children: [
                        const Image(
                          image: AssetImage('assets/images/logo.png'),
                        ),
                        Text(' المنتج رقم ${index+1}',style:GoogleFonts.almarai(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: ColorManager.white,
                        )),
                      ],
                    ),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
