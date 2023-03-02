
   import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

             class CustomButton extends StatelessWidget {
               final String text;
               final void Function()? onPressed;
               Color mycolor;
                CustomButton({Key? key, required this.text, this.onPressed,required this.mycolor}) : super(key: key);

               @override
               Widget build(BuildContext context) {
                 return Container(

                   width: 150,
                   height: 75,
                   decoration: BoxDecoration(
                     color: mycolor,
                     borderRadius: BorderRadius.circular(30)
                   ),
                   child: InkWell(
                     onTap:onPressed,
                     child: Container(
                       child: Center(
                         child: Text(text,style:GoogleFonts.almarai(
                           fontSize:14,
                           letterSpacing: 3,
                           fontWeight: FontWeight.bold,
                           color: Colors.white
                         )),
                       ),
                     ),
                   ),
                 );
               }
             }
